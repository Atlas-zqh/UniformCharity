package nju.controller;

import nju.domain.Manager;
import nju.domain.User;
import nju.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by island on 2017/9/1.
 */

@Controller
@RequestMapping("/managerAction")
public class ManagerController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "managerLogin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> managerLogin(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();

        String password = request.getParameter("password");
        String username = request.getParameter("username");
        String loginInfo = "";

        try {
            Manager manager = userService.findManagerByUsername(username);
            if (manager == null) {
                loginInfo = "用户名不存在或密码错误";
            } else {
                if (password.equals(manager.getPassword())) {
                    loginInfo = "登录成功";
                    map.put("result", "success");
                    map.put("manager", manager);
                    return map;
                } else {
                    loginInfo = "用户名不存在或密码错误";
                    System.out.println("密码错误");
                }
            }
        } catch (Exception e) {
            loginInfo = "用户名不存在或密码错误";
            e.printStackTrace();
        }
        map.put("result", "fail");
        map.put("loginInfo", loginInfo);

        return map;
    }
}
