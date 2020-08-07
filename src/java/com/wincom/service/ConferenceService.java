package com.wincom.service;

import com.wincom.domain.Conference;
import com.wincom.domain.Daydate;

import java.util.List;

public interface ConferenceService {
    public List<Conference> getmyconference(int user_id);
    public boolean add(Conference conference);
    public Conference getConferenceById(int user_id);

    public List<Conference> getConferenceByafter();

    public List<Conference> getConferenceBycometime();

    public List<Conference> getallConference();

    public List<Conference> getConferencebyroom(int room_id);
    public List<Conference> getConferencebyusername(int user_id);
    public List<Conference> getConferencebyname(String conference_name);

    public boolean updateConference(Conference conference);
    public boolean deleteConference(int conference_id);
}