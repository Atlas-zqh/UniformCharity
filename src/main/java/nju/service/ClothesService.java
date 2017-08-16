package nju.service;

import com.github.pagehelper.PageInfo;
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
     * @return clothesID
     */
    String addClothes(Clothes clothes);

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
    PageInfo<Clothes> findClothesByAttributes(Map<ClothesAttributes, String> attributes, int pageNo, int pageSize);

    /**
     * 获得所有衣物
     *
     * @return
     */
    PageInfo<Clothes> getAllClothes(int pageNo, int pageSize);

    /**
     * 增加图片
     *
     * @param clothes_id
     * @param pic_url
     * @return 是否成功
     */
    boolean addPic(String clothes_id, String pic_url);

    /**
     * 根据衣物ID搜索图片
     *
     * @param clothes_id
     * @return
     */
    List<String> findPicsByClothesID(String clothes_id);

    /**
     * 移除图片
     *
     * @param clothes_id
     * @param pic_url
     * @return 是否成功
     */
    boolean removePic(String clothes_id, String pic_url);

    //TODO 衣物增加默认图片
}
