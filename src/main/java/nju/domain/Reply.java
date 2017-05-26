package nju.domain;

/**
 * Created by keenan on 24/05/2017.
 */
public class Reply {
    private Integer reply_id;

    private String reply_userID;

    private String reply_content;

    private Integer reply_postID;

    private String reply_time;
    // 当前回复所处层数（0表示主题帖）
    private Integer reply_layer;
    // 所处层数为2时使用，表示回复层数为1的帖子号
    private Integer reply_replyID;

    public Reply(Integer reply_id, String reply_userID, String reply_content, Integer reply_postID, String reply_time, Integer reply_layer, Integer reply_replyID) {
        this.reply_id = reply_id;
        this.reply_userID = reply_userID;
        this.reply_content = reply_content;
        this.reply_postID = reply_postID;
        this.reply_time = reply_time;
        this.reply_layer = reply_layer;
        this.reply_replyID = reply_replyID;
    }

    public Reply(String reply_userID, String reply_content, Integer reply_postID, String reply_time, Integer reply_layer, Integer reply_replyID) {
        this.reply_userID = reply_userID;
        this.reply_content = reply_content;
        this.reply_postID = reply_postID;
        this.reply_time = reply_time;
        this.reply_layer = reply_layer;
        this.reply_replyID = reply_replyID;
    }

    public Integer getReply_id() {
        return reply_id;
    }

    public void setReply_id(Integer reply_id) {
        this.reply_id = reply_id;
    }

    public String getReply_userID() {
        return reply_userID;
    }

    public void setReply_userID(String reply_userID) {
        this.reply_userID = reply_userID;
    }

    public String getReply_content() {
        return reply_content;
    }

    public void setReply_content(String reply_content) {
        this.reply_content = reply_content;
    }

    public Integer getReply_postID() {
        return reply_postID;
    }

    public void setReply_postID(Integer reply_postID) {
        this.reply_postID = reply_postID;
    }

    public String getReply_time() {
        return reply_time;
    }

    public void setReply_time(String reply_time) {
        this.reply_time = reply_time;
    }

    public Integer getReply_layer() {
        return reply_layer;
    }

    public void setReply_layer(Integer reply_layer) {
        this.reply_layer = reply_layer;
    }

    public Integer getReply_replyID() {
        return reply_replyID;
    }

    public void setReply_replyID(Integer reply_replyID) {
        this.reply_replyID = reply_replyID;
    }
}
