<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <style>
        <%@include file="../../css/frist.css"%>
        <%@include file="../../css/basic.css"%>
    </style>
    <script type="text/javascript" charset="UTF-8" src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" charset="UTF-8">
        function checkuse(node) {//根据图书id跳转到图书详情页
            var a=node.parentNode.parentNode;
            var room_id=a.cells[0].innerText;
            $.ajax({
                method: 'POST',
                url: "../room/checkroomuse?room_id="+room_id,
                async:false,
                dateType: 'JSON',
                success: function (dat) {
                    var s = dat;
                    if (1 == s) {
                        alert("检查成功，结果为：已占用");
                    } else {
                        alert("检查成功，结果为：未占用");
                    }
                },
                error:function (data) {
                    alert("检查出错");
                }
            });
        }
    </script>
    <script type="text/javascript" charset="UTF-8" src="<c:url value='/js/meetingroom.js'/>"></script>
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
            <li><a href="/SSM_conference_war/announcement.jsp">通告管理</a></li><br/>
            <li><a href="/SSM_conference_war/meetingphoto.jsp">会议分析</a></li>
        </ul>
    </div>
</div>
<div class="right">
    <div class="right_top">
        <ul class="n">
        <li class="selected"><img src="../images/shou.png"><br/><a id="dao" href="../user/loginsuccess">首页</a></li>
        <li><img src="../images/wode.png"><br/><a href="#" onclick="select()" style="font-size: 14px" id="dao">创建会议室</a></li>
            </ul>
        <div class="right_top_left">  <a id="tuichu" href="/SSM_conference_war/lagout.jsp"><img src="../images/tuichu.jpg">退出</a>
        </div>
        <div class="right_top_right">
            <img id="user" src="../images/user.jpg"><br/><a href="../user/myaccount" id="name"><%=session.getAttribute("username")%></a>
        </div>
    </div>

    <div class="right_bottom">
        <div class="list" id="div1" >
        <br/> <br/> <br/>
        <center>
            <strong style="font-size: 25px;text-align: center">会议室全况</strong>
            <div class="book_list">
                <table class="look" width="770" border="1">
                    <tr style="background-color: #b9def0">
                        <th style="width: 150px">会议室编号</th>
                        <th style="width: 150px">会议室名称</th>
                        <th style="width: 150px">会议室地点</th>
                        <th style="width: 100px">容纳人数</th>
                        <th style="width: 200px">操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="room">
                        <tr id="become">
                            <td>${room.room_id}</td>
                            <td>${room.room_name}</td>
                            <td>${room.room_place}</td>
                            <td>${room.room_number}</td>
                            <td>
                                <button class="check" onclick="checkuse(this)">检查是否占用</button>
                                <button class="edit" onclick="edit_room(this)">编辑</button>
                                <button class="delete" onclick="delete_room(this)">删除</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div> <p>当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
                页,总 ${pageInfo.total } 条记录</div></p>
    <a href="allroom?pageNo=${pageInfo.firstPage}">第一页</a>
    <c:if test="${pageInfo.hasPreviousPage }">
        <a href="allroom?pageNo=${pageInfo.pageNum-1}">上一页</a>
    </c:if>

    <c:if test="${pageInfo.hasNextPage}">
        <a href="allroom?pageNo=${pageInfo.pageNum+1}">下一页</a>
    </c:if>

    <a href="allroom?pageNo=${pageInfo.lastPage}">最后页</a>
    </center>
            <div class="popup_wrap" id="delete_wrap">
                <div id="delete_content" class="popup_content">
                    <div class="popup_head">
                        <h3>删除</h3>
                    </div>
                    <div id="delete_main" class="popup_main">
                        <p>确认要删除吗?</p>
                        <form method="post" action="../room/delete" id="delete_book">
                            <input type="number" id="roomid" name="roomid" style="display: none">
                            <button type="submit" class="delete_btn" onclick="confirm_delete()">确认</button>
                            <button type="reset" class="cancel_btn" onclick="close_delete()">取消</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <div class="list" id="div2" style="display: none">
            </br></br></br>
            <center>
                <strong style="font-size: 25px;text-align: center">创建会议室</strong>
                <div class="book_list">
                    <form name="create_form"  onsubmit="return go_to()" action="../room/createroom" method="GET">
                        <div class="create" style="background-color:honeydew;width: 600px;border-radius:10px;border:bisque 5px solid;">
                            </br>
                            <label style="width: 100px">创建人</label>
                            <input type="text" style="width:150px;" id="username" name="username" autofocus="autofocus" value="<%=session.getAttribute("username")%>" onblur="checkuser()"/>
                            </br><span id="span1" style="font-size: 14px;color: green;margin-left: 50px"></span>
                            </br>
                            <label style="width: 100px">会议室编号</label>
                            <input type="text" id="room_id" name="room_id"/>
                            </br>
                            </br>
                            <label style="width: 100px">会议室名称</label>
                            <input type="text" id="room_name" name="room_name"/>
                            </br>
                            </br>
                            <label style="width: 100px">会议室地点</label>
                            <input type="text" id="room_place" name="room_place"/>
                            </br>
                            </br>
                            <label style="width: 100px;margin-left: -10px">容纳人数</label>
                            <input type="number" id="room_number" name="room_number"/>
                            </br>
                            </br>
                        </div>
                        <input id="submit" style="margin-left: -70px" type="submit" name='submit' value="提交">
                    </form>
                    <button id="quxiao" style="margin-top: -40px;margin-left: 70px" onclick="quxiao()">取消</button>
                </div>
            </center>
        </div>
</div>
    <div class ="finally">
        2020烟台大学计算机与控制工程学院</br>
        设计师：163-2 徐凯强
    </div>
</div>
</body>
</html>
