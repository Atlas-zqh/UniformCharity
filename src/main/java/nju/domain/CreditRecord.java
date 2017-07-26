package nju.domain;

public class CreditRecord {
    public static final Integer BUY_CLOTHES = 0, DONATE_CLOTHES = 1;

    private String userid;

    private Integer recordID;

    private Integer recordtype;

    private String clothesID;

    private Double variance;

    private Double afterCredits;

    private String createTime;

    public CreditRecord(String userid, Integer recordtype, String clothesID, Double variance, Double afterCredits, String createTime) {
        this.userid = userid;
        this.recordtype = recordtype;
        this.clothesID = clothesID;
        this.variance = variance;
        this.afterCredits = afterCredits;
        this.createTime = createTime;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public Integer getRecordID() {
        return recordID;
    }

    public void setRecordID(Integer recordID) {
        this.recordID = recordID;
    }

    public Integer getRecordtype() {
        return recordtype;
    }

    public void setRecordtype(Integer recordtype) {
        this.recordtype = recordtype;
    }

    public String getClothesID() {
        return clothesID;
    }

    public void setClothesID(String clothesID) {
        this.clothesID = clothesID;
    }

    public Double getVariance() {
        return variance;
    }

    public void setVariance(Double variance) {
        this.variance = variance;
    }

    public Double getAfterCredits() {
        return afterCredits;
    }

    public void setAfterCredits(Double afterCredits) {
        this.afterCredits = afterCredits;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
