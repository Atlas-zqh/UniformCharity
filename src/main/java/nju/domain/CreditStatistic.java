package nju.domain;

public class CreditStatistic implements Cloneable {
    private String school;

    private String sgrade;

    private String sclass;

    private Double credits;

    public CreditStatistic(String school, String sgrade, String sclass, Double credits) {
        this.school = school;
        this.sgrade = sgrade;
        this.sclass = sclass;
        this.credits = credits;
    }

    public CreditStatistic(String school, String sgrade, Double credits) {
        this.school = school;
        this.sgrade = sgrade;
        this.credits = credits;
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

    public Double getCredits() {
        return credits;
    }

    public void setCredits(Double credits) {
        this.credits = credits;
    }

    @Override
    public String toString() {
        return "CreditStatistic{" +
                "school='" + school + '\'' +
                ", sgrade='" + sgrade + '\'' +
                ", sclass='" + sclass + '\'' +
                ", credits=" + credits +
                '}';
    }
}
