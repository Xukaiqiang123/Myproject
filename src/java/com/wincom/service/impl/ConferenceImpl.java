package com.wincom.service.impl;

import com.wincom.Dao.ConferenceDao;
import com.wincom.domain.Conference;
import com.wincom.domain.Daydate;
import com.wincom.service.ConferenceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("conferenceService")
public class ConferenceImpl implements ConferenceService {
    @Resource
    private ConferenceDao conferenceDao;

    @Override
    public List<Conference> getmyconference(int user_id) {
        return this.conferenceDao.getmyconference(user_id);
    }

    @Override
    public boolean add(Conference conference) {
        return this.conferenceDao.add(conference);
    }
    @Override
    public Conference getConferenceById(int user_id) {
        return this.conferenceDao.getConferenceById(user_id);
    }

    @Override
    public List<Conference> getConferenceByafter() {
        return this.conferenceDao.getConferenceByafter();
    }
    @Override
    public List<Conference> getConferenceBycometime() {
        return this.conferenceDao.getConferenceBycometime();
    }

    @Override
    public List<Conference> getallConference() {
        return this.conferenceDao.getallConference();
    }

    @Override
    public List<Conference> getConferencebyroom(int room_id) {
        return this.conferenceDao.getConferencebyroom(room_id);
    }
    @Override
    public List<Conference> getConferencebyusername(int user_id) {
        return this.conferenceDao.getConferencebyusername(user_id);
    }
    @Override
    public List<Conference> getConferencebyname(String conference_name) {
        return this.conferenceDao.getConferencebyname(conference_name);
    }
    @Override
    public boolean deleteConference(int conference_id) {
        return this.conferenceDao.deleteConference(conference_id);
    }
    @Override
    public boolean updateConference(Conference conference) {
        return this.conferenceDao.updateConference(conference);
    }
}
