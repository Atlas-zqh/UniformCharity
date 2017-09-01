package nju.controller;

import nju.domain.School;
import nju.domain.Type;
import nju.domain.User;
import nju.service.SchoolService;
import nju.service.TypeService;
import nju.service.UserService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

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
        for(int i = 0; i < schools.size(); i++){
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
        for(String s: grades.keySet()){
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
        for(String s: grades.keySet()){
            if(s.equals(grade)) {
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

        for (int i = 0; i < schools.size(); i++){
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
        for(String g: grades.keySet()){
            if(grades.get(g).size() > max_num){
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

        for(String g: grades.keySet()){
            if(g.equals(grade)){
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
        for(String grade: classes.keySet()){
            grades.add(grade + ";" + classes.get(grade).size());
        }
        if(schools != null && schools.size() > 0) {
            School school = schools.get(0);
            map.put("success", "true");
            map.put("school", school);
            map.put("types", types);
            map.put("students", users);
            map.put("grades", grades);
        }else{
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
        //todo addSchool
        Map<Integer, Integer> grade = new HashMap<>();
        String[] grades = gradeList.split(";");
        String[] classes = classList.split(";");
        for(int i = 0; i < grades.length; i++){
            grade.put(Integer.parseInt(grades[i]), Integer.parseInt(classes[i]));
        }
        //todo addClass
        return map;
    }

    @RequestMapping(value = "/addType", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addType(HttpServletRequest request) {
        Map<String, Object> map = new HashMap();

        String name = request.getParameter("name");
        String price = request.getParameter("price");


        System.out.println("==================================");
        System.out.println("typeName:" + name);
        System.out.println("price:" + price);
        System.out.println("==================================");


        return map;
    }

    @RequestMapping(value = "/uploadTypePic", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadClothesPics(HttpServletRequest request, HttpSession session) {
        Map<String, Object> map = new HashMap<>();

        MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        MultipartHttpServletRequest multipartRequest = resolver.resolveMultipart(request);
        MultipartFile multipartFile = multipartRequest.getFile("file");
        String name = multipartRequest.getParameter("name");
        String price = multipartRequest.getParameter("price");
        String school = multipartRequest.getParameter("schoolNameInput");


        if (multipartFile != null) {
            String trueFileName = school.hashCode() + name.hashCode() + String.valueOf(System.currentTimeMillis()) + ".jpg";
            String path = session.getServletContext().getRealPath("/") + "static/clothesPics/" + trueFileName;
            String p = "../static/clothesPics/" + trueFileName;
            try {
                multipartFile.transferTo(new File(path));
            } catch (IOException e) {
                e.printStackTrace();
            }
            System.out.println("==================================");
            System.out.println("name：" + name);
            System.out.println("price：" + price);
            System.out.println("school：" + school);
            System.out.println("path：" + path);
            System.out.println("==================================");
            Type type = new Type(school, name, Double.parseDouble(price), p);
            typeService.addType(type);
            map.put("success", "true");
        } else {
            map.put("success", "false");
        }

        return map;
    }
}