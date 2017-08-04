package nju.service;

import com.github.pagehelper.PageInfo;
import nju.domain.Order;

/**
 * Created by keenan on 25/05/2017.
 */
public interface OrderService {

    /**
     * 创建订单(自动生成订单号和订单开始时间)
     */
    String createOrder(Order order);

    /**
     * 更新订单
     *
     * @param order 订单
     */
    void updateOrder(Order order, double price);

    /**
     * 结束订单
     *
     * @param order
     * @param credit 要给买方增加的积分
     */
    void finishOrder(Order order, double credit);

    /**
     * 根据买方ID查找订单
     *
     * @param buyerID 买方ID
     * @return 用户作为买方参与的订单
     */
    PageInfo<Order> findOrderByBuyerID(String buyerID, int pageNo, int pageSize);

    /**
     * 根据卖方ID查找订单
     *
     * @param sellerID 卖方ID
     * @return 用户作为卖方参与的订单
     */
    PageInfo<Order> findOrderBySellerID(String sellerID, int pageNo, int pageSize);

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
    PageInfo<Order> findOrderByStatus(Integer status, int pageNo, int pageSize);

    /**
     * 查找所有状态为公开的订单
     *
     * @return 所有状态为公开的订单
     */
    PageInfo<Order> findAllPublicOrders(int pageNo, int pageSize);

    /**
     * 查找所有订单（忽略订单状态）
     *
     * @return 所有订单
     */
    PageInfo<Order> findAllOrders(int pageNo, int pageSize);

    /**
     * 根据衣物编号查找订单
     *
     * @param clothesID 衣物编号
     * @return 对应订单
     */
    PageInfo<Order> findOrderByClothesID(String clothesID, int pageNo, int pageSize);
}
