package com.wincom.domain;

import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

public class Conference {
    private int conference_id;
    private String conference_name;
    private int user_id;
    private int room_id;
    private String content;
    private User user = new User();
    private Room room = new Room();
    private int conference_people;
    private String starttime;
    private String endtime;
    private String sendway;
    private String conference_style;
    private String conference_state;

    public String getConference_state() {
        return conference_state;
    }

    public void setConference_state(String conference_state) {
        this.conference_state = conference_state;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getConference_style() {
        return conference_style;
    }

    public void setConference_style(String conference_style) {
        this.conference_style = conference_style;
    }

    public String getSendway() {
        return sendway;
    }

    public void setSendway(String sendway) {
        this.sendway = sendway;
    }


    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public int getConference_id() {
        return conference_id;
    }

    public void setConference_id(int conference_id) {
        this.conference_id = conference_id;
    }

    public String getConference_name() {
        return conference_name;
    }

    public void setConference_name(String conference_name) {
        this.conference_name = conference_name;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public void setConference_people(int conference_people) {
        this.conference_people = conference_people;
    }

    public int getConference_people() {
        return conference_people;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }
}
