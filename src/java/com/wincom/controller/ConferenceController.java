package com.wincom.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wincom.domain.Conference;
import com.wincom.domain.Daydate;
import com.wincom.domain.User;
import com.wincom.service.ConferenceService;
import com.wincom.service.UserService;
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
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.lang.System.out;

@Controller

@RequestMapping("/conference")
public class ConferenceController {
    @Resource

    private ConferenceService conferenceService;
    private UserService userService;
    private Conference conference;
    private User user;
    public Conference getConference() {
        return conference;
    }
    public void setConference(Conference conference) {
        this.conference = conference;
    }

    //我的会议
    @RequestMapping(value="/lookconference",method= RequestMethod.GET)
    public String pageList(HttpServletRequest request, ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo) {
        HttpSession session=request.getSession(false);
        Integer user_id= (Integer) session.getAttribute("user_id");
        Integer pageSize = 6;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<Conference> conferences = conferenceService.getmyconference(user_id);//获取所有信息
        PageInfo<Conference> pageInfo = new PageInfo<Conference>(conferences);
        map.addAttribute("pageInfo", pageInfo);
        request.setAttribute("sign", 1);
        return "loginsuccess";
    }

    //历史会议
    @RequestMapping(value="/afterconference",method= RequestMethod.GET)
    public String pageListtwo(HttpServletRequest request, ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo) {

        Integer pageSize = 6;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<Conference> conferences = conferenceService.getConferenceByafter();//获取所有用户信息
        PageInfo<Conference> pageInfo = new PageInfo<Conference>(conferences);
        map.addAttribute("pageInfo", pageInfo);
        request.setAttribute("sign", 3);
        return "loginsuccess";
    }

    //即时会议
    @RequestMapping(value="/cometimeconference",method= RequestMethod.GET)
    public String pageListthree(HttpServletRequest request, ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo) {
        HttpSession session=request.getSession(false);

        Integer pageSize = 6;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<Conference> conferences = conferenceService.getConferenceBycometime();//获取所有用户信息
        PageInfo<Conference> pageInfo = new PageInfo<Conference>(conferences);
        map.addAttribute("pageInfo", pageInfo);
        request.setAttribute("sign", 4);
        return "loginsuccess";
    }

    //所有会议
    @RequestMapping(value="/allconference",method= RequestMethod.GET)
    public String pageListall(HttpServletRequest request, ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo) {

        Integer pageSize = 6;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<Conference> conferences = conferenceService.getallConference();//获取所有用户信息
        PageInfo<Conference> pageInfo = new PageInfo<Conference>(conferences);
        map.addAttribute("pageInfo", pageInfo);
        request.setAttribute("sign", 5);
        return "loginsuccess";
    }
    //会议室查询
    @RequestMapping(value="/byroom",method= RequestMethod.GET)
    public String pageListroom(HttpServletRequest request, ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo) {
        Integer room_id= Integer.valueOf(request.getParameter("room_id"));
        Integer pageSize = 6;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<Conference> conferences = conferenceService.getConferencebyroom(room_id);//获取所有用户信息
        PageInfo<Conference> pageInfo = new PageInfo<Conference>(conferences);
        map.addAttribute("pageInfo", pageInfo);
        request.setAttribute("sign", 5);
        return "loginsuccess";
    }
    //会议名称查询
    @RequestMapping(value="/byname",method= RequestMethod.GET)
    public String pageListname(HttpServletRequest request, ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo) {
        String conference_name=request.getParameter("conference_name");
        Integer pageSize = 6;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<Conference> conferences = conferenceService.getConferencebyname(conference_name);//获取所有用户信息
        PageInfo<Conference> pageInfo = new PageInfo<Conference>(conferences);
        map.addAttribute("pageInfo", pageInfo);
        request.setAttribute("sign", 5);
        return "loginsuccess";
    }
    //创建人查询
    @RequestMapping(value="/byusername",method= RequestMethod.GET)
    public String pageListusername(HttpServletRequest request, ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo) {
        Integer user_id= Integer.valueOf(request.getParameter("user_id"));
        Integer pageSize = 6;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<Conference> conferences = conferenceService.getConferencebyusername(user_id);//获取所有用户信息
        PageInfo<Conference> pageInfo = new PageInfo<Conference>(conferences);
        map.addAttribute("pageInfo", pageInfo);
        request.setAttribute("sign", 5);
        return "loginsuccess";
    }

    //创建会议
    @RequestMapping("/addconference")
    public String addconference(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        HttpSession session=request.getSession(false);
        Integer id= (Integer) session.getAttribute("user_id");
        out.println(id);
        String conference_name=request.getParameter("conference_name");
        Integer conference_people=Integer.valueOf(request.getParameter("conference_people"));
        Integer room_id= Integer.valueOf(request.getParameter("room_id"));
        String content=request.getParameter("content");
        String conference_style=request.getParameter("conference_style");
        String starttime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        String sendway=request.getParameter("sendway");
        String conference_state=request.getParameter("conferencce_state");
        Conference usr=new Conference();
        usr.setConference_people(conference_people);
        usr.setConference_name(conference_name);
        usr.setStarttime(starttime);
        usr.setUser_id(id);
        usr.setRoom_id(room_id);
        usr.setContent(content);
        usr.setConference_style(conference_style);
        usr.setEndtime(endtime);
        usr.setSendway(sendway);
        usr.setConference_state(conference_state);
        out.println(usr.getStarttime());
        conferenceService.add(usr);
            request.setAttribute("sign", 2);
            request.setAttribute("addconferencesign", 1);
            return "loginsuccess";
        }

    //所有会议
    @RequestMapping(value="/allconferences",method= RequestMethod.GET)
    public String pageListalls(HttpServletRequest request, ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo) {
        Integer pageSize = 6;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<Conference> conferences = conferenceService.getallConference();//获取所有用户信息
        PageInfo<Conference> pageInfo = new PageInfo<Conference>(conferences);
        map.addAttribute("pageInfo", pageInfo);
        return "allconferences";
    }

    //修改会议
    @RequestMapping("/updateConference")
    public String updateconference(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        HttpSession session=request.getSession(false);
        int conference_id= Integer.parseInt(request.getParameter("conference_id"));
        String conference_name=request.getParameter("conference_name");
        int conference_people=Integer.parseInt(request.getParameter("conference_people"));
        int room_id= Integer.parseInt(request.getParameter("room_id"));
        int user_id= Integer.parseInt(request.getParameter("user_id"));
        String content=request.getParameter("content");
        String conference_style=request.getParameter("conference_style");
        String starttime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        String sendway=request.getParameter("sendway");

        Conference usr=new Conference();
        usr.setConference_id(conference_id);
        usr.setConference_people(conference_people);
        usr.setConference_name(conference_name);
        usr.setStarttime(starttime);
        usr.setUser_id(user_id);
        usr.setRoom_id(room_id);
        usr.setContent(content);
        usr.setConference_style(conference_style);
        usr.setEndtime(endtime);
        usr.setSendway(sendway);

        out.println(usr.getStarttime());
        conferenceService.updateConference(usr);
        request.setAttribute("sign", 2);
        request.setAttribute("addconferencesign", 1);
        request.setAttribute("updatesign", 1);
        return "updateConferenceT";
    }
    //删除会议
    @RequestMapping("/deleteconference")
    public String delete(HttpServletRequest request){
        int conference_id=Integer.parseInt(request.getParameter("conference_id"));
        System.out.println(conference_id);
        conferenceService.deleteConference(conference_id);//删除图书
        request.setAttribute("deletesign", 1);
        return "updateConferenceT";
    }
}
