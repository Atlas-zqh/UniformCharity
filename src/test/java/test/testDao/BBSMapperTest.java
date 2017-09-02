package test.testDao;

import nju.domain.Board;
import nju.domain.Post;
import nju.mapper.BBSMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import test.BaseTest;

import java.util.List;

/**
 * Created by keenan on 25/05/2017.
 */
public class BBSMapperTest extends BaseTest {
    @Autowired
    private BBSMapper bbsMapper;

    @Test
    public void testAddBoard() {
//        Board board = new Board("斑斑驳驳");
//        bbsMapper.insertBoard(board);
    }


    @Test
    public void testGetBoard() {
        Board board = bbsMapper.findBoardByBoardID(4);

        if (board == null) {
            System.out.println("NULL");
        } else {
            System.out.println(board.toString());

        }
    }

    @Test
    public void testGetLatestTenPosts() {
        List<Post> posts = bbsMapper.getLatestTenPosts();
        for (Post post : posts) {
            System.out.println("====    " + post.toString());
        }
    }
}
