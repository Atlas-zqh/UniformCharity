package nju.mapper;

import nju.domain.User;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
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
    User findOneByID(Serializable ID);

    /**
     * 根据用户名查找某个对象
     *
     * @param username 用户名
     * @return 对应用户，没找到返回null
     */
    User findOneByUsername(Serializable username);

    /**
     * 获得所有该类对象
     *
     * @return 所有该类对象
     */
    List<User> findAll();
}
