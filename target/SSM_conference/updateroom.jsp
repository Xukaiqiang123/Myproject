<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.wincom.Dao.RoomDao" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>会议室信息</title>
    <meta charset="UTF-8">
    <script type="text/javascript" charset="UTF-8" src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="<c:url value='/js/updateroom.js'/>"></script>
    <style>
        <%@include file="css/frist.css"%>
        <%@include file="css/updateroom.css"%>
    </style>
</head>
<body class="beijing">
<div class="left"><img id="biaozhi" src="images/huiyi.jpg">
    <div id="nav">
        <ul>
            <li><a href="user/myaccount">账号管理</a></li><br/>
            <% int i = (int) session.getAttribute("powersign");
                if (i == 0){
                    out.print(" <li style='display:none'</li>");
                    out.print(" <li style='display:none'></li>");
                    out.print(" <li style='display:none'></li>");
                }
                else {
                    out.print(" <li ><a style='z-index: 620' href='conference/allconferences'>会议管理</a></li><br/>");
                    out.print(" <li ><a style='z-index: 620' href='room/meetingroom'>会议室管理</a></li><br/>");
                    out.print(" <li ><a style='z-index: 620' href='user/alluser'>用户管理</a></li><br/>");
                }
            %>
            <li><a href="announcement.jsp">通告管理</a></li><br/>
            <li><a href="meetingphoto.jsp">会议分析</a></li>
        </ul>
    </div>
</div>
<div class="right">
    <div class="right_top">
        <ul class="n">
            <li class="selected"><img src="images/shou.png"><br/><a id="dao" href="user/loginsuccess">首页</a></li>
        </ul>

        <div class="right_top_left">  <a id="tuichu" href="lagout.jsp"><img src="images/tuichu.jpg">退出</a>
        </div>
        <div class="right_top_right">
            <img id="user" src="images/user.jpg"><br/><a href="user/myaccount" id="name"><%=session.getAttribute("username")%></a>
        </div>
    </div>
    </br></br>
    <%int room_id= Integer.parseInt(request.getParameter("room_id"));%>
    <jsp:useBean id="room" class="com.wincom.domain.Room"></jsp:useBean>
    <%
        ServletContext sc=request.getSession().getServletContext();
        ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(sc);
        RoomDao roomDao= (RoomDao) ac.getBean("roomDao");
        room=roomDao.getRoomById(room_id);
    %>
    </br></br>
    <center>
        <strong style="text-align: center;font-size: 22px">会议室信息修改</strong>
        <form action="room/updateRoom" method="GET" id="add_book" onsubmit="return check_input(this)">
            <table class="look0" width="600" border="1">
                <input type="number" name="room.room_id" value="<%=room.getRoom_id()%>"  style="display: none">

                <tr class="a1">
                    <td>会议室编号</td>
                    <td><input type="text" style="font-size: 17px" required="required" name="room.room_id" value="<%=room.getRoom_id()%>" ></td>
                </tr>
                <tr>
                    <td>会议室名称</td>
                    <td><input type="text" style="font-size: 17px" required="required" name="room.room_name" value="<%=room.getRoom_name()%>" ></td>
                </tr>
                <tr class="a1">
                    <td>会议室地点</td>
                    <td><input type="text" style="font-size: 17px" required="required" name="room.room_place" value="<%=room.getRoom_place()%>"></td>
                </tr>
                <tr><td>容纳人数</td>
                    <td><input type="number" style="font-size: 17px" required="required" name="room.room_number" value="<%=room.getRoom_number()%>"></td>
                </tr>
                <tr class="a1"><td>操作</td>
                    <td><input type="submit" style="font-size: 17px" value="提交">
                        <input type="reset" value="取消" style="font-size: 17px;margin-left: 50px" onclick="javascript:history.back()"></td>
                </tr>
            </table>
        </form>
    </center>
</div>
<div class ="finally">
    2020烟台大学计算机与控制工程学院</br>
    设计师：163-2 徐凯强
</div>
</body>
</html>