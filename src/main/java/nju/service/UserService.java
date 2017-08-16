package nju.service;

import com.github.pagehelper.PageInfo;
import nju.domain.CreditRecord;
import nju.domain.CreditStatistic;
import nju.domain.FinancialRecord;
import nju.domain.User;

import java.io.Serializable;
import java.util.List;

/**
 * Created by keenan on 04/05/2017.
 */
public interface UserService {
    /**
     * 新增用户
     *
     * @param user 用户
     * @throws Exception
     */
    void addUser(User user) throws Exception;

    /**
     * 更新用户信息
     *
     * @param user 用户
     * @throws Exception
     */
    void updateUser(User user) throws Exception;

    /**
     * 根据用户名搜索用户
     *
     * @param username 用户名
     * @return 对应用户名的用户
     * @throws Exception
     */
    User findUserByUsername(Serializable username) throws Exception;

    /**
     * 根据ID搜索用户
     *
     * @param ID 用户ID
     * @return 对应ID的用户
     * @throws Exception
     */
    User findUserByID(Serializable ID) throws Exception;

    /**
     * 获得所有用户
     *
     * @return 所有用户
     * @throws Exception
     */
    List<User> findAllUsers() throws Exception;

    /**
     * 根据用户ID搜索信用记录（返回的信用记录按时间倒序排列）
     *
     * @param userID
     * @return
     */
    PageInfo<CreditRecord> findCreditRecordByUserID(String userID, int pageNo, int pageSize);

    PageInfo<FinancialRecord> findFinancialRecordByUserID(String user_id, int pageNo, int pageSize);

    /**
     * 得到一个班级的所有学生
     *
     * @param school 学校名
     * @param sgrade 年级
     * @param sclass 班级
     * @return
     */
    List<User> findUserByClass(String school, String sgrade, String sclass);

    /**
     * 得到一个年级的所有学生
     *
     * @param school 学校名
     * @param sgrade 年级
     * @return
     */
    List<User> findUserByGrade(String school, String sgrade);

    /**
     * 得到一个学校的所有学校
     *
     * @param school 学校名
     * @return
     */
    List<User> findUserBySchool(String school);

    /**
     * 根据学校和给定年级得到该年级的公益积分统计数据
     *
     * @param school 学校名
     * @param sgrade 年级
     * @return
     */
    CreditStatistic getAllCreditsByGrade(String school, String sgrade);

    /**
     * 根据学校名得到该学校所有年级的公益积分统计数据
     *
     * @param school 学校名
     * @return
     */
    List<CreditStatistic> getAllGradeCreditsSum(String school);

    /**
     * 根据学校名、年级和班级给出该班级的公益积分统计数据
     *
     * @param school 学校名
     * @param sgrade 年级
     * @param sclass 班级
     * @return
     */
    CreditStatistic getAllCreditsByGradeAndClass(String school, String sgrade, String sclass);

    /**
     * 根据学校名和年级得到该年级所有班级的公益积分统计数据
     *
     * @param school 学校名
     * @param sgrade 年级
     * @return
     */
    List<CreditStatistic> getAllClassCreditsSumByGrade(String school, String sgrade);

    /**
     * 给定学校名得到该学校所有班级的公益积分统计数据
     *
     * @param school 学校名
     * @return
     */
    List<CreditStatistic> getAllClassCreditsSumBySchool(String school);



}
