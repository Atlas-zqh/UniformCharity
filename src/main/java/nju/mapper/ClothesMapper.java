package nju.mapper;

import nju.domain.Clothes;

import java.io.Serializable;
import java.util.List;

/**
 * Created by keenan on 24/05/2017.
 */

public interface ClothesMapper extends Mapper<Clothes> {
    /**
     * 增加某个对象
     *
     * @param clothes 待添加的对象
     * @return 操作结果
     */
    @Override
    void add(Clothes clothes);

    /**
     * 更新某个对象
     *
     * @param clothes 待更新的对象
     * @return 操作结果
     */
    @Override
    void update(Clothes clothes);

    /**
     * 根据ID查找某个对象
     *
     * @param ID
     * @return 查找结果，没找到返回null
     */
    @Override
    Clothes findOneByID(Serializable ID);

    /**
     * 获得所有该类对象
     *
     * @return 所有该类对象
     */
    @Override
    List<Clothes> findAll();
}
