package test.testService;

import nju.domain.Order;
import nju.service.serviceImpl.OrderServiceImpl;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import test.BaseTest;

public class OrderServiceTest extends BaseTest {
    @Autowired
    private OrderServiceImpl orderService;

    @Test
    public void testAddOrder() {
        Order order = new Order();
        orderService.createOrder(order);
    }
}
