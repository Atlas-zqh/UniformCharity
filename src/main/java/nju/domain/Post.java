package nju.domain;

/**
 * Created by keenan on 24/05/2017.
 */
public class Post {
    private Integer post_id;

    private String post_userID;

    private String post_topic;

    private Integer post_commnt_count;

    private String post_updateTime;

    private String post_createTime;

    private Boolean post_isLocked;

    private Integer post_boardID;

    public Post(Integer post_id, String post_userID, String post_topic, Integer post_commnt_count, String post_updateTime, String post_createTime, Boolean post_isLocked, Integer post_boardID) {
        this.post_id = post_id;
        this.post_userID = post_userID;
        this.post_topic = post_topic;
        this.post_commnt_count = post_commnt_count;
        this.post_updateTime = post_updateTime;
        this.post_createTime = post_createTime;
        this.post_isLocked = post_isLocked;
        this.post_boardID = post_boardID;
    }

    public Post(String post_userID, String post_topic, String post_createTime, Integer post_boardID) {
        this.post_userID = post_userID;
        this.post_topic = post_topic;
        this.post_updateTime = post_createTime;
        this.post_createTime = post_createTime;
        this.post_boardID = post_boardID;
    }

    public Integer getPost_id() {
        return post_id;
    }

    public void setPost_id(Integer post_id) {
        this.post_id = post_id;
    }

    public String getPost_userID() {
        return post_userID;
    }

    public void setPost_userID(String post_userID) {
        this.post_userID = post_userID;
    }

    public String getPost_topic() {
        return post_topic;
    }

    public void setPost_topic(String post_topic) {
        this.post_topic = post_topic;
    }

    public Integer getPost_commnt_count() {
        return post_commnt_count;
    }

    public void setPost_commnt_count(Integer post_commnt_count) {
        this.post_commnt_count = post_commnt_count;
    }

    public String getPost_updateTime() {
        return post_updateTime;
    }

    public void setPost_updateTime(String post_updateTime) {
        this.post_updateTime = post_updateTime;
    }

    public String getPost_createTime() {
        return post_createTime;
    }

    public void setPost_createTime(String post_createTime) {
        this.post_createTime = post_createTime;
    }

    public Boolean getPost_isLocked() {
        return post_isLocked;
    }

    public void setPost_isLocked(Boolean post_isLocked) {
        this.post_isLocked = post_isLocked;
    }

    public Integer getPost_boardID() {
        return post_boardID;
    }

    public void setPost_boardID(Integer post_boardID) {
        this.post_boardID = post_boardID;
    }
}
