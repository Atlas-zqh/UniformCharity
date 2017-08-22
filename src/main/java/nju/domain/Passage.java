package nju.domain;

/**
 * @author keenan on 22/08/2017
 */

public class Passage {
    private Integer passage_id;
    /**
     * varchar(100)
     */
    private String ptitle;
    /**
     * varchar(20000)
     */
    private String pcontent;
    private Long ptime;

    public Passage(Integer passage_id, String ptitle, String pcontent, Long ptime) {
        this.passage_id = passage_id;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.ptime = ptime;
    }

    public Passage(String ptitle, String pcontent) {
        this.ptitle = ptitle;
        this.pcontent = pcontent;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public Long getPtime() {
        return ptime;
    }

    public void setPtime(Long ptime) {
        this.ptime = ptime;
    }

    public Integer getPassage_id() {
        return passage_id;
    }

    public void setPassage_id(Integer passage_id) {
        this.passage_id = passage_id;
    }

    @Override
    protected Passage clone() throws CloneNotSupportedException {
        Passage o = null;
        try {
            o = (Passage) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return o;
    }

    @Override
    public String toString() {
        return "Passage{" +
                "passage_id=" + passage_id +
                ", ptitle='" + ptitle + '\'' +
                ", pcontent='" + pcontent + '\'' +
                ", ptime=" + ptime +
                '}';
    }
}
