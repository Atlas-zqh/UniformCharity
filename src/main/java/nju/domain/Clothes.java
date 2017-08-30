package nju.domain;

/**
 * Created by keenan on 23/05/2017.
 */
public class Clothes implements Cloneable {
    public static String AVAILABLE = "Available", OCCUPIED = "Occupied";
    private Integer auto_id;

    private String clothesID;

    private String schoolName;

    /**
     * 身高
     */
    private Double clothesHeight;

    /**
     * 体重
     */
    private Double clothesWeight;

    private String clothesType;

    private String donorID;

    private String gender;

    private String status;

    /**
     * 第n手衣物
     */
    private Integer times;

    public Clothes(){

    }

    public Clothes(String clothesID, String schoolName, Double clothesHeight, Double clothesWeight, String clothesType, String donorID, String gender, String status, Integer times) {
        this.clothesID = clothesID;
        this.schoolName = schoolName;
        this.clothesHeight = clothesHeight;
        this.clothesWeight = clothesWeight;
        this.clothesType = clothesType;
        this.donorID = donorID;
        this.gender = gender;
        this.status = status;
        this.times = times;
    }

    public Clothes(Integer auto_id, String clothesID, String schoolName, Double clothesHeight, Double clothesWeight, String clothesType, String donorID, String gender, String status, Integer times) {
        this.auto_id = auto_id;
        this.clothesID = clothesID;
        this.schoolName = schoolName;
        this.clothesHeight = clothesHeight;
        this.clothesWeight = clothesWeight;
        this.clothesType = clothesType;
        this.donorID = donorID;
        this.gender = gender;
        this.status = status;
        this.times = times;
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

    public Double getClothesHeight() {
        return clothesHeight;
    }

    public void setClothesHeight(Double clothesHeight) {
        this.clothesHeight = clothesHeight;
    }

    public Double getClothesWeight() {
        return clothesWeight;
    }

    public void setClothesWeight(Double clothesWeight) {
        this.clothesWeight = clothesWeight;
    }

    public String getClothesType() {
        return clothesType;
    }

    public void setClothesType(String clothesType) {
        this.clothesType = clothesType;
    }

    public String getDonorID() {
        return donorID;
    }

    public void setDonorID(String donorID) {
        this.donorID = donorID;
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

    public Integer getTimes() {
        return times;
    }

    public void setTimes(Integer times) {
        this.times = times;
    }

    public Integer getAuto_id() {
        return auto_id;
    }

    public void setAuto_id(Integer auto_id) {
        this.auto_id = auto_id;
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

    @Override
    public String toString() {
        return "Clothes{" +
                "auto_id=" + auto_id +
                ", clothesID='" + clothesID + '\'' +
                ", schoolName='" + schoolName + '\'' +
                ", clothesHeight=" + clothesHeight +
                ", clothesWeight=" + clothesWeight +
                ", clothesType='" + clothesType + '\'' +
                ", donorID='" + donorID + '\'' +
                ", gender='" + gender + '\'' +
                ", status='" + status + '\'' +
                ", times=" + times +
                '}';
    }

    @Override
    public Clothes clone() {
        Clothes clothes = null;
        try {
            clothes = (Clothes) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return clothes;
    }

}
