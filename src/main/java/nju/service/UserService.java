package nju.service;

import com.github.pagehelper.PageInfo;
import nju.domain.CreditRecord;
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
}
