package test.testDao;

import nju.domain.CreditStatistic;
import nju.domain.User;
import nju.mapper.UserMapper;
import nju.utils.EncryptionUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import test.BaseTest;

import java.util.List;

/**
 * Created by keenan on 04/05/2017.
 */

public class UserMapperTest extends BaseTest {
    @Autowired
    private UserMapper userDao;

    @Test
    public void testAdd() {
//        User user=new User("zqh","123456","sdf","12345678901","啊啊啊","男","34059643272839495854",2000,"g@mail.com","cc",true);
//        User user = new User("admin", "123456", "mywechat", "12345678901", "测试员", "男", "123456789123456789", 2000.0, "admin@mail.com", "", true, "南京中学");
//        System.out.println(user.getUsername() + "???????????");
//        try {
//            userDao.add(user);
//        } catch (DuplicateKeyException e) {
//            System.out.println("用户已存在！");
//        }

    }

    @Test
    public void testUpdate() {
//        User user = new User("zqh", "123456", "sdf", "12345678901", "啊啊啊", "男", "34059643272839495854", 2000.0, "g@mail.com", "cc", true, "南京中学");
//        userDao.update(user);
    }

    @Test
    public void testFindOneByID() {
        String ID = "123456789123456789";
        User user = userDao.findOneByID(EncryptionUtil.encrypt("20170522", ID));
//        Assert.assertEquals(user, null);
        System.out.println(user.getUsername() + " hihihi");
    }


    @Test
    public void testFindAll() {
        List<User> users = userDao.findAll();

        for (User user : users) {
            System.out.println(user.getUsername() + " " + user.getPersonID());
        }
    }

    @Test
    public void testGetCreditsSumByGrade() {
        System.out.println("==============================================================================");
        CreditStatistic creditStatistic = userDao.getAllCreditsByGrade("南京外国语学校仙林分校", "2015级");
        System.out.println(creditStatistic.toString());
        System.out.println("==============================================================================");

        System.out.println("==============================================================================");
        List<CreditStatistic> creditStatistics = userDao.getAllGradeCreditsSum("南京外国语学校仙林分校");
        for (CreditStatistic each : creditStatistics) {
            System.out.println(each.toString());
        }
        System.out.println("==============================================================================");

        System.out.println("==============================================================================");
        CreditStatistic creditStatistic1 = userDao.getAllCreditsByGradeAndClass("南京外国语学校仙林分校", "2015级", "1班");
        System.out.println(creditStatistic1.toString());
        System.out.println("==============================================================================");

        System.out.println("==============================================================================");
        List<CreditStatistic> creditStatistics1 = userDao.getAllClassCreditsSumByGrade("南京外国语学校仙林分校", "2015级");
        for (CreditStatistic each : creditStatistics1) {
            System.out.println(each.toString());
        }
        System.out.println("==============================================================================");

        System.out.println("==============================================================================");
        List<CreditStatistic> creditStatistics2 = userDao.getAllClassCreditsSumBySchool("南京外国语学校仙林分校");
        for (CreditStatistic each : creditStatistics2) {
            System.out.println(each.toString());
        }
        System.out.println("==============================================================================");

    }

}
