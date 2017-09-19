package nju.controller;

import com.github.pagehelper.PageInfo;
import nju.domain.Clothes;
import nju.domain.Order;
import nju.domain.Type;
import nju.domain.User;
import nju.service.ClothesService;
import nju.service.OrderService;
import nju.service.TypeService;
import nju.service.UserService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/createOrder", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> createOrder(HttpServletRequest request) {
        Map<String, Object> map = new HashedMap();

        String clothesID = request.getParameter("clothesID");
        String buyer = request.getParameter("buyer");
        System.out.println(clothesID);
        System.out.println(buyer);


        Clothes clothes = clothesService.findClothesByClothesID(clothesID);
        if (buyer.equals(clothes.getDonorID())) {
            map.put("success", "fail");
            map.put("error", "same");
            return map;
        }
        if (clothes != null && clothes.getStatus().equals(Clothes.AVAILABLE)) {
            clothes.setStatus(Clothes.OCCUPIED);
            clothesService.updateClothes(clothes);
            Order order = new Order();
            order.setClothesID(clothesID);
            order.setDonorID(clothes.getDonorID());
            order.setBuyerID(buyer);
            order.setOrderStatus(Order.Confirmed_Unpaied);
            order.setAuthority(0);
            String id = "";
            orderService.createOrder(order);
            map.put("success", "true");
            map.put("orderID", id);
        } else {
            map.put("success", "fail");
            map.put("error", "different");
        }

        return map;
    }

    @RequestMapping(value = "/getOrderByID", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getOrderByID(HttpServletRequest request) {
        Map<String, Object> map = new HashedMap();

        String orderID = request.getParameter("orderID");
        System.out.println("==============================");
        System.out.println(orderID);
        System.out.println("==============================");

        //获得订单
        Order order = orderService.findOrderByOrderID(orderID);
        try {
            if (order != null) {
                // 获得订单对应衣物
                String clothesID = order.getClothesID();
                Clothes clothes = clothesService.findClothesByClothesID(clothesID);
                String school = clothes.getSchoolName();
                String type = clothes.getClothesType();
                //获得衣物对应价格
                double price = typeService.findType(school, type).getClothesPrice();
                //获得衣物图片
                List<String> pics = clothesService.findPicsByClothesID(clothesID);
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                String time = simpleDateFormat.format(new Date(order.getStartTime()));

                String username = (userService.findUserByID(order.getDonorID()).getUsername());

                map.put("success", "true");
                map.put("order", order);
                map.put("orderPrice", price);
                map.put("clothes", clothes);
                map.put("time", time);
                map.put("username", username);
                if (pics.size() > 0) {
                    map.put("pic", pics.get(0));
                }
            } else {
                map.put("success", "false");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return map;
    }

    @RequestMapping(value = "/getOrderByUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getOrderByUser(HttpServletRequest request) {
        Map<String, Object> map = new HashedMap();

        String userID = request.getParameter("userID");
        int page = Integer.parseInt(request.getParameter("page"));
        int status = Integer.parseInt(request.getParameter("status"));
        System.out.println(userID);
        System.out.println(page);
        System.out.println(status);

        PageInfo<Order> orderPageInfo;

        if (status == -2) {
            orderPageInfo = orderService.findOrderByBuyerID(userID, page, 10);
        } else {
            orderPageInfo = orderService.findOrderByBuyerIDAndStatus(userID, status, page, 10);
        }

        //获得订单
        if (orderPageInfo != null) {
            try {
                List<Order> order = orderPageInfo.getList();
                long maxPage = orderPageInfo.getTotal();
                List<Clothes> clothesList = new ArrayList<>();
                List<Double> priceList = new ArrayList<>();
                List<String> picsList = new ArrayList<>();
                List<String> times = new ArrayList<>();
                List<String> donerNames = new ArrayList<>();
                // 获得订单对应衣物
                for (int i = 0; i < order.size(); i++) {
                    String clothesID = order.get(i).getClothesID();
                    Clothes clothes = clothesService.findClothesByClothesID(clothesID);
                    clothesList.add(clothes);
                    String school = clothes.getSchoolName();
                    String type = clothes.getClothesType();
                    double price = typeService.findType(school, type).getClothesPrice();
                    priceList.add(price);
                    //获得衣物图片
                    List<String> pics = clothesService.findPicsByClothesID(clothesID);
                    picsList.add(pics.get(0));
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                    times.add(simpleDateFormat.format(new Date(order.get(i).getStartTime())));
                    donerNames.add(userService.findUserByID(order.get(i).getDonorID()).getUsername());
                }

                map.put("success", "true");
                map.put("maxSize", maxPage);
                map.put("order", order);
                map.put("orderPrice", priceList);
                map.put("clothes", clothesList);
                map.put("pics", picsList);
                map.put("times", times);
                map.put("usernames", donerNames);
            } catch (Exception e) {
                map.put("success", "false");
            }
        } else {
            map.put("success", "false");

        }
        return map;
    }

    @RequestMapping(value = "/cancelOrder", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> cancelOrder(HttpServletRequest request) {
        Map<String, Object> map = new HashedMap();

        String orderID = request.getParameter("orderID");
        System.out.println("orderID");

        //获得订单
        Order order = orderService.findOrderByOrderID(orderID);
        order.setOrderStatus(Order.Invalid);
        Clothes clothes = clothesService.findClothesByClothesID(order.getClothesID());
        clothes.setStatus(Clothes.AVAILABLE);
        clothesService.updateClothes(clothes);

        double price = getOrderPrice(order);

        orderService.updateOrder(order, price);
        map.put("success", "true");

        return map;
    }

    @RequestMapping(value = "/payOrder", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> payOrder(HttpServletRequest request) {
        Map<String, Object> map = new HashedMap();

        String orderID = request.getParameter("orderID");
        System.out.println("orderID");
        //获得订单
        Order order = orderService.findOrderByOrderID(orderID);
        order.setOrderStatus(Order.ToBeTraded);

        double price = getOrderPrice(order);

        orderService.updateOrder(order, price);
        map.put("success", "true");

        return map;
    }

    @RequestMapping(value = "/finishOrder", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> finishOrder(HttpServletRequest request) {
        Map<String, Object> map = new HashedMap();

        String orderID = request.getParameter("orderID");
        System.out.println("orderID");
        //获得订单
        Order order = orderService.findOrderByOrderID(orderID);
        order.setOrderStatus(Order.Confirmed_Paied);

        double price = getOrderPrice(order);

        orderService.finishOrder(order, price);
        map.put("success", "true");

        return map;
    }

    private double getOrderPrice(Order order) {

        Clothes clothes = clothesService.findClothesByClothesID(order.getClothesID());

        double price = typeService.findType(clothes.getSchoolName(), clothes.getClothesType()).getClothesPrice();

        return price;
    }

    @RequestMapping(value = "/getAllTransactions", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAllTransactions() {
        Map<String, Object> map = new HashedMap();


        //获得订单
        PageInfo<Order> orderPageInfo = orderService.findAllOrders(1, 10);

        List<Order> orders = orderPageInfo.getList();

        while (orders.size() < 10) {
            for (int i = 0; i < orders.size(); i++) {
                if (orders.size() < 10)
                    orders.add(orders.get(i));
                else
                    break;
            }
        }

        List<String> transactions = new ArrayList<>();
        for (int i = 0; i < orders.size(); i++) {
            String s = "";
            Order order = orders.get(i);
            String bid = order.getBuyerID();
            String cid = order.getClothesID();
            try {
                User user = userService.findUserByID(bid);
                Clothes clothes = clothesService.findClothesByClothesID(cid);
                Type type = typeService.findType(clothes.getSchoolName(), clothes.getClothesType());
                s = user.getUsername() + "(" + user.getRealName() + ")" + "购买了一件衣物，价值" + type.getClothesPrice() + "元。";
                transactions.add(s);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        map.put("success", "true");
        map.put("transactions", transactions);

        return map;
    }
}
