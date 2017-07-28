package nju.controller;

import nju.domain.Clothes;
import nju.domain.Order;
import nju.domain.Type;
import nju.service.ClothesService;
import nju.service.OrderService;
import nju.service.TypeService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by island on 2017/7/27.
 */
@Controller
@RequestMapping("/orderAction")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ClothesService clothesService;

    @Autowired
    private TypeService typeService;


    @RequestMapping(value = "/createOrder", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> createOrder(HttpServletRequest request) {
        Map<String, Object> map = new HashedMap();

        String clothesID = request.getParameter("clothesID");
        String buyer = request.getParameter("buyer");
        System.out.println(clothesID);
        System.out.println(buyer);


        Clothes clothes = clothesService.findClothesByClothesID(clothesID);
        if(clothes != null) {
            Order order = new Order();
            order.setClothesID(clothesID);
            order.setDonorID(clothes.getDonorID());
            order.setBuyerID(buyer);
            order.setOrderStatus(2);
            order.setAuthority(0);
            String id = "";
            orderService.createOrder(order);
            map.put("success", "true");
            map.put("orderID", id);
        }else{
            map.put("success", "fail");
        }

        return map;
    }

    @RequestMapping(value = "/getOrderByID", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getOrderByID(HttpServletRequest request) {
        Map<String, Object> map = new HashedMap();

        String orderID = request.getParameter("orderID");
        System.out.println("orderID");

        //获得订单
        Order order = orderService.findOrderByOrderID(orderID);
        if(order != null){
            // 获得订单对应衣物
            String clothesID = order.getClothesID();
            Clothes clothes = clothesService.findClothesByClothesID(clothesID);
            String school = clothes.getSchoolName();
            String type = clothes.getClothesType();
            //获得衣物对应价格
            double price = typeService.findType(school, type).getClothesPrice();
            //获得衣物图片
            List<String> pics = clothesService.findPicsByClothesID(clothesID);
            map.put("success", "true");
            map.put("order", order);
            map.put("orderPrice", price);
            map.put("clothes", clothes);
            if(pics.size() > 0){
                map.put("pic", pics.get(0));
            }
        }else{
            map.put("success", "false");

        }

        return map;
    }
}
