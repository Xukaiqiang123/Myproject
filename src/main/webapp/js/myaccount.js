function edit_user() {//根据图书id跳转到图书详情页
    var id=$("#id").text();
    window.location.href="../updateMyuser.jsp?id="+id;
}
function edit_password() {
    document.getElementById('div1').style.display="none";
    document.getElementById('div2').style.display="block";
    document.getElementById('password').focus();
}
function quxiao() {
    document.getElementById('div1').style.display="block";
    document.getElementById('div2').style.display="none";
}
function go_to() {
    var p1=document.forms["register_form"]["password1"].value;
    var p2=document.forms["register_form"]["password2"].value;
    var mima = document.getElementById("user.password0");
    if (p1==null||p1==""){
        alert("请输入密码！");
        return false;
    }
    var rege0= /(?!^\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]{4,23}/;
    if (!rege0.test(mima.value)){
        alert("密码不符合规定");
        mima.focus()
        mima.value="";
        return false;
    }
    if (p2==null||p2==""){
        alert("请再次输入密码！");
        return false;
    }
    if(p1!=p2){
        alert("两次密码输入不一致！");
        return false;
    }
}
function checkpassword(){
    var password= document.getElementById("password");
    var xhr=new XMLHttpRequest();//1.创建异步交互对象
    xhr.onreadystatechange=function () {//2.设置监听
        if (xhr.readyState==4){
            if (xhr.status==200){//5.回调函数
                document.getElementById("span1").innerText=xhr.responseText;//将回传值显示
            }
        }
    }
    xhr.open("GET","../user/checkpassword?password="+password.value,true); //3.打开连接
    xhr.send(null);//4.发送
    // xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");//设置请求头

}