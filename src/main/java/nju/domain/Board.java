package nju.domain;

/**
 * Created by keenan on 24/05/2017.
 */
public class Board implements Cloneable {
    private Integer board_id;

    private String board_name;

    public Board(Integer board_id, String board_name) {
        this.board_id = board_id;
        this.board_name = board_name;
    }

    public Board(String board_name) {
        this.board_name = board_name;
    }

    public Integer getBoard_id() {
        return board_id;
    }

    public void setBoard_id(Integer board_id) {
        this.board_id = board_id;
    }

    public String getBoard_name() {
        return board_name;
    }

    public void setBoard_name(String board_name) {
        this.board_name = board_name;
    }

    @Override
    public Board clone() {
        Board o = null;
        try {
            o = (Board) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return o;
    }
}
