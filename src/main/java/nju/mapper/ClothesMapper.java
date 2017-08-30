package nju.mapper;

import nju.domain.Clothes;
import nju.domain.ClothesHistory;
import nju.utils.ClothesQueryHelper;

import java.util.List;

/**
 * Created by keenan on 24/05/2017.
 */

public interface ClothesMapper extends Mapper<Clothes> {
    /**
     * 增加某个对象
     *
     * @param clothes 待添加的对象
     * @return 操作结果
     */
    @Override
    void add(Clothes clothes);

    /**
     * 更新某个对象
     *
     * @param clothes 待更新的对象
     * @return 操作结果
     */
    @Override
    void update(Clothes clothes);

    /**
     * 衣物次数+1
     *
     * @param clothesID
     */
    void updateTimes(String clothesID);

    /**
     * 根据ID查找某个对象
     *
     * @param ID
     * @return 查找结果，没找到返回null
     */
    List<Clothes> findOneByClothesID(String ID);

    /**
     * 根据自动生成的ID查找衣物
     *
     * @param auto_id
     * @return
     */
    Clothes findOneByAutoID(Integer auto_id);

    /**
     * 获得所有该类对象
     *
     * @return 所有该类对象
     */
    @Override
    List<Clothes> findAll();

    /**
     * 根据属性搜索
     *
     * @param helper
     * @return
     */
    List<Clothes> findByAttribute(ClothesQueryHelper helper);

    /**
     * 根据衣物ID查找图片
     * @param clothes_id
     * @return
     */
    List<String> findPicsByClothesID(String clothes_id);

    /**
     * 新增图片
     * @param clothes_id
     * @param pic_url
     */
    void addPic(String clothes_id, String pic_url);

    /**
     * 移除图片
     * @param clothes_id
     * @param pic_url
     */
    void removePic(String clothes_id, String pic_url);

    /**
     * 新增衣物故事
     *
     * @param clothesHistory
     */
    void addClothesHistory(ClothesHistory clothesHistory);

    /**
     * 更新衣物故事
     *
     * @param clothesHistory
     */
    void updateClothesHistory(ClothesHistory clothesHistory);

    /**
     * 搜索某一件衣物的衣物故事
     *
     * @param clothesID
     * @return
     */
    List<ClothesHistory> findClothesHistoryByClothesID(String clothesID);
}
