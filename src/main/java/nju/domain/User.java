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

    private String studentRealName;

    private String gender;

    private String personID;

    private Integer credits;

    private String email;

    private String picurl;

    private Boolean used = true;

    public User() {
    }

    public User(String username, String password, String wechatID, String phone, String studentRealName, String gender, String personID, Integer credits, String email, String picurl, Boolean used) {
        this.username = username;
        this.password = password;
        this.wechatID = wechatID;
        this.phone = phone;
        this.studentRealName = studentRealName;
        this.gender = gender;
        this.personID = personID;
        this.credits = credits;
        this.email = email;
        this.picurl = picurl;
        this.used = used;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStudentRealName() {
        return studentRealName;
    }

    public void setStudentRealName(String studentRealName) {
        this.studentRealName = studentRealName;
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

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
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

    public String getWechatID() {
        return wechatID;
    }

    public void setWechatID(String wechatID) {
        this.wechatID = wechatID;
    }

    public boolean isUsed() {
        return used;
    }

    public void setUsed(boolean used) {
        this.used = used;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (!password.equals(user.password)) return false;
        if (!studentRealName.equals(user.studentRealName)) return false;
        return personID.equals(user.personID);
    }

    @Override
    public int hashCode() {
        int result = password.hashCode();
        result = 31 * result + studentRealName.hashCode();
        result = 31 * result + personID.hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", studentRealName='" + studentRealName + '\'' +
                ", personID='" + personID + '\'' +
                '}';
    }
}
