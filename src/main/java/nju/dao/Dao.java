package nju.dao;

import nju.utils.ResultMessage;

import java.io.Serializable;
import java.util.List;

/**
 * Dao的接口类
 *
 * @param <T> 范型
 */
public interface Dao<T> {
    /**
     * 增加某个对象
     *
     * @param t 待添加的对象
     * @return 操作结果
     */
    void add(T t);

    /**
     * 删除某个对象
     *
     * @param t 待删除的对象
     * @return 操作结果
     */
    void delete(T t);

    /**
     * 更新某个对象
     *
     * @param t 待更新的对象
     * @return 操作结果
     */
    void update(T t);

    /**
     * 根据ID查找某个对象
     *
     * @param ID
     * @return 查找结果，没找到返回null
     */
    T findOneByID(Serializable ID);

    /**
     * 获得所有该类对象
     *
     * @return 所有该类对象
     */
    List<T> findAll();
}
