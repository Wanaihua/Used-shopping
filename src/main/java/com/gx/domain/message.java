package com.gx.domain;

public class message {
    private int id;
    private String conten;
    private String time;
    private String FromId;
    private String ToId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getConten() {
        return conten;
    }

    public void setConten(String conten) {
        this.conten = conten;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getFromId() {
        return FromId;
    }

    public void setFromId(String fromId) {
        FromId = fromId;
    }

    public String getToId() {
        return ToId;
    }

    public void setToId(String toId) {
        ToId = toId;
    }
}
