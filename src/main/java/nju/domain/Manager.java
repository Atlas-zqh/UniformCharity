package nju.domain;

/**
 * @author keenan on 23/08/2017
 */
public class Manager implements Cloneable {
    private Integer managerID;

    private String username;

    private String password;

    private String schoolName;

    public Manager(String username, String password, String schoolName) {
        this.username = username;
        this.password = password;
        this.schoolName = schoolName;
    }

    public Manager(Integer managerID, String username, String password, String schoolName) {
        this.managerID = managerID;
        this.username = username;
        this.password = password;
        this.schoolName = schoolName;
    }

    public Integer getManagerID() {
        return managerID;
    }

    public void setManagerID(Integer managerID) {
        this.managerID = managerID;
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

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    @Override
    public Manager clone() {
        Manager o = null;
        try {
            o = (Manager) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return o;
    }

    @Override
    public String toString() {
        return "Manager{" +
                "managerID=" + managerID +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", schoolName='" + schoolName + '\'' +
                '}';
    }
}
