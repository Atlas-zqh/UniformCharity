package test.testService;

import nju.service.serviceImpl.ClothesServiceImpl;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import test.BaseTest;

public class ClothesServiceTest extends BaseTest {
    @Autowired
    private ClothesServiceImpl clothesService;

    @Test
    public void testAddPic() {
        clothesService.addPic("1111", "11111111");
    }

    @Test
    public void testRemovePic() {
        clothesService.removePic("1111", "11111111");
    }
}
