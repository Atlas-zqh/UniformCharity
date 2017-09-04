package nju.controller;

import nju.domain.SClass;
import nju.domain.School;
import nju.domain.Type;
import nju.domain.User;
import nju.service.SchoolService;
import nju.service.TypeService;
import nju.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by island on 2017/7/18.
 */
@Controller
@RequestMapping("/schoolAction")
public class SchoolController {
    @Autowired
    private SchoolService schoolService;

    @Autowired
    private TypeService typeService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/allSchool", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAllSchool() {
        Map<String, Object> map = new HashMap();
        List<School> schools = schoolService.getAllSchools();
        List<String> s = new ArrayList<>();
        for (int i = 0; i < schools.size(); i++) {
            s.add(schools.get(i).getSchoolName());
            System.out.println(schools.get(i).getSchoolName());
        }
        map.put("success", "true");
        map.put("schools", s);
        return map;
    }

    @RequestMapping(value = "/allGradesOfSchool", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllGrades(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        String school = request.getParameter("school");
        Map<String, List<String>> grades = schoolService.findClassBySchool(school);

        List<String> gs = new ArrayList<>();
        for (String s : grades.keySet()) {
            gs.add(s);
        }

        map.put("success", "true");
        map.put("grades", gs);
        return map;
    }

    @RequestMapping(value = "/allClassesOfGrade", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllClasses(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        String school = request.getParameter("school");
        String grade = request.getParameter("grade");

        Map<String, List<String>> grades = schoolService.findClassBySchool(school);

        List<String> cs = new ArrayList<>();
        for (String s : grades.keySet()) {
            if (s.equals(grade)) {
                cs = grades.get(s);
            }
        }

        map.put("success", "true");
        map.put("classes", cs);
        return map;
    }

    @RequestMapping(value = "/allCities", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAllCities() {
        Map<String, Object> map = new HashMap();

        List<String> cities = schoolService.getAllCities();

        map.put("success", "true");
        map.put("cities", cities);
        return map;
    }

    @RequestMapping(value = "/getDistricts", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getDistricts(HttpServletRequest request) {
        Map<String, Object> map = new HashMap();

        String city = request.getParameter("city");

        List<String> districts = schoolService.getAllDistrictsByCity(city);

        map.put("success", "true");
        map.put("districts", districts);
        return map;
    }

    @RequestMapping(value = "/getSchools", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getSchools(HttpServletRequest request) {
        Map<String, Object> map = new HashMap();

        String city = request.getParameter("city");
        String district = request.getParameter("district");

        List<School> schools = schoolService.findSchoolByCityAndDistrict(city, district);

        List<String> schoolNames = new ArrayList<>();

        for (int i = 0; i < schools.size(); i++) {
            schoolNames.add(schools.get(i).getSchoolName());
        }
        map.put("success", "true");
        map.put("schools", schoolNames);
        return map;
    }

    @RequestMapping(value = "/getAllGrades", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllGrades(HttpServletRequest request) {
        Map<String, Object> map = new HashMap();

        String school = request.getParameter("school");
        Map<String, List<String>> grades = schoolService.findClassBySchool(school);

        List<String> gradeList = new ArrayList<String>(grades.keySet());


        int max_num = 0;
        for (String g : grades.keySet()) {
            if (grades.get(g).size() > max_num) {
                max_num = grades.get(g).size();
            }
        }

        System.out.println("==================================");
        System.out.println("school：" + school);
        System.out.println("max_num：" + max_num);
        System.out.println("gradeList：" + gradeList.size());
        System.out.println("==================================");


        map.put("success", "true");
        map.put("grades", gradeList);
        map.put("classes", max_num);
        return map;
    }

    @RequestMapping(value = "/getClassesOfGrade", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getClassesOfGrade(HttpServletRequest request) {
        Map<String, Object> map = new HashMap();

        String school = request.getParameter("school");
        String grade = request.getParameter("grade");
        Map<String, List<String>> grades = schoolService.findClassBySchool(school);

        for (String g : grades.keySet()) {
            if (g.equals(grade)) {
                map.put("success", "true");
                map.put("classes", grades.get(g));
            }
        }

        return map;
    }

    @RequestMapping(value = "/findSchoolByName", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> findSchoolByName(HttpServletRequest request) {
        Map<String, Object> map = new HashMap();

        String schoolName = request.getParameter("name");

        List<School> schools = schoolService.findSchoolByName(schoolName);

        List<Type> types = typeService.findAllTypesOfSchool(schoolName);

        List<User> users = userService.findUserBySchool(schoolName);

        Map<String, List<String>> classes = schoolService.findClassBySchool(schoolName);

        List<String> grades = new ArrayList<>();
        for (String grade : classes.keySet()) {
            grades.add(grade + ";" + classes.get(grade).size());
        }
        if (schools != null && schools.size() > 0) {
            School school = schools.get(0);
            map.put("success", "true");
            map.put("school", school);
            map.put("types", types);
            map.put("students", users);
            map.put("grades", grades);
        } else {
            map.put("success", "false");
        }
        return map;
    }

    @RequestMapping(value = "/addSchool", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addSchool(HttpServletRequest request) {
        Map<String, Object> map = new HashMap();


        String schoolName = request.getParameter("name");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String gradeList = request.getParameter("grade");
        String classList = request.getParameter("class");


        System.out.println("==================================");
        System.out.println("schoolName:" + schoolName);
        System.out.println("city:" + city);
        System.out.println("district:" + district);
        System.out.println("grade:" + gradeList);
        System.out.println("class:" + classList);
        System.out.println("==================================");

        School school = new School(schoolName, city.split("市")[0], district.split("区")[0], true);
        schoolService.addSchool(school);
//        Map<Integer, Integer> grade = new HashMap<>();
        String[] grades = gradeList.split(";");
        String[] classes = classList.split(";");
//        for(int i = 0; i < grades.length; i++){
//            grade.put(Integer.parseInt(grades[i]), Integer.parseInt(classes[i]));
//        }

        for (int i = 0; i < grades.length; i++) {
            for(int j = 0; j < i; j++){
                if(grades[i].equals(grades[j])){
                    map.put("success", "false");
                    map.put("error", "请勿输入相同的入学年份！");
                    return map;
                }
            }
        }

        for (int i = 0; i < grades.length; i++) {
            for (int j = 1; j <= Integer.parseInt(classes[i]); j++) {
                SClass sClass = new SClass(schoolName, grades[i], j + "");
                schoolService.addClass(sClass);
            }
        }

        map.put("success", "true");
        map.put("error", "添加学校失败...");
        return map;
    }

    @RequestMapping(value = "/modifyGrades", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> modifyGrades(HttpServletRequest request) {
        Map<String, Object> map = new HashMap();


        String schoolName = request.getParameter("name");
        String gradeList = request.getParameter("grade");
        String classList = request.getParameter("class");


        System.out.println("==================================");
        System.out.println("schoolName:" + schoolName);
        System.out.println("grade:" + gradeList);
        System.out.println("class:" + classList);
        System.out.println("==================================");

        Map<String, List<String>> classMap = schoolService.findClassBySchool(schoolName);
//        schoolService.

//        Map<Integer, Integer> grade = new HashMap<>();
        String[] grades = gradeList.split(";");
        String[] classes = classList.split(";");
//        for(int i = 0; i < grades.length; i++){
//            grade.put(Integer.parseInt(grades[i]), Integer.parseInt(classes[i]));
//        }

        for (int i = 0; i < grades.length; i++) {
            for(int j = 0; j < i; j++){
                if(grades[i].equals(grades[j])){
                    map.put("success", "false");
                    map.put("error", "请勿输入相同的入学年份！");
                    return map;
                }
            }
        }

        for (int i = 0; i < grades.length; i++) {
            for (int j = 1; j <= Integer.parseInt(classes[i]); j++) {
                SClass sClass = new SClass(schoolName, grades[i], j + "");
//                schoolService.addClass(sClass);
            }
        }

        map.put("success", "true");
        map.put("error", "修改班级信息失败...");
        return map;
    }
}