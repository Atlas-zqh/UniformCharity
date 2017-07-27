package test.utilTest;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class BasicTest {
    @Test
    public void testSort() {
        List<Integer> integers = new ArrayList<Integer>() {
            {
                add(1);
                add(5);
                add(6);
                add(-1);
                add(10);
            }
        };

        integers.sort((Integer i1, Integer i2) -> i2.compareTo(i1));


        for (int i = 0; i < integers.size(); i++) {
            System.out.println(integers.get(i));
        }
    }
}
