package nju.controller;

import com.github.pagehelper.PageInfo;
import javafx.geometry.Pos;
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
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.*;

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
        List<String> times = new ArrayList<>();
        try {
            for (int i = 0; i < postList.size(); i++) {
                userList.add(userService.findUserByID(postList.get(i).getPost_uid()));
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                times.add(simpleDateFormat.format(new Date(postList.get(i).getPost_createtime())));
            }
            map.put("success", "true");
            map.put("posts", postList);
            map.put("users", userList);
            map.put("times", times);
            map.put("maxPage", posts.getPages());
        }catch (Exception e){
            e.printStackTrace();
            map.put("success", "false");
        }


        return map;
    }


    @RequestMapping(value = "/insertPost", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insertPost(HttpServletRequest request) {
        Map<String, Object> map = new HashMap();
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int board = Integer.parseInt(request.getParameter("board"));
        String uid = request.getParameter("uid");

        Date date = new Date();
        Long create_time = date.getTime();
        System.out.println(create_time);
        System.out.println(title);
        System.out.println(content);
        System.out.println(board);


        Post post = new Post(uid, title, create_time, board);
        bbsService.insertPost(post);
        map.put("success", "true");

        return map;
    }


}
