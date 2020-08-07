package com.wincom.Dao;
import com.wincom.domain.Conference;
import com.wincom.domain.Daydate;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import javax.annotation.Resource;

import java.util.List;

@Repository("conferenceDao")
public class ConferenceDao {
    @Resource(name = "sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
    public List<Conference> getmyconference(int user_id) {
        return sqlSessionTemplate.selectList("com.wincom.mapper.ConferenceMapper.getmyconference",user_id);
    }

    public boolean add(Conference conference){
        sqlSessionTemplate.insert("com.wincom.mapper.ConferenceMapper.save",conference);
        return true;
    }

    public Conference getConferenceById(int user_id){
        return (Conference) sqlSessionTemplate.selectOne("com.wincom.mapper.ConferenceMapper.getConferenceById",user_id);
    }

    public List<Conference> getConferenceByafter(){
        return sqlSessionTemplate.selectList("com.wincom.mapper.ConferenceMapper.getconferenceByafter");
    }

    public List<Conference> getConferenceBycometime(){
        return sqlSessionTemplate.selectList("com.wincom.mapper.ConferenceMapper.getconferenceBycometime");
    }

    public List<Conference> getallConference(){
        return sqlSessionTemplate.selectList("com.wincom.mapper.ConferenceMapper.getconferenceall");
    }
    public List<Conference> getConferencebyroom(int room_id){
        return sqlSessionTemplate.selectList("com.wincom.mapper.ConferenceMapper.getconferencebyroom",room_id);
    }
    public List<Conference> getConferencebyusername(int user_id){
        return sqlSessionTemplate.selectList("com.wincom.mapper.ConferenceMapper.getconferencebyusername",user_id);
    }
    public List<Conference> getConferencebyname(String conference_name){
        return sqlSessionTemplate.selectList("com.wincom.mapper.ConferenceMapper.getconferencebyname",conference_name);
    }

    public boolean updateConference(Conference conference){
        sqlSessionTemplate.update("com.wincom.mapper.ConferenceMapper.updateconference",conference);
        return true;
    }
    public boolean deleteConference(int conference_id) {
        sqlSessionTemplate.delete("com.wincom.mapper.ConferenceMapper.deleteconference", conference_id);
        sqlSessionTemplate.delete("com.wincom.mapper.ConferenceMapper.deleteconference", conference_id);
        return true;
    }
}