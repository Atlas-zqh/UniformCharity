package nju.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import nju.domain.Board;
import nju.domain.Post;
import nju.domain.Reply;
import nju.exception.InvalidInfoException;
import nju.mapper.BBSMapper;
import nju.service.BBSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bbsService")
public class BBSServiceImpl implements BBSService {
    @Autowired
    private BBSMapper bbsMapper;

    /**
     * 获得所有板块
     *
     * @return 所有板块
     */
    @Override
    public List<Board> getAllBoards() {
        return bbsMapper.getAllBoards();
    }

    /**
     * 获得板块内所有帖子
     *
     * @param board_id 板块号
     * @param pageNo
     * @param pageSize @return 该板块内所有帖子
     */
    @Override
    public PageInfo<Post> getPostsByBoard(Integer board_id, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Post> posts = bbsMapper.getPostsByBoard(board_id);
        PageInfo<Post> postPageInfo = new PageInfo<>(posts);
        return postPageInfo;
    }

    /**
     * 根据帖子获得所有回复
     *
     * @param post_id  帖子号
     * @param pageNo
     * @param pageSize @return 该帖子所有回复
     */
    @Override
    public PageInfo<Reply> getRepliesByPost(Integer post_id, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Reply> replies = bbsMapper.getRepliesByPost(post_id);
        PageInfo<Reply> replyPageInfo = new PageInfo<>(replies);
        return replyPageInfo;
    }

    /**
     * 新增板块
     *
     * @param board 板块
     */
    @Override
    public void insertBoard(Board board) {
        bbsMapper.insertBoard(board.clone());
    }

    /**
     * 新增帖子
     *
     * @param post 帖子
     */
    @Override
    public void insertPost(Post post) {
        bbsMapper.insertPost(post.clone());
    }

    /**
     * 新增回复
     *
     * @param reply 回复
     */
    @Override
    public void insertReply(Reply reply) throws InvalidInfoException {
        Post post = bbsMapper.findPostByPostID(reply.getReply_pid());
        if (post == null) {
            throw new InvalidInfoException("帖子不存在");
        } else {
            post.setPost_updatetime(System.currentTimeMillis());
            post.setPost_commentcount(post.getPost_commentcount() + 1);
            bbsMapper.updatePost(post.clone());
            bbsMapper.insertReply(reply.clone());
        }
    }

//    /**
//     * 更新帖子
//     *
//     * @param post 帖子
//     */
//    @Override
//    public void updatePost(Post post) {
//        bbsMapper.updatePost(post);
//    }

    /**
     * 根据板块ID搜索板块
     *
     * @param board_id 板块ID
     * @return 对应板块
     */
    @Override
    public Board findBoardByBoardID(Integer board_id) {
        return bbsMapper.findBoardByBoardID(board_id);
    }

    /**
     * 根据帖子ID搜索帖子
     *
     * @param post_id 帖子ID
     * @return 对应帖子
     */
    @Override
    public Post findPostByPostID(Integer post_id) {
        return bbsMapper.findPostByPostID(post_id);
    }

    /**
     * 根据用户ID搜索帖子
     *
     * @param user_id  用户ID
     * @param pageNo
     * @param pageSize @return 用户发过的帖子
     */
    @Override
    public PageInfo<Post> findPostsByUserID(String user_id, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Post> posts = bbsMapper.findPostsByUserID(user_id);
        PageInfo<Post> postPageInfo = new PageInfo<>(posts);
        return postPageInfo;
    }

    /**
     * 根据回复ID搜索回复
     *
     * @param reply_id 回复ID
     * @return 对应回复
     */
    @Override
    public Reply findReplyByReplyID(Integer reply_id) {
        return bbsMapper.findReplyByReplyID(reply_id);
    }

    /**
     * 根据用户ID搜索回复
     *
     * @param user_id  用户ID
     * @param pageNo
     * @param pageSize @return 用户发过的回复帖
     */
    @Override
    public PageInfo<Reply> findReplysByUserID(String user_id, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Reply> replies = bbsMapper.findReplysByUserID(user_id);
        PageInfo<Reply> replyPageInfo = new PageInfo<>(replies);
        return replyPageInfo;
    }

    /**
     * 根据回复号获得子回复
     *
     * @param reply_rid 父级回复ID
     * @param pageNo
     * @param pageSize  @return 所有子回复
     */
    @Override
    public PageInfo<Reply> findSubReplyByReplyID(Integer reply_rid, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Reply> replies = bbsMapper.findSubReplyByReplyID(reply_rid);
        PageInfo<Reply> replyPageInfo = new PageInfo<>(replies);
        return replyPageInfo;
    }

    /**
     * 获得最新十条post，不区分板块
     *
     * @return
     */
    @Override
    public List<Post> getLatestTenPosts() {
        return bbsMapper.getLatestTenPosts();
    }
}
