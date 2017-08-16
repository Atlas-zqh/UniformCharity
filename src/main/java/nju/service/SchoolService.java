package nju.service;

import nju.domain.School;

import java.util.List;
import java.util.Map;

/**
 * Created by keenan on 16/07/2017.
 */
public interface SchoolService {
    /**
     * 新增学校
     *
     * @param school 学校
     */
    void addSchool(School school);

    /**
     * 获得所有学校
     *
     * @return 所有学校
     */
    List<School> getAllSchools();

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
     * 根据学校名得到所有班级
     *
     * @param schoolName 学校名
     * @return key:年级 value:所有班级
     */
    Map<String, List<String>> findClassBySchool(String schoolName);
}
