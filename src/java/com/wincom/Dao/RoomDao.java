package com.wincom.Dao;

import com.sun.org.apache.bcel.internal.generic.RETURN;
import com.wincom.domain.Conference;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import com.wincom.domain.Room;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;

import static java.lang.System.out;

@Repository("roomDao")
public class RoomDao {

    @Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;

    public Room getRoomById(int room_id){
        return (Room) sqlSessionTemplate.selectOne("com.wincom.mapper.RoomMapper.getRoomById",room_id);
    }
    public List<Room> getallRoom(){
        return sqlSessionTemplate.selectList("com.wincom.mapper.RoomMapper.getallroom");
    }
    public boolean add(Room room){
        sqlSessionTemplate.insert("com.wincom.mapper.RoomMapper.save",room);
        return true;
    }
    public boolean updateRoom(Room room){
        sqlSessionTemplate.insert("com.wincom.mapper.RoomMapper.updateroom",room);
        return true;
    }
    public boolean deleteRoom(int room_id){
        sqlSessionTemplate.insert("com.wincom.mapper.RoomMapper.deleteroom",room_id);
        return true;
    }

    public boolean checkuse(int room_id){
        System.out.println("Dao");
        Conference conference=sqlSessionTemplate.selectOne("com.wincom.mapper.ConferenceMapper.checkuse",room_id);
        if (conference!=null){
            return true;
        }
        else {
            return false;
        }
    }
}
