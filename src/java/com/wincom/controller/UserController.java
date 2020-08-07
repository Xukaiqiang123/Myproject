package com.wincom.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wincom.domain.Conference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import com.wincom.domain.User;
import com.wincom.service.ConferenceService;
import com.wincom.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.Null;
import java.io.IOException;
import java.util.List;

@Controller

@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;
    private User user;
    private int id;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @RequestMapping("/ShowUser")
    public String toIndex(HttpServletRequest request, Model model) {
        Integer userId = Integer.valueOf(request.getParameter("id"));
        User user = this.userService.getUserById(userId);
        model.addAttribute("user", user);
        return "ShowUser";

    }
    //登录验证
    @RequestMapping("/login")
    public String login(HttpServletRequest request, Model model, HttpSession session) {
        request.getSession();
        Integer id = Integer.valueOf(request.getParameter("id"));
        String password = request.getParameter("password");
        session.setAttribute("id",id);
        User usr = new User();
        usr.setId(id);
        usr.setPassword(password);
        String power = "高级权限";
        if (userService.login(usr)) {
            model.addAttribute("user", user);
            User user1 = userService.getUserById(id);
            session.setAttribute("user_id", user1.getId());
            session.setAttribute("username", user1.getUsername());
            System.out.println(user1.getUsername());
            if (!power.equals(user1.getPower())) {
                session.setAttribute("powersign",0);
            } else {
                session.setAttribute("powersign",1);
            }
            request.setAttribute("sign", 0);
            return "loginsuccess";
        } else {
            return "loginerror";
        }
    }

    @RequestMapping("/loginsuccess")
    public String loginsuccess(HttpServletRequest request, Model model, HttpSession session) {
        return "loginsuccess";
    }
    //注册验证
    @RequestMapping("/register")
    public String register(HttpServletRequest request, Model model) {
        int id = Integer.parseInt(request.getParameter("user.id"));
        String password = request.getParameter("user.password");
        String username = request.getParameter("user.name");
        String phone = request.getParameter("user.phone");
        String email = request.getParameter("user.email");
        String position = request.getParameter("user.position");
        String user_style = request.getParameter("user.user_style");
        String power;
        if (user_style.equals("用户")) {
            power = "普通权限";
        } else {
            power = "高级权限";
        }
        User usr = new User();
        usr.setId(id);
        usr.setPassword(password);
        usr.setPosition(position);
        usr.setPhone(phone);
        usr.setEmail(email);
        usr.setUsername(username);
        usr.setUser_style(user_style);
        usr.setPower(power);
        System.out.println(usr.getUsername());
        if (userService.add(usr)) {
            return "registersuccess";
        } else {
            return "registererror";
        }
    }
    //检验注册账号是否重复
    @RequestMapping("/findByName")
    public void findByName(HttpServletRequest request, HttpServletResponse response)throws IOException {
        //调用service来查询
        //获得response
       int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        User user = this.userService.getUserById(id);
        System.out.println(user);
        response.setContentType("text/html;charset=UTF-8");
        if (user != null) {
            //存在
            response.getWriter().println("用户已经存在");
        } else {
            response.getWriter().println("账号可用");
        }
    }
    //检验会议创建者权限
    @RequestMapping("/findByposition")
    public void findByposition(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //调用service来查询
        //获得response
        String username = request.getParameter("username");
        System.out.println(username);
        User user = this.userService.getUserByname(username);
        response.setContentType("text/html;charset=UTF-8");
        String position0 = "普通员工";
        System.out.println(user);
        if (user == null) {
            response.getWriter().println("没有此员工请检查");
        } else if (user != null) {
            String position = user.getPosition();
            if (position0.equals(position)) {
                response.getWriter().println("权限不足无法创建");
            } else {
                response.getWriter().println("有权创建请继续");
            }
        }
    }
    //检验会议室创建权限
    @RequestMapping("/findByposition2")
    public void findByposition2(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //调用service来查询
        //获得response
        String username = request.getParameter("username");
        System.out.println(username);
        User user2 = this.userService.getUserByname(username);
        response.setContentType("text/html;charset=UTF-8");
        String power = "高级权限";
        System.out.println(user2);
        if (user2 == null) {
            response.getWriter().println("没有此员工请检查");
        } else if (user2 != null) {
            String power0 = user2.getPower();
            if (power.equals(power0)) {
                response.getWriter().println("有权创建请继续");
            } else {
                response.getWriter().println("权限不足无法创建");
            }
        }
    }

    //查找自己账号信息
    @RequestMapping(value="/myaccount",method= RequestMethod.GET)
    public String findmyaccount(HttpSession session,ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo){
        //调用service来查询
        //获得response
        Integer id= (Integer) session.getAttribute("id");
        System.out.println(id);
        Integer pageSize = 1;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<User> user = userService.getmyaccount(id);//获取所有用户信息
        PageInfo<User> pageInfo = new PageInfo<User>(user);
        map.addAttribute("pageInfo", pageInfo);
        return "myaccount";
    }
    //修改我的账号信息
    @RequestMapping(value="/updateMyUser",method= RequestMethod.GET)
    public String updateUser(HttpServletRequest request,HttpSession session,HttpServletResponse response,ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo){
        int id= Integer.parseInt(request.getParameter("user.id"));
        String username=request.getParameter("user.username");
        String position=request.getParameter("user.position");
        String phone=request.getParameter("user.phone");
        String email=request.getParameter("user.email");

        User user=new User();
        user.setId(id);
        user.setUsername(username);
        user.setPosition(position);
        user.setPhone(phone);
        user.setEmail(email);
        System.out.println(user.getUsername());
        if (userService.updateUser(user)) {
            request.setAttribute("updatesign", 1);
            return "updateMyaccountSuccess";
        } else
        {return "updateerror";}
    }

    //修改用户账号信息
    @RequestMapping(value="/updateusers",method= RequestMethod.GET)
    public String updateUsers(HttpServletRequest request,HttpSession session,HttpServletResponse response,ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo){
        int id= Integer.parseInt(request.getParameter("user.id"));
        String username=request.getParameter("user.username");
        String position=request.getParameter("user.position");
        String phone=request.getParameter("user.phone");
        String email=request.getParameter("user.email");
        String power=request.getParameter("user.power");

        User users=new User();
        users.setId(id);
        users.setUsername(username);
        users.setPosition(position);
        users.setPhone(phone);
        users.setEmail(email);
        users.setPower(power);

        System.out.println(users.getPosition());
        System.out.println(users.getPower());
        if (userService.updateUsers(users)) {
            request.setAttribute("updatesign", 1);
            return "updateUsersSuccess";
        } else
        {return "updateerror";}
    }

    //检查旧密码
    @RequestMapping("/checkpassword")
    public void checkpassword(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException {
        //调用service来查询
        //获得response
        Integer id= (Integer) session.getAttribute("id");
        String password=request.getParameter("password");
        System.out.println(id);
        System.out.println(password);
        User user = this.userService.getUserById(id);
        response.setContentType("text/html;charset=UTF-8");
        if (password.equals(user.getPassword())) {
            //存在
            response.getWriter().println("原密码正确");
        } else {
            response.getWriter().println("原密码错误");
        }
    }
//修改密码
    @RequestMapping(value="/updatepassword",method= RequestMethod.GET)
    public String updatepassword(HttpServletRequest request,HttpSession session,HttpServletResponse response,ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo){
        //调用service来查询
        //获得response
        int id= Integer.parseInt(request.getParameter("user.id"));
        String password=request.getParameter("user.password0");

        User user=new User();
        user.setId(id);
        user.setPassword(password);
        if (userService.updatePassword(user)) {
            request.setAttribute("updatesign0", 1);
            return "updatePasswordOK";
        } else
        {return "updateerror";}
    }


    //所有用户
    @RequestMapping(value="/alluser",method= RequestMethod.GET)
    public String pageListall(HttpServletRequest request, ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo) {

        Integer pageSize = 6;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<User> users = userService.getallUser();//获取所有用户信息
        PageInfo<User> pageInfo = new PageInfo<User>(users);
        map.addAttribute("pageInfo", pageInfo);
        request.setAttribute("sign", 5);
        return "alluser";
    }
    //删除用户
    @RequestMapping("/deleteuser")
    public String delete(HttpServletRequest request){
        int id=Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        userService.deleteUser(id);
        request.setAttribute("deletesign", 1);
        return "updateUsersSuccess";
    }
}
