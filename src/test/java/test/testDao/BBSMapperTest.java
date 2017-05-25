package test.testDao;

import nju.domain.Board;
import nju.mapper.BBSMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import test.BaseTest;

/**
 * Created by keenan on 25/05/2017.
 */
public class BBSMapperTest extends BaseTest {
    @Autowired
    private BBSMapper bbsMapper;

    @Test
    public void testAddBoard() {

        Board board = new Board("斑斑驳驳");
        bbsMapper.insertBoard(board);

    }
}
