package nju.service;

import nju.domain.Clothes;
import nju.utils.ClothesAttributes;

import java.util.List;
import java.util.Map;

/**
 * Created by keenan on 16/07/2017.
 */
public interface ClothesService {
    /**
     * 新增衣物
     *
     * @param clothes
     */
    void addClothes(Clothes clothes);

    /**
     * 更新衣物信息
     *
     * @param clothes
     */
    void updateClothes(Clothes clothes);

    /**
     * 根据衣物ID搜索衣物
     *
     * @param clothesID
     * @return
     */
    Clothes findClothesByClothesID(String clothesID);

    /**
     * 根据衣物属性搜索衣物（可多种属性同时查询）
     *
     * @param attributes 衣物属性
     * @return
     */
    List<Clothes> findClothesByAttributes(Map<ClothesAttributes, String> attributes);

    /**
     * 获得所有衣物
     *
     * @return
     */
    List<Clothes> getAllClothes();

}
