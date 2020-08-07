package com.wincom.service.impl;

import com.wincom.Dao.RoomDao;
import com.wincom.domain.Room;
import com.wincom.service.RoomService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("roomService")
public class RoomServiceImpl implements RoomService{

    @Resource
    private RoomDao roomDao;

    @Override
    public boolean checkuse(int room_id){
        return this.roomDao.checkuse(room_id);
    }

    @Override
    public Room getRoomById(int room_id) {
        return this.roomDao.getRoomById(room_id);
    }
    @Override
    public List<Room> getallRoom() {
        return this.roomDao.getallRoom();
    }
    @Override
    public boolean add(Room room) {
        return this.roomDao.add(room);
    }
    @Override
    public boolean updateRoom(Room room) {
        return this.roomDao.updateRoom(room);
    }
    @Override
    public boolean deleteRoom(int room_id) {
        return this.roomDao.deleteRoom(room_id);
    }
}
