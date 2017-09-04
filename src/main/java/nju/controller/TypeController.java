package nju.controller;

import nju.domain.Type;
import nju.service.TypeService;
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
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by island on 2017/9/4.
 */
@Controller
@RequestMapping("/typeAction")
public class TypeController {
    @Autowired
    private TypeService typeService;

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
        String uploadType = multipartRequest.getParameter("type");
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

            if (uploadType.equals("add")) {

                typeService.addType(type);
                map.put("success", "true");

            } else {
                String oldTypeName = multipartRequest.getParameter("oldType");
                Type oldType = typeService.findType(school, oldTypeName);
                oldType.setUsed(false);
                typeService.modifyType(type);

            }
        }else {
            map.put("success", "false");
        }

        return map;

    }
}
