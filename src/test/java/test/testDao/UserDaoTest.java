package test.testDao;

import nju.dao.UserDao;
import nju.domain.User;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import test.BaseTest;

import java.util.List;

/**
 * Created by keenan on 04/05/2017.
 */

public class UserDaoTest extends BaseTest {
    @Autowired
    private UserDao userDao;

    @Test
    public void testAdd() {
//        User user=new User("zqh","123456","sdf","12345678901","啊啊啊","男","34059643272839495854",2000,"g@mail.com","cc",true);
        User user = new User("qky", "123456", "sdfxc", "12345678901", "北包包", "男", "34059643272839492910", 2000, "h@mail.com", "dd", true);

        try {
            userDao.add(user);
        } catch (DuplicateKeyException e) {
            System.out.println("用户已存在！");
        }

    }

    @Test
    public void testUpdate() {
        User user = new User("zqh", "123456", "sdf", "12345678901", "啊啊啊", "男", "34059643272839495854", 2000, "g@mail.com", "cc", true);
        userDao.update(user);
    }

    @Test
    public void testFindOneByID() {
        String ID = "34";
        User user = userDao.findOneByID(ID);
        Assert.assertEquals(user, null);
    }


    @Test
    public void testFindAll() {
        List<User> users = userDao.findAll();
        Assert.assertNotEquals(users, null);
    }


}
