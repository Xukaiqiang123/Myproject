package com.wincom.domain;

public class Daydate {
    private int count;
    private String mouth;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getMouth() {
        return mouth;
    }

    public void setMouth(String mouth) {
        this.mouth = mouth;
    }

    @Override

    public String toString() {
        return "daydate [mouth=" + mouth + ", count=" + count + "]";
    }
}
