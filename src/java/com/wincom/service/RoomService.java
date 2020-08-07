package com.wincom.service;
import com.wincom.domain.Room;

import java.util.List;

public interface RoomService {

    public Room getRoomById(int room_id);

    public List<Room> getallRoom();
    public boolean add(Room room);

    public boolean updateRoom(Room room);

    public boolean deleteRoom(int room_id);

    public boolean checkuse(int room_id);
}

