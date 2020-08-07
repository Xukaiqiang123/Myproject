<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" charset="UTF-8" src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="<c:url value='/js/myaccount.js'/>"></script>
    <style>
        <%@include file="../../css/frist.css"%>
        <%@include file="../../css/myaccount.css"%>
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
    <div class="list" id="div1" >
    <center>
        <br/><br/><br/><br/>
        <strong style="font-size: 25px;text-align: center">账号信息</strong>
        <div class="book_list">
            <table class="look" width="600">
                <c:forEach items="${pageInfo.list}" var="user">
                    <tr class = "a1"><td style="width:100px">账号:</td>
                        <td id="id" style="font-size: 17px">${user.id}</td>
                    </tr>
                    <tr><td style="width:100px">姓名:</td>
                        <td style="font-size: 17px">${user.username}</td>
                    </tr>
                    <tr class = "a1"><td style="width:100px">职位:</td>
                        <td style="font-size: 17px">${user.position}</td>
                    </tr>
                    <tr><td style="width:100px">电话:</td>
                        <td style="font-size: 17px">${user.phone}</td>
                    </tr>
                    <tr class = "a1"><td style="width:100px">邮箱:</td>
                        <td style="font-size: 17px">${user.email}</td>
                    </tr>
                    <tr>
                        <td style="width:100px">操作:</td>
                        <td ><button class="edit" style="font-size: 17px" onclick="edit_user()">编辑</button>
                            <button class="edit" style="font-size: 17px;margin-left: 50px" onclick="edit_password()">修改密码</button></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </center>
    </div>

    <div class="list" id="div2" style="display: none">
        </br></br></br>
        <center>
            <strong style="font-size: 25px;text-align: center">修改密码</strong>
            <div class="book_list">
                <form name="create_form"  onsubmit="return go_to()" action="../user/updatepassword" method="GET">
                    <div class="create" style="background-color:honeydew;width: 600px;border-radius:10px;border:bisque 5px solid;">
                        </br>
                        <label style="width: 100px">原密码：</label>
                        <input type="password" style="width:150px;" id="password" name="user.password" onblur="checkpassword()"/>
                        </br><span id="span1" style="font-size: 14px;color: green;margin-left: 50px"></span>
                        </br>
                        <label style="width: 100px">新密码：</label>
                        <input type="text" id="password1" name="user.password0" placeholder="4--23位字母数字组合"/>
                        </br>
                        </br>
                        <label style="width: 100px">再输一次</label>
                        <input type="text" id="password2" name="user.password1" placeholder="4--23位字母数字组合"/>
                        </br>
                        </br>
                        <input type="number" name="user.id" value="<%=session.getAttribute("id")%>"  style="display: none">
                    </div>
                    <input id="submit" style="margin-left: -70px" type="submit" name='submit' value="提交">
                </form>
                <button id="quxiao" style="margin-top: -42px;margin-left: 70px" onclick="quxiao()">取消</button>
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
