package nju.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import nju.domain.*;
import nju.exception.InvalidInfoException;
import nju.exception.OtherException;
import nju.exception.UserExistedException;
import nju.exception.UserNotExistException;
import nju.mapper.CreditRecordMapper;
import nju.mapper.FinancialRecordMapper;
import nju.mapper.ManagerMapper;
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

    @Autowired
    private FinancialRecordMapper financialRecordMapper;

    @Autowired
    private ManagerMapper managerMapper;

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
        } else if (null != userMapper.findOneByUsername(EncryptionUtil.encrypt("20170522", user.getUsername()))) {
            throw new UserExistedException();
        } else {
            try {
                userMapper.add(user.clone());
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
        } else if (null == userMapper.findOneByUsername(EncryptionUtil.encrypt("20170522", user.getUsername()))) {
            throw new UserNotExistException();
        } else {
            try {
                userMapper.update(user.clone());
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
     * 根据用户ID搜索信用记录（返回的信用记录按时间倒序排列）
     *
     * @param userID
     * @return
     */
    @Override
    public PageInfo<CreditRecord> findCreditRecordByUserID(String userID, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        String id = EncryptionUtil.encrypt("20170522", userID);
        List<CreditRecord> creditRecords = creditRecordMapper.findRecordByUserID(id);
        creditRecords.sort((CreditRecord l1, CreditRecord l2) -> l2.getCreateTime().compareTo(l1.getCreateTime()));
        return new PageInfo<>(creditRecords);
    }

    /**
     * 根据用户ID搜索资金记录（返回的信用记录按时间倒序排列）
     *
     * @param user_id
     * @return
     */
    @Override
    public PageInfo<FinancialRecord> findFinancialRecordByUserID(String user_id, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        String id = EncryptionUtil.encrypt("20170522", user_id);
        List<FinancialRecord> financialRecords = financialRecordMapper.findRecordByUserID(id);
        return new PageInfo<>(financialRecords);
    }

    /**
     * 得到一个班级的所有学生
     *
     * @param school 学校名
     * @param sgrade 年级
     * @param sclass 班级
     * @return
     */
    @Override
    public List<User> findUserByClass(String school, String sgrade, String sclass) {
        return userMapper.findUserByClass(school, sgrade, sclass);
    }

    /**
     * 得到一个年级的所有学生
     *
     * @param school 学校名
     * @param sgrade 年级
     * @return
     */
    @Override
    public List<User> findUserByGrade(String school, String sgrade) {
        return userMapper.findUserByGrade(school, sgrade);
    }

    /**
     * 得到一个学校的所有学校
     *
     * @param school 学校名
     * @return
     */
    @Override
    public List<User> findUserBySchool(String school) {
        return userMapper.findUserBySchool(school);
    }

    /**
     * 根据学校和给定年级得到该年级的公益积分统计数据
     *
     * @param school 学校名
     * @param sgrade 年级
     * @return
     */
    @Override
    public CreditStatistic getAllCreditsByGrade(String school, String sgrade) {
        return userMapper.getAllCreditsByGrade(school, sgrade);
    }

    /**
     * 根据学校名得到该学校所有年级的公益积分统计数据
     *
     * @param school 学校名
     * @return
     */
    @Override
    public List<CreditStatistic> getAllGradeCreditsSum(String school) {
        return userMapper.getAllGradeCreditsSum(school);
    }

    /**
     * 根据学校名、年级和班级给出该班级的公益积分统计数据
     *
     * @param school 学校名
     * @param sgrade 年级
     * @param sclass 班级
     * @return
     */
    @Override
    public CreditStatistic getAllCreditsByGradeAndClass(String school, String sgrade, String sclass) {
        return userMapper.getAllCreditsByGradeAndClass(school, sgrade, sclass);
    }

    /**
     * 根据学校名和年级得到该年级所有班级的公益积分统计数据
     *
     * @param school 学校名
     * @param sgrade 年级
     * @return
     */
    @Override
    public List<CreditStatistic> getAllClassCreditsSumByGrade(String school, String sgrade) {
        return userMapper.getAllClassCreditsSumByGrade(school, sgrade);
    }

    /**
     * 给定学校名得到该学校所有班级的公益积分统计数据
     *
     * @param school 学校名
     * @return
     */
    @Override
    public List<CreditStatistic> getAllClassCreditsSumBySchool(String school) {
        return userMapper.getAllClassCreditsSumBySchool(school);
    }

    /**
     * 新增学校管理员
     *
     * @param manager 管理员ID自动生成
     */
    @Override
    public void addManager(Manager manager) throws InvalidInfoException, UserExistedException, OtherException {
        if (!isValidManagerInfo(manager)) {
            throw new InvalidInfoException();
        } else if (null != managerMapper.findOneByUsername(EncryptionUtil.encrypt("20170522", manager.getUsername()))) {
            throw new UserExistedException("管理员已存在");
        } else {
            try {
                managerMapper.add(manager.clone());
            } catch (Exception e) {
                throw new OtherException();
            }
        }
    }

    /**
     * 更新学校管理员信息
     *
     * @param manager
     */
    @Override
    public void updateManager(Manager manager) throws InvalidInfoException, UserExistedException, OtherException {
        if (!isValidManagerInfo(manager)) {
            throw new InvalidInfoException();
        } else if (null != managerMapper.findOneByUsername(EncryptionUtil.encrypt("20170522", manager.getUsername()))) {
            throw new UserExistedException("管理员已存在");
        } else {
            try {
                managerMapper.update(manager.clone());
            } catch (Exception e) {
                throw new OtherException();
            }
        }
    }

    /**
     * 根据ID查找学校管理员
     *
     * @param managerID
     * @return
     */
    @Override
    public Manager findManagerByID(Integer managerID) {
        return managerMapper.findOneByID(managerID);
    }

    /**
     * 根据用户名查找管理员
     *
     * @param username
     * @return
     */
    @Override
    public Manager findManagerByUsername(String username) {
        return managerMapper.findOneByUsername(EncryptionUtil.encrypt("20170522", username));
    }

    /**
     * 得到所有管理员
     *
     * @return
     */
    @Override
    public List<Manager> findAllManagers() {
        return managerMapper.findAll();
    }

    /**
     * 获得系统管理员账户
     *
     * @return
     */
    @Override
    public Manager findSystemManger() {
        return managerMapper.findOneByUsername(EncryptionUtil.encrypt("20170522", "admin"));
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
                || StringUtils.isEmpty(user.getGender()));
    }

    /**
     * 管理员信息是否有效
     *
     * @param manager
     * @return
     */
    private boolean isValidManagerInfo(Manager manager) {
        return !(null == manager
                || StringUtils.isEmpty(manager.getUsername())
                || manager.getUsername().equals("admin")
                || StringUtils.isEmpty(manager.getPassword())
                || StringUtils.isEmpty(manager.getSchoolName())
        );
    }
}
