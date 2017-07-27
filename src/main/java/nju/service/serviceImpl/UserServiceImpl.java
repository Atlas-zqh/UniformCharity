package nju.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import nju.domain.CreditRecord;
import nju.domain.User;
import nju.exception.InvalidInfoException;
import nju.exception.OtherException;
import nju.exception.UserExistedException;
import nju.exception.UserNotExistException;
import nju.mapper.CreditRecordMapper;
import nju.mapper.UserMapper;
import nju.service.UserService;
import nju.utils.EncryptionUtil;
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
    private UserMapper userMapper;

    @Autowired
    private CreditRecordMapper creditRecordMapper;

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
        } else if (null != userMapper.findOneByUsername(user.getUsername())) {
            throw new UserExistedException();
        } else {
            try {
                userMapper.add(user);
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
        } else if (null == userMapper.findOneByUsername(user.getUsername())) {
            throw new UserNotExistException();
        } else {
            try {
                userMapper.update(user);
            } catch (Exception e) {
                throw new OtherException();
            }
        }
    }

    /**
     * 根据用户名搜索用户
     *
     * @param username 用户名
     * @return 对应用户名的用户(搜不到传null)
     * @throws Exception
     */
    @Override
    public User findUserByUsername(Serializable username) throws Exception {
        return userMapper.findOneByUsername(EncryptionUtil.encrypt("20170522", (String) username));
    }

    /**
     * 根据ID搜索用户
     *
     * @param ID 用户ID
     * @return 对应ID的用户
     * @throws Exception
     */
    @Override
    public User findUserByID(Serializable ID) throws Exception {
        return userMapper.findOneByID(EncryptionUtil.encrypt("20170522", (String) ID));
    }

    /**
     * 获得所有用户
     *
     * @return 所有用户
     * @throws Exception
     */
    @Override
    public List<User> findAllUsers() throws Exception {
        return userMapper.findAll();
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
                || StringUtils.isEmpty(user.getRealName())
                || StringUtils.isEmpty(user.getPassword())
                || StringUtils.isEmpty(user.getPersonID())
                || StringUtils.isEmpty(user.getPhone())
                || StringUtils.isEmpty(user.getGender())
                || StringUtils.isEmpty(user.getCredits()));
    }

    /**
     * 增加信用记录
     * 完成订单 和 捐赠衣物 的同时会创建公益记录，不需要调这个方法
     *
     * @param userID
     * @param recordtype 记录类型 CreditRecord.____
     * @param clothesID
     * @param variance   变化值
     */
    @Override
    public void addCreditRecord(String userID, Integer recordtype, String clothesID, Double variance) {
        User user = userMapper.findOneByID(EncryptionUtil.encrypt("20170522", userID));
        Double credit = user.getCredits();
        credit += variance;
        user.setCredits(credit);
        userMapper.update(user);

//        String createTime = System.currentTimeMillis() + "";
        CreditRecord record = new CreditRecord(EncryptionUtil.encrypt("20170522", userID), recordtype, clothesID, variance, credit, System.currentTimeMillis());
        creditRecordMapper.addRecord(record);
    }

    /**
     * 根据用户ID搜索信用记录（返回的信用记录按时间倒序排列）
     *
     * @param userID
     * @return
     */
    @Override
    public PageInfo<CreditRecord> findRecordByUserID(String userID, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        String id = EncryptionUtil.encrypt("20170522", userID);
        List<CreditRecord> creditRecords = creditRecordMapper.findRecordByUserID(id);
        creditRecords.sort((CreditRecord l1, CreditRecord l2) -> l2.getCreateTime().compareTo(l1.getCreateTime()));
        return new PageInfo<>(creditRecords);
    }
}
