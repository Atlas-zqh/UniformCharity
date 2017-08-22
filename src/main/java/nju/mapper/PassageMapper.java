package nju.mapper;

import nju.domain.Passage;

import java.util.List;

/**
 * @author keenan on 22/08/2017
 */
public interface PassageMapper extends Mapper<Passage> {
    /**
     * 增加某个对象
     *
     * @param passage 待添加的对象
     * @return 操作结果
     */
    @Override
    void add(Passage passage);

    /**
     * 删除某个对象
     *
     * @param passage 待删除的对象
     * @return 操作结果
     */
    @Override
    void delete(Passage passage);

    /**
     * 更新某个对象
     *
     * @param passage 待更新的对象
     * @return 操作结果
     */
    @Override
    void update(Passage passage);

    /**
     * 根据ID查找某个对象
     *
     * @param passage_id
     * @return 查找结果，没找到返回null
     */
    Passage findOneByID(Integer passage_id);

    /**
     * 获得所有该类对象
     *
     * @return 所有该类对象
     */
    @Override
    List<Passage> findAll();
}
