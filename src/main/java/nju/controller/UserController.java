package nju.controller;

import com.alibaba.druid.support.json.JSONUtils;
import nju.domain.User;
import nju.service.UserService;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by keenan on 23/05/2017.
 */
@Controller
@RequestMapping("/userAction")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "userLogin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> login(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();

        String password = request.getParameter("password");
        String username = request.getParameter("username");
        String loginInfo = "";

        try {
            User user = userService.findUserByID(username);
            if (user == null) {
                loginInfo = "用户名不存在";
            } else {
                loginInfo = "登录成功";
                map.put("userInfo", user);
            }
        } catch (Exception e) {
            loginInfo = "用户名不存在";
            e.printStackTrace();
        }

        if (username == null || username.equals("")) {
            loginInfo = "账号为空";
        }
        if (password == null || password.equals("")) {
            loginInfo = "密码为空";
        }
        map.put("loginInfo", loginInfo);


        System.out.println(username);
        System.out.println(password);
        System.out.println(loginInfo);

        String jsonResult = JSONUtils.toJSONString(map);
        System.out.println(jsonResult);
        return map;
    }

    @RequestMapping(value = "userSignUp", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> signUp(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        String result = "";
        String errorType = "";


        String password = request.getParameter("password");
        String username = request.getParameter("username");
        String studentname = request.getParameter("studentname");
        String school = request.getParameter("school");
        String id = request.getParameter("id");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String image = request.getParameter("image");

        System.out.println(username);
        System.out.println(password);
        System.out.println(studentname);
        System.out.println(school);
        System.out.println(id);
        System.out.println(phone);
        System.out.println(gender);
        System.out.println(image);

        String url = "";
        if (image.startsWith("../")) {
            if (gender.equals("男"))
                url = "static/icons/maleIcon.png";
            else
                url = "static/icons/femaleIcon.png";
        } else {
            image = image.replace("%2B", "+");
            generateImage(image, "/Users/island/IdeaProjects/UniformCharity/src/main/webapp/static/icons/" + id + ".jpg");
            url = "static/icons/" + id + ".jpg";
        }


        try {
            if (userService.findUserByID(id) != null){
                result = "fail";
                errorType = "哎呀呀，该身份证已注册过账户！";
                map.put("result", result);
                map.put("errorType", errorType);
            }else{
                User user = new User();
                user.setUsername(username);
                user.setPassword(password);
                user.setPhone(phone);
                user.setStudentRealName(studentname);
                user.setGender(gender);
                user.setPersonID(id);
                user.setSchool(school);
                user.setPicurl(url);
                user.setCredits(100);
                userService.addUser(user);
                result = "success";
                map.put("result", result);
                map.put("user", user);
            }
            return map;
        }catch (Exception e){
            result = "fail";
            errorType = "哎呀呀，请稍后重试！";
            map.put("result", result);
            map.put("errorType", errorType);
            e.printStackTrace();
        }
//        image = image.replace("%20", " ");
//        image = image.replace("%2F", "/");
//        image = image.replace("%3F", "?");
//        image = image.replace("%25", "%");
//        image = image.replace("%23", "#");
//        image = image.replace("%26", "&");
//        image = image.replace("%3D", "=");
//        try {
//            byte[] base64 = (new sun.misc.BASE64Decoder()).decodeBuffer((image));
//            generateImage(base64, "/Users/island/IdeaProjects/UniformCharity/src/main/webapp/static/icons/" + id + ".jpg");
//        }catch (IOException e){
//            e.printStackTrace();
//        }
//        byte[] decode = Base64Util.decode(base64);
//        String s = new String(decode);
        // 加密


        return map;
    }

    @RequestMapping(value = "uploadIcon", method = RequestMethod.POST)
    @ResponseBody
    public void upload(@RequestParam String image, HttpServletRequest request, HttpServletResponse response) {
        System.out.println("upload");
        System.out.println(image);
    }

    /**
     * ajax请求不需要返回页面，只需要得到response中的数据即可，所以方法签名为void即可
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "ajax", method = RequestMethod.POST)
    public void ajaxDatas(HttpServletRequest request, HttpServletResponse response) {
        String jsonResult = getJSONString(request);
        renderData(response, jsonResult);
    }

    private String getJSONString(HttpServletRequest request) {
        //故意构造一个数组，使返回的数据为json数组，数据更复杂些
        List<Map<String, Object>> datas = new ArrayList<Map<String, Object>>(5);
        Map<String, Object> map1 = new HashMap<String, Object>(10);
        //可以获得ajax请求中的参数
        map1.put("a", request.getParameter("a"));
        map1.put("b", request.getParameter("b"));
        map1.put("c", request.getParameter("c"));
        datas.add(map1);
        //故意构造一个数组，使返回的数据为json数组，数据更复杂些
        Map<String, Object> map2 = new HashMap<String, Object>(10);
        map2.put("a", "11");
        map2.put("b", "22");
        map2.put("c", "33");
        datas.add(map2);
        String jsonResult = JSONUtils.toJSONString(datas);
        return jsonResult;
    }

    /**
     * 通过PrintWriter将响应数据写入response，ajax可以接受到这个数据
     *
     * @param response
     * @param data
     */
    private void renderData(HttpServletResponse response, String data) {
        PrintWriter printWriter = null;
        try {
            printWriter = response.getWriter();
            printWriter.print(data);
        } catch (IOException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (null != printWriter) {
                printWriter.flush();
                printWriter.close();
            }
        }
    }

    /**
     * @param imgStr base64编码字符串
     * @param path   图片路径-具体到文件
     * @return
     * @Description: 将base64编码字符串转换为图片
     * @Author:
     * @CreateTime:
     */
    private boolean generateImage(String imgStr, String path) {
        if (imgStr == null)
            return false;
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            // 解密
            byte[] b = decoder.decodeBuffer(imgStr);
            // 处理数据
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {
                    b[i] += 256;
                }
            }
            OutputStream out = new FileOutputStream(path);
            out.write(b);
            out.flush();
            out.close();
            return true;
        } catch (Exception e) {
            return false;
        }

    }
}