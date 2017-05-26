package nju.domain;

/**
 * Created by keenan on 22/05/2017.
 */
public class School {
    private String schoolName;

    private String city;

    private String district;

    private Boolean used = true;

    public School(String schoolName, String city, String district, Boolean used) {
        this.schoolName = schoolName;
        this.city = city;
        this.district = district;
        this.used = used;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
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
                ", city='" + city + '\'' +
                ", district='" + district + '\'' +
                '}';
    }
}
