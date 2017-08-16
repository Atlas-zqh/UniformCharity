package nju.service.serviceImpl;

import nju.domain.SClass;
import nju.domain.School;
import nju.mapper.SchoolMapper;
import nju.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by keenan on 16/07/2017.
 */
@Service("schoolService")
public class SchoolServiceImpl implements SchoolService {
    @Autowired
    private SchoolMapper schoolMapper;

    /**
     * 新增学校
     *
     * @param school 学校
     */
    @Override
    public void addSchool(School school) {
        schoolMapper.add(school);
    }

    /**
     * 获得所有学校
     *
     * @return 所有学校
     */
    @Override
    public List<School> getAllSchools() {
        List<School> schools = schoolMapper.findAll();
        if (schools.isEmpty() || schools == null) {
            return Collections.EMPTY_LIST;
        }
        return schools;
    }

    /**
     * 根据学校名称查找学校
     *
     * @param schoolName 学校名称
     * @return 学校
     */
    @Override
    public List<School> findSchoolByName(String schoolName) {
        List<School> schools = schoolMapper.findSchoolByName(schoolName);
        if (schools.isEmpty() || schools == null) {
            return Collections.EMPTY_LIST;
        }
        return schools;
    }

    /**
     * 根据城市查找学校
     *
     * @param schoolCity 城市名称
     * @return 学校
     */
    @Override
    public List<School> findSchoolByCity(String schoolCity) {
        List<School> schools = schoolMapper.findSchoolByCity(schoolCity);
        if (schools.isEmpty() || schools == null) {
            return Collections.EMPTY_LIST;
        }
        return schools;
    }

    /**
     * 根据城市和区域查找学校
     *
     * @param schoolCity     城市
     * @param schoolDistrict 区
     * @return 学校
     */
    @Override
    public List<School> findSchoolByCityAndDistrict(String schoolCity, String schoolDistrict) {
        List<School> schools = schoolMapper.findSchoolByCityAndDistrict(schoolCity, schoolDistrict);
        if (schools.isEmpty() || schools == null) {
            return Collections.EMPTY_LIST;
        }
        return schools;
    }

    /**
     * 根据学校名得到所有班级
     *
     * @param schoolName 学校名
     * @return key:年级 value:所有班级
     */
    @Override
    public Map<String, List<String>> findClassBySchool(String schoolName) {
        return schoolMapper.findClassBySchool(schoolName).stream()
                .collect(Collectors.groupingBy(SClass::getSgrade, Collectors.mapping(SClass::getSclass, Collectors.toList())));
    }
}
