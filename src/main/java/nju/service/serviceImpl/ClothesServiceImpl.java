package nju.service.serviceImpl;

import nju.domain.Clothes;
import nju.mapper.ClothesMapper;
import nju.service.ClothesService;
import nju.utils.ClothesAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * Created by keenan on 17/07/2017.
 */
@Service("clothesService")
public class ClothesServiceImpl implements ClothesService {
    @Autowired
    private ClothesMapper clothesMapper;

    /**
     * 新增衣物
     *
     * @param clothes
     */
    @Override
    public void addClothes(Clothes clothes) {
        clothesMapper.add(clothes);
    }

    /**
     * 更新衣物信息
     *
     * @param clothes
     */
    @Override
    public void updateClothes(Clothes clothes) {
        clothesMapper.update(clothes);
    }

    /**
     * 根据衣物ID搜索衣物
     *
     * @param clothesID
     * @return
     */
    @Override
    public Clothes findClothesByClothesID(String clothesID) {
        return null;
    }

    /**
     * 根据衣物属性搜索衣物（可多种属性同时查询）
     *
     * @param attributes 衣物属性
     * @return
     */
    @Override
    public List<Clothes> findClothesByAttributes(Map<ClothesAttributes, String> attributes) {
        List<Clothes> allClothes = clothesMapper.findAll();
        for (Map.Entry<ClothesAttributes, String> entry : attributes.entrySet()) {
            allClothes = findCorreClothes(entry.getKey(), entry.getValue(), allClothes);
            if (allClothes.isEmpty()) {
                return allClothes;
            }
        }
        return allClothes;
    }

    /**
     * 获得所有衣物
     *
     * @return
     */
    @Override
    public List<Clothes> getAllClothes() {
        return clothesMapper.findAll();
    }

    private List<Clothes> findCorreClothes(ClothesAttributes attribute, String value, List<Clothes> fromCollection) {
        Class<Clothes> clazz = Clothes.class;
        List<Clothes> match = new ArrayList<>();
        try {
            Method method = clazz.getMethod("get" + attribute.toString());
            for (Clothes clothes : fromCollection) {
                String val = (String) method.invoke(clothes);
                if (val.equals(value)) {
                    match.add(clothes);
                }
            }
        } catch (NoSuchMethodException e) {
            return new ArrayList<>();
        } catch (IllegalAccessException e) {
            return new ArrayList<>();
        } catch (InvocationTargetException e) {
            return new ArrayList<>();
        }

        return match;
    }

}
