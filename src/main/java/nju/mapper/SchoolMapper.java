package nju.mapper;

import nju.domain.School;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

/**
 * Created by keenan on 22/05/2017.
 */
public interface SchoolMapper extends Mapper<School> {
    /**
     * 增加某个对象
     *
     * @param school 待添加的对象
     * @return 操作结果
     */
    @Override
    void add(School school);

    /**
     * 删除某个对象
     *
     * @param school 待删除的对象
     * @return 操作结果
     */
    @Override
    void delete(School school);

    /**
     * 更新某个对象
     *
     * @param school 待更新的对象
     * @return 操作结果
     */
    @Override
    void update(School school);

    /**
     * 获得所有该类对象
     *
     * @return 所有该类对象
     */
    @Override
    List<School> findAll();

    /**
     * 根据学校名称查找学校
     *
     * @param schoolName 学校名称
     * @return 学校
     */
    List<School> findSchoolByName(String schoolName);
}
