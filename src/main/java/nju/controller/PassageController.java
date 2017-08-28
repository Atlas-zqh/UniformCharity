package nju.controller;

import nju.domain.Passage;
import nju.service.PassageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by island on 2017/8/28.
 */
@Controller
@RequestMapping("/passageAction")
public class PassageController {
    @Autowired
    private PassageService passageService;

    @RequestMapping(value = "/addPassage", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addPassage(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();

        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Passage passage = new Passage(title, content);

        passageService.addPassage(passage);

        map.put("success", "true");

        return map;
    }

    @RequestMapping(value = "/findPassage", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> findPassage(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();

        List<Passage> passages = passageService.findAllPassages(1, 10).getList();

        while (passages.size() < 10) {
            for (int i = 0; i < passages.size(); i++) {
                if (passages.size() < 10)
                    passages.add(passages.get(i));
                else
                    break;
            }
        }

        map.put("success", "true");
        map.put("passages", passages);

        return map;
    }
}
