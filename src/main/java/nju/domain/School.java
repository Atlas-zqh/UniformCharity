package nju.domain;

/**
 * Created by keenan on 22/05/2017.
 */
public class School implements Cloneable {
    private String schoolName;

    private String schoolCity;

    private String schoolDistrict;

    private Boolean used = true;

    public School(String schoolName, String schoolCity, String schoolDistrict, Boolean used) {
        this.schoolName = schoolName;
        this.schoolCity = schoolCity;
        this.schoolDistrict = schoolDistrict;
        this.used = used;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getSchoolCity() {
        return schoolCity;
    }

    public void setSchoolCity(String schoolCity) {
        this.schoolCity = schoolCity;
    }

    public String getSchoolDistrict() {
        return schoolDistrict;
    }

    public void setSchoolDistrict(String schoolDistrict) {
        this.schoolDistrict = schoolDistrict;
    }

    public Boolean getUsed() {
        return used;
    }

    public void setUsed(Boolean used) {
        this.used = used;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        School school = (School) o;

        return schoolName.equals(school.schoolName);
    }

    @Override
    public int hashCode() {
        return schoolName.hashCode();
    }

    @Override
    public String toString() {
        return "School{" +
                "schoolName='" + schoolName + '\'' +
                ", schoolCity='" + schoolCity + '\'' +
                ", schoolDistrict='" + schoolDistrict + '\'' +
                '}';
    }

    @Override
    public School clone() {
        School o = null;
        try {
            o = (School) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return o;
    }
}
