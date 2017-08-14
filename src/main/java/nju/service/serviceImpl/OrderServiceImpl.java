package nju.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import nju.domain.CreditRecord;
import nju.domain.FinancialRecord;
import nju.domain.Order;
import nju.domain.User;
import nju.mapper.CreditRecordMapper;
import nju.mapper.FinancialRecordMapper;
import nju.mapper.OrderMapper;
import nju.mapper.UserMapper;
import nju.service.OrderService;
import nju.utils.EncryptionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CreditRecordMapper creditRecordMapper;
    @Autowired
    private FinancialRecordMapper financialRecordMapper;

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
    public void updateOrder(Order order, double price) {
        // 撤销或删除订单
        if (order.getOrderStatus() == Order.Invalid) {
            addCreditRecord(order.getBuyerID(), CreditRecord.REVOKE_CANCEL_ORDER, order.getClothesID(), 0.0 - price);
        }
        orderMapper.updateOrder(order);
    }

    /**
     * 结束订单
     *
     * @param order
     * @param credit 要给买方增加的积分
     */
    @Override
    public void finishOrder(Order order, double credit) {
        String buyerID = order.getBuyerID();
        String donorID = order.getDonorID();
        /**
         * 增加公益记录
         */
        addCreditRecord(buyerID, CreditRecord.BUY_CLOTHES, order.getClothesID(), credit);
        /**
         * 增加资金记录
         */
        addFinancialRecord(buyerID, donorID, credit);
        /**
         * 更新订单状态
         */
        order.setOrderStatus(Order.Confirmed_Paied);
        orderMapper.updateOrder(order);
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
        String bid = EncryptionUtil.encrypt("20170522", buyerID);
        List<Order> orders = orderMapper.findOrderByBuyerID(bid);
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
        String sid = EncryptionUtil.encrypt("20170522", sellerID);
        List<Order> orders = orderMapper.findOrderBySellerID(sid);
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

    /**
     * 增加信用记录(同时更新用户信用）
     * 完成订单 和 捐赠衣物 的同时会创建公益记录，不需要调这个方法
     *
     * @param userID
     * @param recordtype 记录类型 CreditRecord.____
     * @param clothesID
     * @param variance   变化值
     */
    @SuppressWarnings("Duplicates")
    public void addCreditRecord(String userID, Integer recordtype, String clothesID, Double variance) {
        User user = userMapper.findOneByID(EncryptionUtil.encrypt("20170522", userID));
        Double credit = user.getCredits();
        credit += variance;
        user.setCredits(credit);
        userMapper.update(user);

//        String createTime = System.currentTimeMillis() + "";
        CreditRecord record = new CreditRecord(EncryptionUtil.encrypt("20170522", userID), recordtype, clothesID, variance, credit, System.currentTimeMillis());
        creditRecordMapper.addRecord(record);
    }

    /**
     * 增加资金记录
     *
     * @param buyerID
     * @param donorID
     * @param amount
     */
    private void addFinancialRecord(String buyerID, String donorID, double amount) {
        long createTime = System.currentTimeMillis();

        String bid = EncryptionUtil.encrypt("20170522", buyerID);
        String did = EncryptionUtil.decrypt("20170522", donorID);

        FinancialRecord buyerR = new FinancialRecord(bid, FinancialRecord.OUT, amount, createTime);
        FinancialRecord donorR = new FinancialRecord(did, FinancialRecord.IN, amount, createTime);

        financialRecordMapper.addRecord(buyerR);
        financialRecordMapper.addRecord(donorR);
    }

    /**
     * 根据买家ID和订单状态查找订单
     *
     * @param buyerID  买家ID
     * @param status   订单状态
     * @param pageNo
     * @param pageSize
     * @return 对应订单
     */
    @Override
    public PageInfo<Order> findOrderByBuyerIDAndStatus(String buyerID, Integer status, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        String bid = EncryptionUtil.encrypt("20170522", buyerID);
        List<Order> orders = orderMapper.findOrderByBuyerIDAndStatus(bid, status);
        return new PageInfo<>(orders);
    }
}
