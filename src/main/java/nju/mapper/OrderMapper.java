package nju.mapper;

import nju.domain.Order;

import java.util.List;

/**
 * Created by keenan on 24/05/2017.
 */
public interface OrderMapper {
    /**
     * 创建订单
     */
    void createOrder(Order order);

    /**
     * 更新订单
     *
     * @param order 订单
     */
    void updateOrder(Order order);

    /**
     * 根据买方ID查找订单
     *
     * @param buyerID 买方ID
     * @return 用户作为买方参与的订单
     */
    List<Order> findOrderByBuyerID(String buyerID);

    /**
     * 根据卖方ID查找订单
     *
     * @param sellerID 卖方ID
     * @return 用户作为卖方参与的订单
     */
    List<Order> findOrderBySellerID(String sellerID);

    /**
     * 根据订单号查找订单
     *
     * @param orderID 订单号
     * @return 订单
     */
    Order findOrderByOrderID(String orderID);

    /**
     * 根据订单状态查找订单
     *
     * @param status 状态
     * @return 对应状态的所有订单
     */
    List<Order> findOrderByStatus(Integer status);

    /**
     * 查找所有状态为公开的订单
     *
     * @return 所有状态为公开的订单
     */
    List<Order> findAllPublicOrders();

    /**
     * 查找所有订单（忽略订单状态）
     *
     * @return 所有订单
     */
    List<Order> findAllOrders();
}
