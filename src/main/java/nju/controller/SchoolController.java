package nju.controller;

import nju.domain.School;
import nju.service.SchoolService;
import nju.service.UserService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
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

    @RequestMapping(value = "/allSchool", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAllSchool() {
        Map<String, Object> map = new HashedMap();
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
}