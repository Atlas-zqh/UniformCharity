package nju.controller;

import com.github.pagehelper.PageInfo;
import nju.domain.*;
import nju.service.ClothesService;
import nju.service.OrderService;
import nju.service.TypeService;
import nju.service.UserService;
import nju.utils.ClothesAttributes;
import nju.utils.EncryptionUtil;
import org.apache.commons.collections.map.HashedMap;
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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by island on 2017/7/19.
 */
@Controller
@RequestMapping("/clothesAction")
public class ClothesController {

    @Autowired
    private TypeService typeService;

    @Autowired
    private ClothesService clothesService;

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/uploadClothes", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadClothes(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();


//        String school = request.getParameter("school");
        String type = request.getParameter("type");
        String gender = request.getParameter("gender");
        double size = Double.parseDouble(request.getParameter("size"));
        String id = request.getParameter("id");
        try {
            User user = userService.findUserByID(id);
            String school = user.getSchool();
//        System.out.println(school);
            System.out.println(type);
            System.out.println(gender);
            System.out.println(size);
            System.out.println(id);
            int i = 0;
            Clothes clothes = new Clothes();
            clothes.setSchoolName(school);
            clothes.setGender(gender);
            clothes.setClothesType(type);
            clothes.setClothesWeight(0.0);
            clothes.setClothesHeight(size);
            clothes.setDonorID(id);
//        clothes.setClothesPrice(0.0);
            clothes.setStatus("Available");

            String clothesID = clothesService.addClothes(clothes);
            System.out.println("上传衣物：" + clothesID);
            if (clothesID != null) {
                map.put("success", "true");
                map.put("clothesID", clothesID);
            } else {
                map.put("success", "false");
            }
        } catch (Exception e) {
            map.put("success", "false");
        }

        return map;
    }

    @RequestMapping(value = "/uploadOldClothes", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadOldClothes(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();


//        String school = request.getParameter("school");
        String clothesID = request.getParameter("clothesID");
        String story = request.getParameter("story");
        String id = request.getParameter("id");
        try {
            User user = userService.findUserByID(id);
            String school = user.getSchool();
//        System.out.println(school);
            System.out.println(clothesID);
            System.out.println(story);
            System.out.println(id);

            Clothes clothes = clothesService.findClothesByClothesID(clothesID);
            if(clothes == null){
                map.put("success", "false");
                map.put("error", "该ID没有对应衣物！");
                return map;
            }else{
                PageInfo<Order> orderPageInfo = orderService.findOrderByBuyerID(id, 1, 10000);
                List<Order> orders = orderPageInfo.getList();
                List<String> clotheIDs = new ArrayList<>();

                for (int i = orders.size() - 1; i >= 0; i--) {
                    clotheIDs.add(orders.get(i).getClothesID());
                }

                if(clotheIDs.contains(clothesID)){
                    map.put("success", "true");
                    //todo 等待后端上传旧衣物接口
//                    clothes.setStatus(Clothes.AVAILABLE);
//                    clothes.setDonorID(id);
//                    ClothesHistory
                    return map;
                }else{
                    map.put("success", "false");
                    map.put("error", "不能上传自己没有购买过的衣物！");
                    return map;
                }

            }

        } catch (Exception e) {
            map.put("success", "false");
        }

        return map;
    }

    @RequestMapping(value = "/uploadClothesPics", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadClothesPics(HttpServletRequest request, HttpSession session) {
        Map<String, Object> map = new HashMap<>();

        MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        MultipartHttpServletRequest multipartRequest = resolver.resolveMultipart(request);
        MultipartFile multipartFile = multipartRequest.getFile("file");
        String clothesID = multipartRequest.getParameter("clothesID");
        System.out.println("上传图片获得的：" + clothesID);

        if (multipartFile != null) {
            String trueFileName = clothesID + String.valueOf(System.currentTimeMillis()) + ".jpg";
            String path = session.getServletContext().getRealPath("/") + "static/icons/" + trueFileName;
            String p = "../static/icons/" + trueFileName;
            clothesService.addPic(clothesID, p);
            try {
                multipartFile.transferTo(new File(path));
            } catch (IOException e) {
                e.printStackTrace();
            }
            map.put("success", "true");
            map.put("clothesID", clothesID);
        } else {
            map.put("success", "false");
        }

//        clothesService.addClothes();
//        List<String> s = new ArrayList<>();
//        for(int i = 0; i < schools.size(); i++){
//            s.add(schools.get(i).getSchoolName());
//            System.out.println(schools.get(i).getSchoolName());
//        }
//        map.put("success", "true");
//        map.put("schools", s);
        return map;
    }

    @RequestMapping(value = "/allTypesOfSchool", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllTypes(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        String school = request.getParameter("school");
        List<Type> types = typeService.findAllTypesOfSchool(school);
        List<String> s = new ArrayList<>();
        for (int i = 0; i < types.size(); i++) {
            s.add(types.get(i).getClothestype());
            System.out.println(types.get(i).getClothestype());
        }
        map.put("success", "true");
        map.put("type", s);
        return map;
    }

    @RequestMapping(value = "/allTypesOfUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllTypesOfUser(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        String id = request.getParameter("id");
        try {
            User user = userService.findUserByID(id);
            String school = user.getSchool();
            List<Type> types = typeService.findAllTypesOfSchool(school);
            List<String> s = new ArrayList<>();
            for (int i = 0; i < types.size(); i++) {
                s.add(types.get(i).getClothestype());
                System.out.println(types.get(i).getClothestype());
            }
            map.put("success", "true");
            map.put("type", s);
        } catch (Exception e) {
            map.put("success", "false");
        }
        return map;
    }

    @RequestMapping(value = "/searchClothes", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> searchClothes(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        String school = request.getParameter("school");
        String type = request.getParameter("type");
        String gender = request.getParameter("gender");
        String size = request.getParameter("size");
        int page = Integer.parseInt(request.getParameter("page"));
        System.out.println(school);
        System.out.println(type);
        System.out.println(gender);
        System.out.println(size);
        System.out.println(page);
        Map<ClothesAttributes, String> clothesMap = new HashedMap();
        if (!school.equals(""))
            clothesMap.put(ClothesAttributes.schoolName, school);
        if (!gender.equals(""))
            clothesMap.put(ClothesAttributes.gender, gender);
        if (!size.equals(""))
            clothesMap.put(ClothesAttributes.clothesHeight, size);
        if (!type.equals(""))
            clothesMap.put(ClothesAttributes.clothesType, type);
        //获得衣物信息
        PageInfo<Clothes> clothesPageInfo = clothesService.findClothesByAttributes(clothesMap, page, 20);
        long maxPage = clothesPageInfo.getTotal();
        System.out.println(maxPage);
        try {
            if (clothesPageInfo != null) {
                List<Clothes> clothes = clothesPageInfo.getList();
                List<String> pics = new ArrayList<>();
                List<String> username = new ArrayList<>();
                List<Double> prices = new ArrayList<>();
                String clotheID = "";
                for (int i = 0; i < clothes.size(); i++) {
                    clotheID = clothes.get(i).getClothesID();
                    List<String> clothesPics = clothesService.findPicsByClothesID(clotheID);
                    pics.add(clothesPics.get(0));
                    User user = userService.findUserByID(clothes.get(i).getDonorID());
                    username.add(user.getUsername());
                    prices.add(typeService.findType(clothes.get(i).getSchoolName(), clothes.get(i).getClothesType()).getClothesPrice());
                }
                System.out.println("有几件衣服：" + clothes.size());

                if (clothes.size() > 0) {
                    map.put("success", "true");
                    map.put("clothes", clothes);
                    map.put("maxPage", maxPage);
                    map.put("pics", pics);
                    map.put("username", username);
                    map.put("prices", prices);
                } else {
                    map.put("success", "false");
                    map.put("error", "无结果");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping(value = "/findClothesByID", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> findClothesByID(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        String id = request.getParameter("clothesID");

        System.out.println(id);
        List<String> pics = clothesService.findPicsByClothesID(id);
        System.out.println("有几张图片： " + pics.size());

        Clothes clothes = clothesService.findClothesByClothesID(id);
        System.out.println(clothes.getClothesID());

        double price = typeService.findType(clothes.getSchoolName(), clothes.getClothesType()).getClothesPrice();

        try {
            User user = userService.findUserByID(clothes.getDonorID());

            if (clothes != null) {
                map.put("success", "true");
                map.put("clothes", clothes);
                map.put("pics", pics);
                map.put("user", user);
                map.put("price", price);
            } else {
                map.put("success", "false");
            }
        } catch (Exception e) {
            map.put("success", "false");

        }

        return map;
    }

    @RequestMapping(value = "/findClothesByUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> findClothesByUser(HttpServletRequest request) {
        Map<String, Object> map = new HashedMap();
        String type = request.getParameter("type");
        String id = request.getParameter("id");

        List<Clothes> clothes = new ArrayList<>();
        List<String> pics = new ArrayList<>();
        List<Double> prices = new ArrayList<>();
        Map<ClothesAttributes, String> clothesAttributesStringMap = new HashMap<>();
        clothesAttributesStringMap.put(ClothesAttributes.donorID, EncryptionUtil.encrypt("20170522", (String) id));
        String clotheID = "";
        if (type.equals("1")) {
//            clothesService.f
            PageInfo<Clothes> clothesPageInfo = clothesService.findClothesByAttributes(clothesAttributesStringMap, 1, 10000);
            clothes = clothesPageInfo.getList();
            for (int i = clothes.size() - 1; i >= 0; i--) {
                clotheID = clothes.get(i).getClothesID();
                List<String> clothesPics = clothesService.findPicsByClothesID(clotheID);
                pics.add(clothesPics.get(0));
                prices.add(typeService.findType(clothes.get(i).getSchoolName(), clothes.get(i).getClothesType()).getClothesPrice());
            }
            map.put("success", "true");
            map.put("clothes", clothes);
            map.put("pics", pics);
            map.put("prices", prices);
        } else {
            PageInfo<Order> orderPageInfo = orderService.findOrderByBuyerID(id, 1, 10000);
            List<Order> orders = orderPageInfo.getList();

            for (int i = orders.size() - 1; i >= 0; i--) {
                clotheID = clothes.get(i).getClothesID();
                List<String> clothesPics = clothesService.findPicsByClothesID(clotheID);
                pics.add(clothesPics.get(0));
                clothes.add(clothesService.findClothesByClothesID(orders.get(i).getClothesID()));
                prices.add(typeService.findType(clothes.get(i).getSchoolName(), clothes.get(i).getClothesType()).getClothesPrice());
            }
            map.put("success", "true");
            map.put("clothes", clothes);
            map.put("pics", pics);
            map.put("prices", prices);
        }

        return map;
    }
}
