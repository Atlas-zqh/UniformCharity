package nju.controller;

import nju.domain.Board;
import nju.domain.Clothes;
import nju.domain.Order;
import nju.service.BBSService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by island on 2017/8/6.
 */
@Controller
@RequestMapping("/forumAction")
public class ForumController {

    @Autowired
    private BBSService bbsService;

    @RequestMapping(value = "/getAllBoards", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAllBoards() {
        Map<String, Object> map = new HashedMap();

        List<Board> boards = bbsService.getAllBoards();
        System.out.println("boards!!!!!!!!!");
        System.out.println(boards.size());

        List<String> boardNames = new ArrayList<>();

        for(int i = 0; i < boards.size(); i++){
            System.out.println(i);
            System.out.println(boards.get(i).getBoard_id());
            System.out.println(boards.get(i).getBoard_name());
            boardNames.add(boards.get(i).getBoard_name());
        }

        map.put("success", "true");
        map.put("boards", boardNames);

        return map;
    }
}
