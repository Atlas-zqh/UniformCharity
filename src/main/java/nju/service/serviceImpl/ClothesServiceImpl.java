package nju.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import nju.domain.Clothes;
import nju.domain.ClothesHistory;
import nju.domain.CreditRecord;
import nju.domain.User;
import nju.mapper.ClothesMapper;
import nju.mapper.CreditRecordMapper;
import nju.mapper.TypeMapper;
import nju.mapper.UserMapper;
import nju.service.ClothesService;
import nju.utils.ClothesAttributes;
import nju.utils.ClothesQueryHelper;
import nju.utils.EncryptionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by keenan on 17/07/2017.
 */
@Service("clothesService")
public class ClothesServiceImpl implements ClothesService {
    @Autowired
    private ClothesMapper clothesMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CreditRecordMapper creditRecordMapper;
    @Autowired
    private TypeMapper typeMapper;

    /**
     * 新增衣物
     *
     * @param clothes
     */
    @Override
    public String addClothes(Clothes clothes) {
        String donor_id = clothes.getDonorID();
        long current = System.currentTimeMillis();
        Date date = new Date(current);
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String did = format.format(date);
        String auto_id = donor_id.substring(donor_id.length() - 4) + did;
        clothes.setClothesID(auto_id);
        clothesMapper.add(clothes.clone());

        // 增加公益记录
        double price = typeMapper.findType(clothes.getSchoolName(), clothes.getClothesType()).getClothesPrice();
        addCreditRecord(donor_id, CreditRecord.DONATE_CLOTHES, auto_id, price);
        return auto_id;
    }

    /**
     * 更新衣物信息
     *
     * @param clothes
     */
    @Override
    public void updateClothes(Clothes clothes) {
        clothesMapper.update(clothes.clone());
    }

    /**
     * 上传n手衣物（要在clothes的times属性写清第几次）
     *
     * @param clothes
     * @return clothesID
     */
    @Override
    public String addSecondHandClothes(Clothes clothes) {
        clothesMapper.updateTimes(clothes.getClothesID());
        clothesMapper.add(clothes.clone());

        double price = typeMapper.findType(clothes.getSchoolName(), clothes.getClothesType()).getClothesPrice();
        addCreditRecord(clothes.getDonorID(), CreditRecord.DONATE_CLOTHES, clothes.getClothesID(), price);
        return clothes.getClothesID();
    }

    /**
     * 根据数据库中的id搜索衣物
     *
     * @param auto_id
     * @return
     */
    @Override
    public Clothes findClothesByAutoID(Integer auto_id) {
        return clothesMapper.findOneByAutoID(auto_id);
    }

    /**
     * 根据衣物ID搜索衣物
     *
     * @param clothesID
     * @return
     */
    @Override
    public Clothes findClothesByClothesID(String clothesID) {
        List<Clothes> clothes = filterDuplicateClothes(clothesMapper.findOneByClothesID(clothesID));
        if (!clothes.isEmpty()) {
            return clothes.get(0);
        } else {
            return null;
        }
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
        List<Clothes> clothes = filterDuplicateClothes(clothesMapper.findByAttribute(helper));
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
        List<Clothes> clothes = filterDuplicateClothes(clothesMapper.findAll());
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

    /**
     * 更新衣物故事
     *
     * @param clothesHistory
     */
    @Override
    public void updateClothesHistory(ClothesHistory clothesHistory) {
        clothesMapper.updateClothesHistory(clothesHistory);
    }

    /**
     * 搜索某一件衣物的衣物故事
     *
     * @param clothesID
     * @return 按照时间升序排列的衣物故事（次序可以看出是第n次）
     */
    @Override
    public List<ClothesHistory> findClothesHistoryByClothesID(String clothesID) {
        return clothesMapper.findClothesHistoryByClothesID(clothesID);
    }

    /**
     * 增加信用记录
     * 完成订单 和 捐赠衣物 的同时会创建公益记录，不需要调这个方法
     *
     * @param userID
     * @param recordtype 记录类型 CreditRecord.____
     * @param clothesID
     * @param variance   变化值
     */
    @SuppressWarnings("Duplicates")
    private void addCreditRecord(String userID, Integer recordtype, String clothesID, Double variance) {
        User user = userMapper.findOneByID(EncryptionUtil.encrypt("20170522", userID));
        Double credit = user.getCredits();
        credit += variance;
        user.setCredits(credit);
        userMapper.update(user.clone());

//        String createTime = System.currentTimeMillis() + "";
        CreditRecord record = new CreditRecord(EncryptionUtil.encrypt("20170522", userID), recordtype, clothesID, variance, credit, System.currentTimeMillis());
        creditRecordMapper.addRecord(record.clone());
    }

    /**
     * 去除重复的衣物(结果留下auto_id最大的)
     *
     * @param clothesList
     * @return
     */
    private List<Clothes> filterDuplicateClothes(List<Clothes> clothesList) {
        Map<String, Clothes> clothesMap = new HashMap<>();
        for (Clothes clothes : clothesList) {
            if (clothesMap.get(clothes.getClothesID()) == null) {
                clothesMap.put(clothes.getClothesID(), clothes);
            } else {
                Clothes old = clothesMap.get(clothes.getClothesID());
                if (old.getAuto_id() < clothes.getAuto_id()) {
                    clothesMap.replace(clothes.getClothesID(), old, clothes);
                }
            }
        }
        return new ArrayList<>(clothesMap.values());
    }
}
