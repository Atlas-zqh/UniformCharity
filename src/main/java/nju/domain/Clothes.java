package nju.domain;

import java.util.HashMap;

/**
 * Created by keenan on 23/05/2017.
 */
public class Clothes {
    public static final String XXXS = "XXXS", XXS = "XXS", XS = "XS", S = "S", M = "M", L = "L", XL = "XL", XXL = "XXL";

    public static String AVAILABLE = "Available", OCCUPIED = "Occupied";

    private String clothesID;

    private String schoolName;

    private String size;

    private String type;

    private String picUrl;

    private Double price;

    private String gender;

    private String donor;

    private String status;

    public Clothes(String clothesID, String schoolName, String size, String type, String picUrl, Double price, String donor, String gender, String status) {
        this.clothesID = clothesID;
        this.schoolName = schoolName;
        this.size = size;
        this.type = type;
        this.picUrl = picUrl;
        this.price = price;
        this.donor = donor;
        this.gender = gender;
        this.status = status;
    }

    public String getClothesID() {
        return clothesID;
    }

    public void setClothesID(String clothesID) {
        this.clothesID = clothesID;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getDonor() {
        return donor;
    }

    public void setDonor(String donor) {
        this.donor = donor;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Clothes)) return false;

        Clothes clothes = (Clothes) o;

        return clothesID.equals(clothes.clothesID);
    }

    @Override
    public int hashCode() {
        return clothesID.hashCode();
    }
}
