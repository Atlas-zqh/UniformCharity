package nju.domain;

/**
 * Created by keenan on 23/05/2017.
 */
public class Clothes {
    public static final String XXXS = "XXXS", XXS = "XXS", XS = "XS", S = "S", M = "M", L = "L", XL = "XL", XXL = "XXL";

    public static String AVAILABLE = "Available", OCCUPIED = "Occupied";

    private String clothesID;

    private String schoolName;

    private String clothessize;

    private String clothesType;

    private String gender;

    private String donorID;

    private String status;

    public Clothes(){

    }

    public Clothes(String clothesID, String schoolName, String clothessize, String clothesType, String donorID, String gender, String status) {
        this.clothesID = clothesID;
        this.schoolName = schoolName;
        this.clothessize = clothessize;
        this.clothesType = clothesType;
        this.donorID = donorID;
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

    public String getClothessize() {
        return clothessize;
    }

    public void setClothessize(String clothessize) {
        this.clothessize = clothessize;
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
