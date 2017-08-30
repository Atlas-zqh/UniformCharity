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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
}