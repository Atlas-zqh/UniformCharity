package nju.service;

import nju.domain.Type;

import java.util.List;

/**
 * Created by keenan on 17/07/2017.
 */
public interface TypeService {
    void addType(Type type);

    void modifyType(Type type);

    List<Type> findAllTypesOfSchool(String schoolName);

    List<Type> findAllTypes();

    Type findType(String schoolName, String clothesType);
}
