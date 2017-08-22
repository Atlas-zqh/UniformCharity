package nju.service;

import com.github.pagehelper.PageInfo;
import nju.domain.Passage;

/**
 * @author keenan on 22/08/2017
 */
public interface PassageService {
    /**
     * 新增文章
     *
     * @param passage
     */
    void addPassage(Passage passage);

    /**
     * 更新文章
     *
     * @param passage
     */
    void updatePassage(Passage passage);

    /**
     * 删除文章
     *
     * @param passage
     */
    void deletePassage(Passage passage);

    /**
     * 根据文章ID搜索文章
     *
     * @param passage_id
     * @return
     */
    Passage findPassageByID(Integer passage_id);

    /**
     * 获得所有文章
     *
     * @return
     */
    PageInfo<Passage> findAllPassages(int pageNo, int pageSize);
}
