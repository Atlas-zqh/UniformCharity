package nju.domain;

/**
 * 公益记录
 */
public class CreditRecord {
    public static final Integer BUY_CLOTHES = 0, DONATE_CLOTHES = 1, REVOKE_CANCEL_ORDER = 2;

    private String userid;

    private Integer recordID;

    private Integer recordtype;

    private String clothesID;

    private Double variance;

    private Double afterCredits;

    private Long createTime;

    public CreditRecord(String userid, Integer recordtype, String clothesID, Double variance, Double afterCredits, Long createTime) {
        this.userid = userid;
        this.recordtype = recordtype;
        this.clothesID = clothesID;
        this.variance = variance;
        this.afterCredits = afterCredits;
        this.createTime = createTime;
    }

    public CreditRecord(String userid, Integer recordID, Integer recordtype, String clothesID, Double variance, Double afterCredits, Long createTime) {
        this.userid = userid;
        this.recordID = recordID;
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

    public Long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }

    @Override
    public CreditRecord clone() {
        CreditRecord o = null;
        try {
            o = (CreditRecord) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return o;
    }
}
