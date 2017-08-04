package nju.domain;

public class FinancialRecord {
    public static final Integer IN = 0, OUT = 1;

    private String user_id;

    private Integer recordID;

    /**
     * 记录类型
     */
    private Integer recordtype;

    /**
     * 金额
     */
    private Double amount;

    /**
     * 时间
     */
    private Long createTime;

    public FinancialRecord(String user_id, Integer recordtype, Double amount, Long createTime) {
        this.user_id = user_id;
        this.recordtype = recordtype;
        this.amount = amount;
        this.createTime = createTime;
    }

    public Integer getRecordtype() {
        return recordtype;
    }

    public void setRecordtype(Integer recordtype) {
        this.recordtype = recordtype;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Integer getRecordID() {
        return recordID;
    }

    public void setRecordID(Integer recordID) {
        this.recordID = recordID;
    }

    @Override
    public String toString() {
        return "FinancialRecord{" +
                "user_id='" + user_id + '\'' +
                ", recordID=" + recordID +
                ", recordtype=" + recordtype +
                ", amount=" + amount +
                ", createTime=" + createTime +
                '}';
    }
}
