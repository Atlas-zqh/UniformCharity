package nju.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import nju.domain.Order;
import nju.mapper.OrderMapper;
import nju.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    /**
     * 创建订单(自动生成订单号和订单开始时间)
     *
     * @param order
     */
    @Override
    public String createOrder(Order order) {
        long current = System.currentTimeMillis();
        order.setStartTime(current);
        Date date = new Date(current);
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String oid = format.format(date);
        order.setOrderID(oid);
        orderMapper.createOrder(order);
        return oid;
    }

    /**
     * 更新订单
     *
     * @param order 订单
     */
    @Override
    public void updateOrder(Order order) {
        orderMapper.updateOrder(order);
    }

    /**
     * 结束订单
     *
     * @param order
     */
    @Override
    public void finishOrder(Order order) {
        // TODO 结束订单时给谁增加公益积分？
    }

    /**
     * 根据买方ID查找订单
     *
     * @param buyerID  买方ID
     * @param pageNo
     * @param pageSize @return 用户作为买方参与的订单
     */
    @Override
    public PageInfo<Order> findOrderByBuyerID(String buyerID, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Order> orders = orderMapper.findOrderByBuyerID(buyerID);
        PageInfo<Order> pageInfo = new PageInfo<>(orders);
        return pageInfo;
    }

    /**
     * 根据卖方ID查找订单
     *
     * @param sellerID 卖方ID
     * @param pageNo
     * @param pageSize @return 用户作为卖方参与的订单
     */
    @Override
    public PageInfo<Order> findOrderBySellerID(String sellerID, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Order> orders = orderMapper.findOrderBySellerID(sellerID);
        PageInfo<Order> pageInfo = new PageInfo<>(orders);
        return pageInfo;
    }

    /**
     * 根据订单号查找订单
     *
     * @param orderID 订单号
     * @return 订单
     */
    @Override
    public Order findOrderByOrderID(String orderID) {
        return orderMapper.findOrderByOrderID(orderID);
    }

    /**
     * 根据订单状态查找订单
     *
     * @param status   状态
     * @param pageNo
     * @param pageSize @return 对应状态的所有订单
     */
    @Override
    public PageInfo<Order> findOrderByStatus(Integer status, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Order> orders = orderMapper.findOrderByStatus(status);
        PageInfo<Order> pageInfo = new PageInfo<>(orders);
        return pageInfo;
    }

    /**
     * 查找所有状态为公开的订单
     *
     * @param pageNo
     * @param pageSize
     * @return 所有状态为公开的订单
     */
    @Override
    public PageInfo<Order> findAllPublicOrders(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Order> orders = orderMapper.findAllPublicOrders();
        PageInfo<Order> pageInfo = new PageInfo<>(orders);
        return pageInfo;
    }

    /**
     * 查找所有订单（忽略订单状态）
     *
     * @param pageNo
     * @param pageSize
     * @return 所有订单
     */
    @Override
    public PageInfo<Order> findAllOrders(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Order> orders = orderMapper.findAllOrders();
        PageInfo<Order> pageInfo = new PageInfo<>(orders);
        return pageInfo;
    }

    /**
     * 根据衣物编号查找订单
     *
     * @param clothesID 衣物编号
     * @return 对应订单
     */
    @Override
    public PageInfo<Order> findOrderByClothesID(String clothesID, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Order> orders = orderMapper.findOrderByClothesID(clothesID);
        PageInfo<Order> pageInfo = new PageInfo<>(orders);
        return pageInfo;
    }
}
