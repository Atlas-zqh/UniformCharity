package nju.mapper;

import nju.domain.CreditStatistic;
import nju.domain.User;

import java.util.List;

/**
 * Created by keenan on 04/05/2017.
 */

public interface UserMapper extends Mapper<User> {
    /**
     * 增加某个对象
     *
     * @param user 待添加的对象
     * @return 操作结果
     */
    void add(User user);

    /**
     * 删除某个对象
     *
     * @param user 待删除的对象
     * @return 操作结果
     */
    void delete(User user);

    /**
     * 更新某个对象
     *
     * @param user 待更新的对象
     * @return 操作结果
     */
    void update(User user);

    /**
     * 根据ID查找某个对象
     *
     * @param ID
     * @return 查找结果，没找到返回null
     */
    User findOneByID(String ID);

    /**
     * 根据用户名查找某个对象
     *
     * @param username 用户名
     * @return 对应用户，没找到返回null
     */
    User findOneByUsername(String username);

    /**
     * 获得所有该类对象
     *
     * @return 所有该类对象
     */
    List<User> findAll();

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
}
