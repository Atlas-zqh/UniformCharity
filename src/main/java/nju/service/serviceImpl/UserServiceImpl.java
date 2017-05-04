package nju.service.serviceImpl;

import nju.dao.UserDao;
import nju.domain.User;
import nju.exception.InvalidInfoException;
import nju.exception.OtherException;
import nju.exception.UserExistedException;
import nju.exception.UserNotExistException;
import nju.service.UserService;
import nju.utils.ResultMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.Serializable;
import java.util.List;

/**
 * Created by keenan on 04/05/2017.
 */

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    /**
     * 新增用户
     *
     * @param user 用户
     * @throws Exception
     */
    @Override
    public void addUser(User user) throws InvalidInfoException, UserExistedException, OtherException {
        if (!isValidUserInfo(user)) {
            throw new InvalidInfoException();
        } else if (null != userDao.findOneByID(user.getPersonID())) {
            throw new UserExistedException();
        } else {
            try {
                userDao.add(user);
            } catch (Exception e) {
                throw new OtherException();
            }
        }
    }

    /**
     * 更新用户信息
     *
     * @param user 用户
     * @throws Exception
     */
    @Override
    public void updateUser(User user) throws InvalidInfoException, UserNotExistException, OtherException {
        if (!isValidUserInfo(user)) {
            throw new InvalidInfoException();
        } else if (null == userDao.findOneByID(user.getPersonID())) {
            throw new UserNotExistException();
        } else {
            try {
                userDao.update(user);
            } catch (Exception e) {
                throw new OtherException();
            }
        }
    }

    /**
     * 根据ID搜索用户
     *
     * @param ID 用户ID
     * @return 对应ID的用户(搜不到传null)
     * @throws Exception
     */
    @Override
    public User findUserByID(Serializable ID) throws Exception {
        return userDao.findOneByID(ID);
    }

    /**
     * 获得所有用户
     *
     * @return 所有用户
     * @throws Exception
     */
    @Override
    public List<User> findAllUsers() throws Exception {
        return userDao.findAll();
    }

    /**
     * 用户信息是否有效
     *
     * @param user 封装的用户信息
     * @return 是否有效
     */
    private boolean isValidUserInfo(User user) {
        return !(null == user
                || StringUtils.isEmpty(user.getUsername())
                || StringUtils.isEmpty(user.getStudentRealName())
                || StringUtils.isEmpty(user.getPassword())
                || StringUtils.isEmpty(user.getPersonID())
                || StringUtils.isEmpty(user.getPhone())
                || StringUtils.isEmpty(user.getGender())
                || StringUtils.isEmpty(user.getCredits()));
    }
}
