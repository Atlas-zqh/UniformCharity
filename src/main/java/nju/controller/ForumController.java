package nju.controller;

import com.github.pagehelper.PageInfo;
import nju.domain.*;
import nju.service.BBSService;
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
 * Created by island on 2017/8/6.
 */
@Controller
@RequestMapping("/forumAction")
public class ForumController {

    @Autowired
    private BBSService bbsService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/getAllBoards", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAllBoards() {
        Map<String, Object> map = new HashMap();

        List<Board> boards = bbsService.getAllBoards();

        map.put("success", "true");
        map.put("boards", boards);

        return map;
    }

    @RequestMapping(value = "/getPostsByBoard", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getPostsByBoard(HttpServletRequest request) {
        Map<String, Object> map = new HashMap();
        int board = Integer.parseInt(request.getParameter("board"));
        int page = Integer.parseInt(request.getParameter("page"));

        System.out.println("board_id: " + board);
        System.out.println("page: " + page);

        PageInfo<Post> posts = bbsService.getPostsByBoard(board, page, 20);

        List<Post> postList = posts.getList();
        List<User> userList = new ArrayList<>();
        try {
            for (int i = 0; i < postList.size(); i++) {
                userList.add(userService.findUserByID(postList.get(i).getPost_uid()));
            }
            map.put("success", "true");
            map.put("posts", postList);
            map.put("users", userList);
            map.put("maxPage", posts.getPages());
        }catch (Exception e){
            e.printStackTrace();
            map.put("success", "false");
        }


        return map;
    }


}
