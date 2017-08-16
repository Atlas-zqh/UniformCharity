package nju.mapper;

import nju.domain.SClass;
import nju.domain.School;

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

    /**
     * 根据城市查找学校
     *
     * @param schoolCity 城市名称
     * @return 学校
     */
    List<School> findSchoolByCity(String schoolCity);

    /**
     * 根据城市和区域查找学校
     *
     * @param schoolCity     城市
     * @param schoolDistrict 区
     * @return 学校
     */
    List<School> findSchoolByCityAndDistrict(String schoolCity, String schoolDistrict);

    /**
     * 根据学校名得到该学校所有班级
     *
     * @param schoolName 学校名
     * @return
     */
    List<SClass> findClassBySchool(String schoolName);
}
