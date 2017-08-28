package nju.domain;

/**
 * Created by keenan on 16/07/2017.
 */
public class Type implements Cloneable {
    private String schoolName;

    private String clothestype;

    private Double clothesPrice;

    private String default_pic_url;

    public Type(String schoolName, String clothestype, Double clothesPrice) {
        this.schoolName = schoolName;
        this.clothestype = clothestype;
        this.clothesPrice = clothesPrice;
    }

    public Type(String schoolName, String clothestype, Double clothesPrice, String default_pic_url) {
        this.schoolName = schoolName;
        this.clothestype = clothestype;
        this.clothesPrice = clothesPrice;
        this.default_pic_url = default_pic_url;
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

    public String getDefault_pic_url() {
        return default_pic_url;
    }

    public void setDefault_pic_url(String default_pic_url) {
        this.default_pic_url = default_pic_url;
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

    @Override
    public String toString() {
        return "Type{" +
                "schoolName='" + schoolName + '\'' +
                ", clothestype='" + clothestype + '\'' +
                ", clothesPrice=" + clothesPrice +
                ", default_pic_url='" + default_pic_url + '\'' +
                '}';
    }


}
