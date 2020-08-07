<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.wincom.Dao.ConferenceDao" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>会议信息</title>
    <meta charset="UTF-8">
    <script type="text/javascript" charset="UTF-8" src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="<c:url value='/js/updateConferences.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/My97DatePicker/WdatePicker.js'/>"></script>
    <style>
        <%@include file="css/frist.css"%>
        <%@include file="css/updateConferences.css"%>
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
    <%int conference_id = Integer.parseInt(request.getParameter("conference_id"));%>
    <jsp:useBean id="conference" class="com.wincom.domain.Conference"></jsp:useBean>
    <%
        ServletContext sc=request.getSession().getServletContext();
        ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(sc);
        ConferenceDao conferenceDao= (ConferenceDao) ac.getBean("conferenceDao");
        conference=conferenceDao.getConferenceById(conference_id);
    %>
    </br></br>
    <center>
        <strong style="text-align: center;font-size: 22px">会议信息修改</strong>
        <form action="conference/updateConference" method="GET" id="add_book" onsubmit="check_input(this)">
            <table class="look0" width="600" border="1">
                <input type="number" name="conference_id" value="<%=conference.getConference_id()%>"  style="display: none">

                <tr class="a1"><td>会议主题</td>
                    <td><input style="font-size: 17px" type="text" required="required" name="conference_name" value="<%=conference.getConference_name()%>" ></td>
                </tr>
                <tr>
                    <td>会议人数</td>
                    <td><input style="font-size: 17px" type="text" required="required" name="conference_people" value="<%=conference.getConference_people()%>"></td>
                </tr>
                <tr class="a1">
                    <td>会议类型</td>
                    <td><input style="font-size: 17px" type="text" required="required" name="conference_style" value="<%=conference.getConference_style()%>"></td>
                </tr>
                <tr><td>发起人</td>
                    <td><input style="font-size: 17px" type="text" required="required" name="user_id" value="<%=conference.getUser_id()%>"></td>
                </tr>
                <tr class="a1"><td>会议室</td>
                    <td><input style="font-size: 17px" type="text" required="required" name="room_id" value="<%=conference.getRoom_id()%>"></td>
                </tr>
                <tr><td>开始时间</td>
                    <td><input style="font-size: 17px" type="text" required="required" name="starttime" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00'})" value="<%=conference.getStarttime()%>"></td>
                </tr>
                <tr class="a1"><td>结束时间</td>
                    <td><input style="font-size: 17px" type="text" required="required" name="endtime" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00'})" value="<%=conference.getEndtime()%>"></td>
                </tr>
                <tr><td>会议状态</td>
                    <td><input style="font-size: 17px" type="text" readonly="true" required="required" name="conference_state" value="<%=conference.getConference_state()%>"></td>
                </tr>
                <tr class="a1"><td>会议内容</td>
                    <td><textarea style="font-size: 17px" type="text" rows="3" style="resize:none" cols="20" required="required" name="content" value="<%=conference.getContent()%>">
                    <%=conference.getContent()%>
                    </textarea>
                    </td>
                </tr>
                <tr><td>操作</td>
                    <td><input style="font-size: 17px" type="submit" value="提交"><input style="font-size: 17px;margin-left: 50px" type="reset" value="取消" onclick="javascript:history.back()"></td>
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