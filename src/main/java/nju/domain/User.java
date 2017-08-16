package nju.domain;

import java.io.Serializable;

/**
 * Created by keenan on 04/05/2017.
 */
public class User implements Serializable {
    private String username;

    private String password;

    private String wechatID;

    private String phone;

    private String realName;

    private String gender;

    private String personID;

    private Double credits;

    private String email;

    private String picurl;

    private String school;

    // 年级
    private String sgrade;

    // 班级
    private String sclass;

    private Boolean used = true;

    public User() {
    }

    public User(String username, String password, String wechatID, String phone, String realName, String gender, String personID, Double credits, String email, String picurl, Boolean used, String school, String sgrade, String sclass) {
        this.username = username;
        this.password = password;
        this.wechatID = wechatID;
        this.phone = phone;
        this.realName = realName;
        this.gender = gender;
        this.personID = personID;
        this.credits = credits;
        this.email = email;
        this.picurl = picurl;
        this.used = used;
        this.school = school;
        this.sgrade = sgrade;
        this.sclass = sclass;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getWechatID() {
        return wechatID;
    }

    public void setWechatID(String wechatID) {
        this.wechatID = wechatID;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPersonID() {
        return personID;
    }

    public void setPersonID(String personID) {
        this.personID = personID;
    }

    public Double getCredits() {
        return credits;
    }

    public void setCredits(Double credits) {
        this.credits = credits;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPicurl() {
        return picurl;
    }

    public void setPicurl(String picurl) {
        this.picurl = picurl;
    }

    public Boolean getUsed() {
        return used;
    }

    public void setUsed(Boolean used) {
        this.used = used;
    }

    public String getSgrade() {
        return sgrade;
    }

    public void setSgrade(String sgrade) {
        this.sgrade = sgrade;
    }

    public String getSclass() {
        return sclass;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (!password.equals(user.password)) return false;
        if (!realName.equals(user.realName)) return false;
        return personID.equals(user.personID);
    }

    @Override
    public int hashCode() {
        int result = password.hashCode();
        result = 31 * result + realName.hashCode();
        result = 31 * result + personID.hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", wechatID='" + wechatID + '\'' +
                ", phone='" + phone + '\'' +
                ", realName='" + realName + '\'' +
                ", gender='" + gender + '\'' +
                ", personID='" + personID + '\'' +
                ", credits=" + credits +
                ", email='" + email + '\'' +
                ", picurl='" + picurl + '\'' +
                ", school='" + school + '\'' +
                ", sgrade='" + sgrade + '\'' +
                ", sclass='" + sclass + '\'' +
                ", used=" + used +
                '}';
    }
}
