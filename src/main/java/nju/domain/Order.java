package nju.domain;

import java.util.Date;

/**
 * Created by keenan on 24/05/2017.
 */
public class Order {
    /**
     * 无效订单（撤销等操作导致）；待确认交易；待线下交易；确认交易待支付；确认交易支付成功
     */
    public static final Integer Invalid = -1, ToBeConfirmed = 0, ToBeTraded = 1, Confirmed_Unpaied = 2, Confirmed_Paied = 3;

    /**
     * 仅个人查看；对外公开
     */
    public static final Integer PRIVATE = 0, PUBLIC = 1;

    private String orderID;

    private String clothesID;

    private String donorID;

    private String buyerID;

    private Integer orderStatus;

    private Long startTime;

    private Long endTime;

    public Order() {
    }

    /**
     * 权限
     */
    private Integer authority;

    public Order(String orderID, String clothesID, String donorID, String buyerID, Integer orderStatus, Long startTime, Long endTime, Integer authority) {
        this.orderID = orderID;
        this.clothesID = clothesID;
        this.donorID = donorID;
        this.buyerID = buyerID;
        this.orderStatus = orderStatus;
        this.startTime = startTime;
        this.endTime = endTime;
        this.authority = authority;
    }

    /**
     * 订单号和创建时间将自动生成
     *
     * @param clothesID
     * @param donorID
     * @param buyerID
     */
    public Order(String clothesID, String donorID, String buyerID, Integer orderStatus, Integer authority) {
        this.clothesID = clothesID;
        this.donorID = donorID;
        this.buyerID = buyerID;
        this.orderStatus = orderStatus;
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

    public Long getStartTime() {
        return startTime;
    }

    public void setStartTime(Long startTime) {
        this.startTime = startTime;
    }

    public Long getEndTime() {
        return endTime;
    }

    public void setEndTime(Long endTime) {
        this.endTime = endTime;
    }

    public Integer getAuthority() {
        return authority;
    }

    public void setAuthority(Integer authority) {
        this.authority = authority;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderID='" + orderID + '\'' +
                ", clothesID='" + clothesID + '\'' +
                ", donorID='" + donorID + '\'' +
                ", buyerID='" + buyerID + '\'' +
                ", orderStatus=" + orderStatus +
                ", startTime=" + new Date(startTime) +
                ", endTime=" + endTime +
                ", authority=" + authority +
                '}';
    }

    @Override
    public Order clone() {
        Order o = null;
        try {
            o = (Order) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return o;
    }
}
