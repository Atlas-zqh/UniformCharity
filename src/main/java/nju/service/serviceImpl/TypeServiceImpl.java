package nju.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import nju.domain.Type;
import nju.mapper.TypeMapper;
import nju.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by keenan on 17/07/2017.
 */
@Service("typeService")
public class TypeServiceImpl implements TypeService {
    @Autowired
    private TypeMapper typeMapper;

    @Override
    public void addType(Type type) {
        typeMapper.addType(type);
    }

    @Override
    public void modifyType(Type type) {
        typeMapper.modifyType(type);
    }

    @Override
    public List<Type> findAllTypesOfSchool(String schoolName) {
        return typeMapper.findAllTypesOfSchool(schoolName);
    }

    @Override
    public List<Type> findAllTypes() {
        return typeMapper.findAllTypes();
    }

    @Override
    public Type findType(String schoolName, String clothesType) {
        return typeMapper.findType(schoolName, clothesType);
    }
}
