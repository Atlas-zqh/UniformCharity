package test.testDao;

import nju.mapper.UserMapper;
import nju.domain.User;
import nju.utils.EncryptionUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
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
        User user = new User("admin", "123456", "mywechat", "12345678901", "测试员", "男", "123456789123456789", 2000, "admin@mail.com", "", true, "南京中学");
        System.out.println(user.getUsername() + "???????????");
        try {
            userDao.add(user);
        } catch (DuplicateKeyException e) {
            System.out.println("用户已存在！");
        }

    }

    @Test
    public void testUpdate() {
        User user = new User("zqh", "123456", "sdf", "12345678901", "啊啊啊", "男", "34059643272839495854", 2000, "g@mail.com", "cc", true, "南京中学");
        userDao.update(user);
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


}
