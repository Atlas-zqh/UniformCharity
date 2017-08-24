package nju.mapper;

import nju.domain.Manager;

import java.util.List;

/**
 * @author keenan on 23/08/2017
 */
public interface ManagerMapper extends Mapper<Manager> {
    /**
     * 增加某个对象
     *
     * @param manager 待添加的对象
     * @return 操作结果
     */
    @Override
    void add(Manager manager);

    /**
     * 更新某个对象
     *
     * @param manager 待更新的对象
     * @return 操作结果
     */
    @Override
    void update(Manager manager);

    /**
     * 根据ID查找某个对象
     *
     * @param ID
     * @return 查找结果，没找到返回null
     */
    Manager findOneByID(Integer ID);

    /**
     * 根据用户名查找管理员
     *
     * @param username
     * @return
     */
    Manager findOneByUsername(String username);

    /**
     * 获得所有该类对象
     *
     * @return 所有该类对象
     */
    @Override
    List<Manager> findAll();
}
