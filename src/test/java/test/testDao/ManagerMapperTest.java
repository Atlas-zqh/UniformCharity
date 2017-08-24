package test.testDao;

import nju.domain.Manager;
import nju.mapper.ManagerMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import test.BaseTest;

/**
 * @author keenan on 24/08/2017
 */
public class ManagerMapperTest extends BaseTest {
    @Autowired
    private ManagerMapper managerMapper;

    @Test
    public void testAddManager() {
        Manager manager = new Manager("admin", "admin", null);
        managerMapper.add(manager);
    }
}
