package nju.domain;

/**
 * @author keenan on 24/08/2017
 */
public class ClothesHistory {
    private Integer historyID;

    private Long createTime;

    //TODO 要保证重复捐赠的同一件衣物在数据库中对应的是同一个，第2+次捐赠的Clothes的donorID要变吗？
    private String donorID;

    private String buyerID;

    private String story;

    private String clothesID;

    public ClothesHistory(String donorID, String buyerID, String story, String clothesID) {
        this.donorID = donorID;
        this.buyerID = buyerID;
        this.story = story;
        this.clothesID = clothesID;
    }

    public ClothesHistory(Integer historyID, Long createTime, String donorID, String buyerID, String story, String clothesID) {
        this.historyID = historyID;
        this.createTime = createTime;
        this.donorID = donorID;
        this.buyerID = buyerID;
        this.story = story;
        this.clothesID = clothesID;
    }

    public Integer getHistoryID() {
        return historyID;
    }

    public void setHistoryID(Integer historyID) {
        this.historyID = historyID;
    }

    public Long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }

    public String getDonorID() {
        return donorID;
    }

    public void setDonorID(String donorID) {
        this.donorID = donorID;
    }

    public String getBuyerID() {
        return buyerID;
    }

    public void setBuyerID(String buyerID) {
        this.buyerID = buyerID;
    }

    public String getStory() {
        return story;
    }

    public void setStory(String story) {
        this.story = story;
    }

    public String getClothesID() {
        return clothesID;
    }

    public void setClothesID(String clothesID) {
        this.clothesID = clothesID;
    }

    @Override
    public String toString() {
        return "ClothesHistory{" +
                "historyID=" + historyID +
                ", createTime=" + createTime +
                ", donorID='" + donorID + '\'' +
                ", buyerID='" + buyerID + '\'' +
                ", story='" + story + '\'' +
                ", clothesID='" + clothesID + '\'' +
                '}';
    }

    @Override
    public ClothesHistory clone() {
        ClothesHistory o = null;
        try {
            o = (ClothesHistory) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return o;
    }
}
