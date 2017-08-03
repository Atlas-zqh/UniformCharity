package nju.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import nju.domain.Clothes;
import nju.mapper.ClothesMapper;
import nju.service.ClothesService;
import nju.utils.ClothesAttributes;
import nju.utils.ClothesQueryHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Field;
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
    public String addClothes(Clothes clothes) {
        String auto_id = clothes.getSchoolName().hashCode() + "" + System.currentTimeMillis() + "";
        clothes.setClothesID(auto_id);
        clothesMapper.add(clothes);
        return auto_id;
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
        return clothesMapper.findOneByID(clothesID);
    }

    /**
     * 根据衣物属性搜索衣物（可多种属性同时查询）
     *
     * @param attributes 衣物属性
     * @return
     */
    @Override
    public PageInfo<Clothes> findClothesByAttributes(Map<ClothesAttributes, String> attributes, int pageNo, int pageSize) {
        ClothesQueryHelper helper = getQueryHelper(attributes);
        PageHelper.startPage(pageNo, pageSize);
        List<Clothes> clothes = clothesMapper.findByAttribute(helper);
        PageInfo<Clothes> pageInfo = new PageInfo<>(clothes);
        return pageInfo;
    }

    /**
     * 获得所有衣物
     *
     * @return
     */
    @Override
    public PageInfo<Clothes> getAllClothes(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Clothes> clothes = clothesMapper.findAll();
        PageInfo<Clothes> clothesPageInfo = new PageInfo<>(clothes);
        return clothesPageInfo;
    }

    /**
     * 将map封装为 ClothesQueryHelper
     *
     * @param attributes
     * @return
     */
    private ClothesQueryHelper getQueryHelper(Map<ClothesAttributes, String> attributes) {
        ClothesQueryHelper helper = new ClothesQueryHelper();
        Class<ClothesQueryHelper> clazz = ClothesQueryHelper.class;
        try {
            for (Map.Entry<ClothesAttributes, String> entry : attributes.entrySet()) {
                Field field = clazz.getDeclaredField(entry.getKey().toString());
                field.setAccessible(true);
                field.set(helper, entry.getValue());
            }
            return helper;
        } catch (Exception e) {
            return new ClothesQueryHelper();
        }
    }

    @Override
    public boolean addPic(String clothes_id, String pic_url) {
        try {
            clothesMapper.addPic(clothes_id, pic_url);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 根据衣物ID搜索图片
     *
     * @param clothes_id
     * @return
     */
    @Override
    public List<String> findPicsByClothesID(String clothes_id) {
        return clothesMapper.findPicsByClothesID(clothes_id);
    }

    /**
     * 移除图片
     *
     * @param clothes_id
     * @param pic_url
     * @return 是否成功
     */
    @Override
    public boolean removePic(String clothes_id, String pic_url) {
        try {
            clothesMapper.removePic(clothes_id, pic_url);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
