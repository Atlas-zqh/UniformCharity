package nju.controller;

import nju.domain.School;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by island on 2017/7/19.
 */
@Controller
@RequestMapping("/clothesAction")
public class ClothesController {

    @RequestMapping(value = "/uploadClothes", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadClothes() {
        Map<String, Object> map = new HashedMap();
        System.out.println(1);
//        List<String> s = new ArrayList<>();
//        for(int i = 0; i < schools.size(); i++){
//            s.add(schools.get(i).getSchoolName());
//            System.out.println(schools.get(i).getSchoolName());
//        }
//        map.put("success", "true");
//        map.put("schools", s);
        return map;
    }
}
