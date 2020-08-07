package com.wincom.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wincom.domain.Room;
import com.wincom.service.RoomService;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;

@Controller

@RequestMapping("/room")
public class RoomController {
    @Resource

    private RoomService roomService;
    private Room room;
    public Room getRoom() {
        return room;
    }
    public void setRoom(Room room) {
        this.room = room;
    }
    //所有会议室
    @RequestMapping(value="/meetingroom",method= RequestMethod.GET)
    public String pageListall(HttpServletRequest request, ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo) {

        Integer pageSize = 6;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<Room> rooms = roomService.getallRoom();//获取所有
        PageInfo<Room> pageInfo = new PageInfo<Room>(rooms);
        out.println();
        map.addAttribute("pageInfo", pageInfo);
        return "meetingroom";
    }

    //修改会议室信息
    @RequestMapping(value="/updateRoom",method= RequestMethod.GET)
    public String updateRoom(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo){
        int room_id=Integer.parseInt(request.getParameter("room.room_id"));
        String room_name=request.getParameter("room.room_name");
        String room_place=request.getParameter("room.room_place");
        String room_number=request.getParameter("room.room_number");

        Room room=new Room();
        room.setRoom_id(room_id);
        room.setRoom_name(room_name);
        room.setRoom_place(room_place);
        room.setRoom_number(room_number);
        System.out.println(room.getRoom_name());
        if (roomService.updateRoom(room)) {
            request.setAttribute("updatesign", 1);
            return "updateMeetingroomT";
        } else
        {return "updateerror";}
    }
    //创建会议室
    @RequestMapping("/createroom")
    public String createroom(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        HttpSession session=request.getSession(false);

        Integer room_id= Integer.valueOf(request.getParameter("room_id"));
        String room_name=request.getParameter("room_name");
        String room_number=request.getParameter("room_number");
        String room_place=request.getParameter("room_place");
        Room usr=new Room();
        usr.setRoom_name(room_name);
        usr.setRoom_place(room_place);
        usr.setRoom_number(room_number);
        usr.setRoom_id(room_id);

        if (roomService.add(usr)) {
            return "addroomsuccess";
        } else
        {return "addroomrerror";}
    }
    //删除会议室
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request){
        int room_id=Integer.parseInt(request.getParameter("roomid"));
        System.out.println(room_id);
        roomService.deleteRoom(room_id);
        request.setAttribute("deletesign", 1);
        return "updateMeetingroomT";
    }

    //按天查询会议次数
    @RequestMapping(value="/checkroomuse",method= RequestMethod.POST)
    @ResponseBody
    public String checkroomuse(HttpServletRequest request) {
        Integer room_id = Integer.valueOf(request.getParameter("room_id"));
        System.out.println(room_id);
        String t = "1";
        String f = "0";
        if (roomService.checkuse(room_id)) {
            return t;
        } else {
            return f;
        }
    }
}
