package nju.domain;

/**
 * Created by keenan on 23/05/2017.
 */
public class Clothes {
    public static String AVAILABLE = "Available", OCCUPIED = "Occupied";

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

    private String gender;

    private String donorID;

    private String status;

    /**
     * 默认图片
     */
    private String default_pic_url;

    public Clothes(){

    }

    public Clothes(String clothesID, String schoolName, Double clothesHeight, Double clothesWeight, String clothesType, String donorID, String gender, String status) {
        this.clothesID = clothesID;
        this.schoolName = schoolName;
        this.clothesHeight = clothesHeight;
        this.clothesWeight = clothesWeight;
        this.clothesType = clothesType;
        this.donorID = donorID;
        this.gender = gender;
        this.status = status;
    }

    public Clothes(String clothesID, String schoolName, Double clothesHeight, Double clothesWeight, String clothesType, String gender, String donorID, String status, String default_pic_url) {
        this.clothesID = clothesID;
        this.schoolName = schoolName;
        this.clothesHeight = clothesHeight;
        this.clothesWeight = clothesWeight;
        this.clothesType = clothesType;
        this.gender = gender;
        this.donorID = donorID;
        this.status = status;
        this.default_pic_url = default_pic_url;
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

    public String getDefault_pic_url() {
        return default_pic_url;
    }

    public void setDefault_pic_url(String default_pic_url) {
        this.default_pic_url = default_pic_url;
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
                "clothesID='" + clothesID + '\'' +
                ", schoolName='" + schoolName + '\'' +
                ", clothesHeight=" + clothesHeight +
                ", clothesWeight=" + clothesWeight +
                ", clothesType='" + clothesType + '\'' +
                ", gender='" + gender + '\'' +
                ", donorID='" + donorID + '\'' +
                ", status='" + status + '\'' +
                ", default_pic_url='" + default_pic_url + '\'' +
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
