package nju.domain;

/**
 * Created by keenan on 24/05/2017.
 */
public class Post implements Cloneable {
    private Integer post_id;

    /**
     * user id
     */
    private String post_uid;

    private String post_topic;

    private Integer post_commentcount;

    private Long post_updatetime;

    private Long post_createtime;

    private Boolean post_islocked;

    private String post_content;

    /**
     * board id
     */
    private Integer post_bid;

    public Post(Integer post_id, String post_uid, String post_topic, Integer post_commentcount, Long post_updatetime, Long post_createtime, Boolean post_islocked, Integer post_bid, String post_content) {
        this.post_id = post_id;
        this.post_uid = post_uid;
        this.post_topic = post_topic;
        this.post_commentcount = post_commentcount;
        this.post_updatetime = post_updatetime;
        this.post_createtime = post_createtime;
        this.post_islocked = post_islocked;
        this.post_bid = post_bid;
        this.post_content = post_content;
    }

    public Post(String post_uid, String post_topic, Long post_createtime, Integer post_bid) {
        this.post_uid = post_uid;
        this.post_topic = post_topic;
        this.post_updatetime = post_createtime;
        this.post_createtime = post_createtime;
        this.post_bid = post_bid;
    }

    public Integer getPost_id() {
        return post_id;
    }

    public void setPost_id(Integer post_id) {
        this.post_id = post_id;
    }

    public String getPost_uid() {
        return post_uid;
    }

    public void setPost_uid(String post_uid) {
        this.post_uid = post_uid;
    }

    public String getPost_topic() {
        return post_topic;
    }

    public void setPost_topic(String post_topic) {
        this.post_topic = post_topic;
    }

    public Integer getPost_commentcount() {
        return post_commentcount;
    }

    public void setPost_commentcount(Integer post_commentcount) {
        this.post_commentcount = post_commentcount;
    }

    public Long getPost_updatetime() {
        return post_updatetime;
    }

    public void setPost_updatetime(Long post_updatetime) {
        this.post_updatetime = post_updatetime;
    }

    public Long getPost_createtime() {
        return post_createtime;
    }

    public void setPost_createtime(Long post_createtime) {
        this.post_createtime = post_createtime;
    }

    public Boolean getPost_islocked() {
        return post_islocked;
    }

    public void setPost_islocked(Boolean post_islocked) {
        this.post_islocked = post_islocked;
    }

    public Integer getPost_bid() {
        return post_bid;
    }

    public void setPost_bid(Integer post_bid) {
        this.post_bid = post_bid;
    }

    public String getPost_content() {
        return post_content;
    }

    public void setPost_content(String post_content) {
        this.post_content = post_content;
    }

    @Override
    public Post clone() {
        Post o = null;
        try {
            o = (Post) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return o;
    }

    @Override
    public String toString() {
        return "Post{" +
                "post_id=" + post_id +
                ", post_uid='" + post_uid + '\'' +
                ", post_topic='" + post_topic + '\'' +
                ", post_commentcount=" + post_commentcount +
                ", post_updatetime=" + post_updatetime +
                ", post_createtime=" + post_createtime +
                ", post_islocked=" + post_islocked +
                ", post_content='" + post_content + '\'' +
                ", post_bid=" + post_bid +
                '}';
    }
}
