package nju.mapper;

import nju.domain.Board;
import nju.domain.Post;
import nju.domain.Reply;

import java.util.List;

/**
 * Created by keenan on 25/05/2017.
 */
public interface BBSMapper {
    /**
     * 获得所有板块
     *
     * @return 所有板块
     */
    List<Board> getAllBoards();

    /**
     * 获得板块内所有帖子
     *
     * @param board_id 板块号
     * @return 该板块内所有帖子
     */
    List<Post> getPostsByBoard(Integer board_id);

    /**
     * 根据帖子获得所有回复
     *
     * @param post_id 帖子号
     * @return 该帖子所有回复
     */
    List<Reply> getRepliesByPost(Integer post_id);

    /**
     * 新增板块
     *
     * @param board 板块
     */
    void insertBoard(Board board);

    /**
     * 新增帖子
     *
     * @param post 帖子
     */
    void insertPost(Post post);

    /**
     * 新增回复
     *
     * @param reply 回复
     */
    void insertReply(Reply reply);

    /**
     * 更新帖子
     *
     * @param post 帖子
     */
    void updatePost(Post post);

    /**
     * 根据板块ID搜索板块
     *
     * @param board_id 板块ID
     * @return 对应板块
     */
    Board findBoardByBoardID(Integer board_id);

    /**
     * 根据帖子ID搜索帖子
     *
     * @param post_id 帖子ID
     * @return 对应帖子
     */
    Post findPostByPostID(Integer post_id);

    /**
     * 根据用户ID搜索帖子
     *
     * @param user_id 用户ID
     * @return 用户发过的帖子
     */
    List<Post> findPostsByUserID(String user_id);

    /**
     * 根据回复ID搜索回复
     *
     * @param reply_id 回复ID
     * @return 对应回复
     */
    Reply findReplyByReplyID(Integer reply_id);

    /**
     * 根据用户ID搜索回复
     *
     * @param user_id 用户ID
     * @return 用户发过的回复帖
     */
    List<Reply> findReplysByUserID(String user_id);

    /**
     * 根据回复号获得子回复
     *
     * @param reply_rid 父级回复ID
     * @return 所有子回复
     */
    List<Reply> findSubReplyByReplyID(Integer reply_rid);

    /**
     * 获得最新十条post，不区分板块
     *
     * @return
     */
    List<Post> getLatestTenPosts();

}
