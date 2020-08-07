<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" charset="UTF-8" src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="<c:url value='/js/allconferences.js'/>"></script>
    <style>
        <%@include file="../../css/frist.css"%>
        <%@include file="../../css/allconference.css"%>
    </style>
</head>
<body class="beijing">
<div class="left"><img id="biaozhi" src="../images/huiyi.jpg">
    <div id="nav">
        <ul>
            <li><a href="../user/myaccount">账号管理</a></li><br/>
            <% int i = (int) session.getAttribute("powersign");
                if (i == 0){
                    out.print(" <li style='display:none'</li>");
                    out.print(" <li style='display:none'></li>");
                    out.print(" <li style='display:none'></li>");
                }
                else {
                    out.print(" <li ><a style='z-index: 620' href='../conference/allconferences'>会议管理</a></li><br/>");
                    out.print(" <li ><a style='z-index: 620' href='../room/meetingroom'>会议室管理</a></li><br/>");
                    out.print(" <li ><a style='z-index: 620' href='../user/alluser'>用户管理</a></li><br/>");
                }
            %>
            <li><a href="../announcement.jsp">通告管理</a></li><br/>
            <li><a href="../meetingphoto.jsp">会议分析</a></li>
        </ul>
    </div>
</div>
<div class="right">
    <div class="right_top">
        <ul class="n">
            <li class="selected"><img src="../images/shou.png"><br/><a id="dao" href="../user/loginsuccess">首页</a></li>
        </ul>

        <div class="right_top_left">  <a id="tuichu" href="/SSM_conference_war/lagout.jsp"><img src="../images/tuichu.jpg">退出</a>
        </div>
        <div class="right_top_right">
            <img id="user" src="../images/user.jpg"><br/><a href="../user/myaccount" id="name"><%=session.getAttribute("username")%></a>
        </div>
    </div>
    <div class="right_bottom">
        <div class="list" id="div1"style="display: block">
            </br></br></br>
            <center>
                <strong style="font-size: 25px;text-align: center">会议信息列表</strong>
                <div class="book_list">
                    <table class="lookconference">
                        <tr id="begin">
                            <th style="width: 70px">会议序号</th>
                            <th style="width: 80px">会议主题</th>
                            <th style="width: 70px">参会人数</th>
                            <th style="width: 70px">发起人</th>
                            <th style="width: 70px">会议室</th>
                            <th style="width: 80px">会议内容</th>
                            <th style="width: 80px">会议类型</th>
                            <th style="width: 80px">开始时间</th>
                            <th style="width: 80px">结束时间</th>
                            <th style="width: 80px">会议状态</th>
                            <th style="width: 100px">操作</th>
                        </tr>
                        <c:forEach items="${pageInfo.list}" var="conference">
                            <tr id ="become">
                                <td>${conference.conference_id}</td>
                                <td>${conference.conference_name}</td>
                                <td>${conference.conference_people}</td>
                                <td>${conference.user_id}</td>
                                <td>${conference.room_id}</td>
                                <td>${conference.content}</td>
                                <td>${conference.conference_style}</td>
                                <td>${conference.starttime}</td>
                                <td>${conference.endtime}</td>
                                <td>${conference.conference_state}</td>
                                <td>
                                    <button class="edit" onclick="edit_conference(this)">编辑</button>
                                    <button class="delete" onclick="delete_conference(this)">删除</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div><p>当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
                    页,总 ${pageInfo.total } 条记录</div></p>
                <a href="allconferences?pageNo=${pageInfo.firstPage}">第一页</a>
                <c:if test="${pageInfo.hasPreviousPage }">
                    <a href="allconferences?pageNo=${pageInfo.pageNum-1}">上一页</a>
                </c:if>

                <c:if test="${pageInfo.hasNextPage }">
                    <a href="allconferences?pageNo=${pageInfo.pageNum+1}">下一页</a>
                </c:if>

                <a href="allconferences?pageNo=${pageInfo.lastPage}">最后页</a>
            </center>
        </div>
        <div class="popup_wrap" id="delete_wrap">
            <div id="delete_content" class="popup_content">
                <div class="popup_head">
                    <h3>删除</h3>
                </div>
                <div id="delete_main" class="popup_main">
                    <p>确认要删除吗?</p>
                    <form method="post" action="../conference/deleteconference" id="delete_conference">
                        <input type="number" id="conference_id" name="conference_id" style="display: none">
                        <button type="submit" class="delete_btn" onclick="confirm_delete()">确认</button>
                        <button type="reset" class="cancel_btn" onclick="close_delete()">取消</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class ="finally">
        2020烟台大学计算机与控制工程学院</br>
        设计师：163-2 徐凯强
    </div>
</div>
</body>
</html>

