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
    <script type="text/javascript" charset="UTF-8" src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" charset="UTF-8">
        function goto() {
            var sendto = document.forms["create_form"]["sendto"].value;
            var emailname = document.forms["create_form"]["emailname"].value;
            var emailcontent = document.forms["create_form"]["emailcontent"].value;
            var sendto1 = document.forms["create_form"]["sendto"];
            if (sendto==null||sendto==""){
                alert("请输入邮箱！");
                return false;
            }
            var myReg = /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
            if (!myReg.test(sendto1.value)){
                alert("邮箱格式不符合规定");
                sendto1.focus();
                sendto1.value="";
                return false;
            }
            if (emailname==null||emailname==""){
                alert("请输入邮件主题！");
                return false;
            }
            if (emailcontent==null||emailcontent==""){
                alert("请输入邮件内容！");
                return false;
            }
        }
    </script>
    <style>
        <%@include file="css/frist.css"%>
        <%@include file="css/announcement.css"%>
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
    <div class="right_bottom">

        <div class="list" id="div2" style="display: block">
            </br></br></br>
            <center>
                <strong style="font-size: 25px;text-align: center">发送邮件</strong>
                <form name="create_form"  onsubmit="return goto()" action="mail/send" method="POST">
                <div class="book_list">
                        <div class="create" style="background-color:honeydew;width: 600px;height:300px;border-radius:10px;border:bisque 5px solid;">
                            </br>
                            </br>
                            <label style="width: 100px;font-size: 20px">收件人地址：</label>
                            <input type="text" style="width:200px;font-size: 18px" id="sendto" name="sendto"/>
                            </br>
                            </br>
                            <label style="width: 100px;font-size: 20px">邮件的标题： </label>
                            <input type="text" style="width:200px;font-size: 18px" id="emailname" name="emailname"/>
                            </br>
                            </br>
                            <label style="width: 100px;font-size: 20px">邮件的内容：</label>
                            </br>
                            <textarea rows="3" cols="20" id="emailcontent" name="emailcontent" style="resize:none;width:300px">
                            </textarea>
                            </br>
                            </br>
                        </div>
                </div>
                    <input id="submit" style="font-size: 18px" type="submit" name="submit" value="发送"/>
                </form>
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
