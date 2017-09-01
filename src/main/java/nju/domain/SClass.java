package nju.domain;

/**
 * 班级
 */

public class SClass implements Cloneable {
    private String schoolName;

    private String sgrade;

    private String sclass;

    private Integer auto_id;

    public SClass(String schoolName, String sgrade, String sclass, Integer auto_id) {
        this.schoolName = schoolName;
        this.sgrade = sgrade;
        this.sclass = sclass;
        this.auto_id = auto_id;
    }

    public SClass(String schoolName, String sgrade, String sclass) {
        this.schoolName = schoolName;
        this.sgrade = sgrade;
        this.sclass = sclass;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
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

    @Override
    public String toString() {
        return "SClass{" +
                "schoolName='" + schoolName + '\'' +
                ", sgrade='" + sgrade + '\'' +
                ", sclass='" + sclass + '\'' +
                ", auto_id=" + auto_id +
                '}';
    }
}
