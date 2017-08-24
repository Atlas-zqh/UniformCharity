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
     * 根据ID查找某个对象
     *
     * @param ID
     * @return 查找结果，没找到返回null
     */
    @Override
    Clothes findOneByID(String ID);

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

    List<String> findPicsByClothesID(String clothes_id);

    void addPic(String clothes_id, String pic_url);

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
