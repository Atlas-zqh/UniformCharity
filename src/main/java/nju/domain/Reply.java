package nju.domain;

/**
 * Created by keenan on 24/05/2017.
 */
public class Reply {
    private Integer reply_id;

    /**
     * user id
     */
    private String reply_uid;

    private String reply_content;

    /**
     * post id
     */
    private Integer reply_pid;

    private Long reply_time;
    /**
     * 当前回复所处层数（0表示主题帖）
     */
    private Integer reply_layer;
    /**
     * reply id
     * 所处层数为2时使用，表示回复层数为1的帖子号
     */
    private Integer reply_rid;

    public Reply(Integer reply_id, String reply_uid, String reply_content, Integer reply_pid, Long reply_time, Integer reply_layer, Integer reply_rid) {
        this.reply_id = reply_id;
        this.reply_uid = reply_uid;
        this.reply_content = reply_content;
        this.reply_pid = reply_pid;
        this.reply_time = reply_time;
        this.reply_layer = reply_layer;
        this.reply_rid = reply_rid;
    }

    public Reply(String reply_uid, String reply_content, Integer reply_pid, Long reply_time, Integer reply_layer, Integer reply_rid) {
        this.reply_uid = reply_uid;
        this.reply_content = reply_content;
        this.reply_pid = reply_pid;
        this.reply_time = reply_time;
        this.reply_layer = reply_layer;
        this.reply_rid = reply_rid;
    }

    public Integer getReply_id() {
        return reply_id;
    }

    public void setReply_id(Integer reply_id) {
        this.reply_id = reply_id;
    }

    public String getReply_uid() {
        return reply_uid;
    }

    public void setReply_uid(String reply_uid) {
        this.reply_uid = reply_uid;
    }

    public String getReply_content() {
        return reply_content;
    }

    public void setReply_content(String reply_content) {
        this.reply_content = reply_content;
    }

    public Integer getReply_pid() {
        return reply_pid;
    }

    public void setReply_pid(Integer reply_pid) {
        this.reply_pid = reply_pid;
    }

    public Long getReply_time() {
        return reply_time;
    }

    public void setReply_time(Long reply_time) {
        this.reply_time = reply_time;
    }

    public Integer getReply_layer() {
        return reply_layer;
    }

    public void setReply_layer(Integer reply_layer) {
        this.reply_layer = reply_layer;
    }

    public Integer getReply_rid() {
        return reply_rid;
    }

    public void setReply_rid(Integer reply_rid) {
        this.reply_rid = reply_rid;
    }

    @Override
    public Reply clone() {
        Reply o = null;
        try {
            o = (Reply) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return o;
    }
}
