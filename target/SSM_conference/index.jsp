<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Title</title>
    <style>
        <%@include file="css/index.css"%>
    </style>
    <script type="text/javascript" charset="UTF-8" language="javascript" src="js/login.js"></script>
    <script type="text/javascript" charset="UTF-8" language="javascript" src="js/My97DatePicker/WdatePicker.js">
    </script>
</head>
<body class="one"><div class="start">
    <div class="start0">
        <div class="xitong">
            <br/><strong id="zi1">会议管理系统</strong><br/>
            <strong id="zi2">Conference Management System</strong></div> <br/>
        <div class="start1">登录</div>
        <br/><br/><br/>
        <form name="register_form"  onsubmit="return go_to()" action="user/login" method="POST">
            <table class="biao" align="center" width="350" border="1" cellspacing="0"><br/><br/><br/>
                <tr><td>账号：</td>
                    <td><input type="text" id="id" name="id" placeholder="6~11位数字,1~9开头"/></td></tr>
                <tr><td>密码：</td>
                    <td><input type="password" id="password" name="password" placeholder="4--23字母数字组合" /></td></tr>
            </table>
            <a href="register.jsp">我是新用户，点击去注册</a>
            <input id="submit" type="submit" onclick="validate();" name='submit' value="登录">
        </form></div></div>
</body>
