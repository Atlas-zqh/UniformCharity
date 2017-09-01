package test.testService;

import nju.domain.Type;
import nju.service.TypeService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import test.BaseTest;

/**
 * @author keenan on 02/09/2017
 */
public class TypeServiceTest extends BaseTest {
    @Autowired
    private TypeService typeService;

    @Test
    public void testAddType() {
        Type type = new Type("a", "b", 20.0, "d");
        typeService.addType(type);
    }
}