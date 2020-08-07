<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.1.js"></script>
    <title>Title</title>
    <style>
        <%@include file="css/register.css"%>
    </style>
    <script type="text/javascript" charset="UTF-8" language="javascript" src="js/register.js">
    </script>
    <script>
        function go_to() {
            var Number = document.forms["register_form"]["user.id"].value;
            var name = document.forms["register_form"]["user.name"].value;
            var phone = document.forms["register_form"]["user.phone"].value;
            var position = document.forms["register_form"]["user.position"].value;
            var email=document.forms["register_form"]["user.email"].value;
            var password1=document.forms["register_form"]["user.password"].value;
            var password2=document.forms["register_form"]["mima2"].value;
            var yanzhen=document.forms["register_form"]["input1"].value;

            var hao = document.getElementById("user.id");
            var mima = document.getElementById("user.password");
            var em=document.getElementById("user.email");
            var ph=document.getElementById("user.phone");
            var user_style1=document.getElementById("user.user_style1");
            var user_style2=document.getElementById("user.user_style2");
            if(Number==null||Number==""){
                alert("请输入账号！");
                return false;
            }
            var regex3 = /^[1-9](\d){5,10}$/;
            if (!regex3.test(hao.value)){
                alert("账号不符合规定");
                hao.focus();
                hao.value="";
                return false;
            }
            if(name==null||name==""){
                alert("请输入姓名！");
                return false;
            }
            if(phone==null||phone==""){
                alert("请输入手机号！");
                return false;
            }
            var pph=/^1[34578]\d{9}$/;
            if (!pph.test(ph.value)){
                alert("手机号不符合规定");
                ph.focus();
                ph.value="";
                return false;
            }
            if(position==null||position==""){
                alert("请输入职位！");
                return false;
            }
            if (email==null||email==""){
                alert("请输入邮箱！");
                return false;
            }
            var myReg = /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
            if (!myReg.test(em.value)){
                alert("邮箱格式不符合规定");
                em.focus()
                em.value="";
                return false;
            }
            if (password1==null||password1==""){
                alert("请输入密码！");
                return false;
            }
            var rege0= /(?!^\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]{4,23}/;
            if (!rege0.test(mima.value)){
                alert("密码不符合规定");
                mima.focus();
                mima.value="";
                return false;
            }
            if (password2==null||password2==""){
                alert("请再次输入密码！");
                return false;
            }
            if(password1!=password2){
                alert("两次密码输入不一致！");
                return false;
            }
            if(yanzhen==null||yanzhen==""){
                alert("请输入验证码！");
                return false;
            }
            if(user_style1.checked()){
                user_style2.attr("disabled","disabled");
            }
            if(user_style2.checked()){
                user_style1.attr("disabled","disabled");
            }
        }
    </script>
</head>
<body class="one"><div class="start">
    <div class="start0">
        <div class="xitong"> <br/><strong id="zi1">会议管理系统</strong><br/>
            <strong id="zi2">Conference Management System</strong></div>
        <br/>
        <div class="start1">注册</div>
        <br/><br/>
        <form name="register_form"  onsubmit="return go_to()" action="user/register" method="POST">
            <table class="biao" align="center" width="500" border="1" cellspacing="0"><br/><br/><br/>
                <tr><td>账号：</td>
                    <td><input style="width:150px;" type="text" id="user.id" name="user.id" placeholder="6--11位数字，1~9开头" onblur="checkName()"/>
                        <span id="span1" style="font-size: 16px"></span>
                    </td></tr>
                <tr><td>姓名：</td>
                    <td><input type="text" id="user.name" name="user.name"/></td></tr>
                <tr><td>电话：</td>
                    <td><input type="text" id="user.phone" name="user.phone"/></td></tr>
                <tr><td>职位：</td>
                    <td><input type="text" id="user.position" name="user.position"/></td></tr>
                <tr><td>邮箱：</td>
                    <td><input type="text" id="user.email" name="user.email"/></td></tr>
                <tr><td><label style="width: 100px">用户类型:</label></td>
                    <td><input type="radio" name="user.user_style" id="user.user_style1" value="用户">用户
                        <input type="radio" name="user.user_style" id="user.user_style2" value="管理者">管理者</td></tr>
                <tr><td>密码：</td>
                    <td><input type="password" id="user.password" name="user.password" placeholder="4--23位字母数字组合" /></td></tr>
                <tr><td>再次输入密码：</td>
                    <td><input type="password" id="mima2" name="mima2"/></td></tr>
                <tr><td>验证码：<input type="text" onclick="createCode()" readonly="readonly" id="checkCode" class="unchanged" style="width: 80px" /></td>
                    <td><input type="text" id="input1" name = "input1" onblur="validate()"/> </td></tr>
            </table>
            <input id="submit" type="submit" name='submit' value="注册">
        </form></div></div>
</body>
</html>