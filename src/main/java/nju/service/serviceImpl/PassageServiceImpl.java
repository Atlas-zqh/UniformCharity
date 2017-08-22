package nju.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import nju.domain.Passage;
import nju.mapper.PassageMapper;
import nju.service.PassageService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author keenan on 22/08/2017
 */
public class PassageServiceImpl implements PassageService {
    @Autowired
    private PassageMapper passageMapper;

    /**
     * 新增文章
     *
     * @param passage
     */
    @Override
    public void addPassage(Passage passage) {
        passage.setPtime(System.currentTimeMillis());
        passageMapper.add(passage);
    }

    /**
     * 更新文章
     *
     * @param passage
     */
    @Override
    public void updatePassage(Passage passage) {
        passageMapper.update(passage);
    }

    /**
     * 删除文章
     *
     * @param passage
     */
    @Override
    public void deletePassage(Passage passage) {
        passageMapper.delete(passage);
    }

    /**
     * 根据文章ID搜索文章
     *
     * @param passage_id
     * @return
     */
    @Override
    public Passage findPassageByID(Integer passage_id) {
        return passageMapper.findOneByID(passage_id);
    }

    /**
     * 获得所有文章
     *
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Override
    public PageInfo<Passage> findAllPassages(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Passage> passages = passageMapper.findAll();
        return new PageInfo<>(passages);
    }
}
