package nju.domain;

/**
 * Created by keenan on 24/05/2017.
 */
public class Order {
    /**
     * 无效订单（撤销等操作导致）；待确认交易；待线下交易；确认交易待支付；确认交易支付成功
     */
    public static final Integer Invalid = -1, ToBeConfirmed = 0, ToBeTraded = 1, Confirmed_NotPaied = 2, Confirmed_Paied = 3;

    /**
     * 仅个人查看；对外公开
     */
    public static final Integer PRIVATE = 0, PUBLIC = 1;

    private String orderID;

    private String clothesID;

    private String donorID;

    private String buyerID;

    private Integer orderStatus;

    private String startTime;

    private String endTime;

    private Integer authority;

    public Order(String orderID, String clothesID, String donorID, String buyerID, Integer orderStatus, String startTime, String endTime, Integer authority) {
        this.orderID = orderID;
        this.clothesID = clothesID;
        this.donorID = donorID;
        this.buyerID = buyerID;
        this.orderStatus = orderStatus;
        this.startTime = startTime;
        this.endTime = endTime;
        this.authority = authority;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getClothesID() {
        return clothesID;
    }

    public void setClothesID(String clothesID) {
        this.clothesID = clothesID;
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

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Integer getAuthority() {
        return authority;
    }

    public void setAuthority(Integer authority) {
        this.authority = authority;
    }
}
