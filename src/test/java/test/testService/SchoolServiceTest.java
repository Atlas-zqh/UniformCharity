package test.testService;

import nju.service.SchoolService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import test.BaseTest;

import java.util.List;
import java.util.Map;

public class SchoolServiceTest extends BaseTest {
    @Autowired
    private SchoolService schoolService;

    @Test
    public void testGetClass() {
        Map<String, List<String>> classes = schoolService.findClassBySchool("南京外国语学校仙林分校");
        for (Map.Entry<String, List<String>> entry : classes.entrySet()) {
            System.out.println(entry.getKey());
            for (String e : entry.getValue()) {
                System.out.println("\t\t\t\t" + e);
            }
        }
    }
}
