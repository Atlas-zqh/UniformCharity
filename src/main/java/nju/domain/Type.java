package nju.domain;

/**
 * Created by keenan on 16/07/2017.
 */
public class Type {
    private String schoolName;

    private String clothestype;

    private Double clothesPrice;

    public Type(String schoolName, String clothestype, Double clothesPrice) {
        this.schoolName = schoolName;
        this.clothestype = clothestype;
        this.clothesPrice = clothesPrice;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getClothestype() {
        return clothestype;
    }

    public void setClothestype(String clothestype) {
        this.clothestype = clothestype;
    }

    public Double getClothesPrice() {
        return clothesPrice;
    }

    public void setClothesPrice(Double clothesPrice) {
        this.clothesPrice = clothesPrice;
    }

    @Override
    public Type clone() {
        Type o = null;
        try {
            o = (Type) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return o;
    }
}
