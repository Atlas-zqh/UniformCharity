package test.testDao;

import nju.domain.Order;
import nju.mapper.OrderMapper;
import nju.utils.EncryptionUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import test.BaseTest;

import java.util.List;

/**
 * Created by keenan on 24/05/2017.
 */
public class OrderMapperTest extends BaseTest {
    @Autowired
    private OrderMapper orderMapper;

    @Test
    public void testCreateOrder() {
        Order order = new Order("201705230002", "7654321", "123456789123456789", "987654321987654321", Order.ToBeConfirmed, "2017-05-22", null, Order.PRIVATE);
        orderMapper.createOrder(order);
    }

    @Test
    public void testFindOrderByBuyerID() {
        String buyerID = EncryptionUtil.encrypt("20170522", "987654321987654321");
        List<Order> orders = orderMapper.findOrderByBuyerID(buyerID);
        for (Order order : orders) {
            System.out.println(order.getBuyerID());
        }
    }

    @Test
    public void testFindOrderByOrderID() {
        String orderID = "201705230102";
        Order order = orderMapper.findOrderByOrderID(orderID);

        if (order != null) {
            System.out.println(order.getOrderID() + " " + order.getBuyerID());
        } else {
            System.out.println(" Invalid order ID");
        }
    }
}
