package test.testService;

import nju.service.serviceImpl.ClothesServiceImpl;
import nju.utils.ClothesAttributes;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import test.BaseTest;

import java.util.HashMap;
import java.util.Map;

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

    @Test
    public void testFindByAttributes() {
        Map<ClothesAttributes, String> map = new HashMap<>();

        map.put(ClothesAttributes.clothessize, "M");
        clothesService.findClothesByAttributes(map, 1, 10);
    }
}
