var code; //在全局 定义验证码
function createCode() {
    code = "";
    var codeLength = 6;//验证码的长度
    var checkCode = document.getElementById("checkCode");
    var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');//所有候选组成验证码的字符，当然也可以用中文的
    for (var i = 0; i < codeLength; i++)
    {
        var charIndex = Math.floor(Math.random() * 36);
        code += selectChar[charIndex];
    }
    alert(code);
    if (checkCode) {
        checkCode.className = "code";
        checkCode.value = code;
    }
}
function validate() {
    var inputCode = document.getElementById("input1").value;
    if (inputCode.length <= 0) {
        alert("请输入验证码！");   }
    else if (inputCode != code) {
        alert("验证码输入错误！");
        createCode();//刷新验证码
    } else {
        alert("^-^ OK");
    }}
function go_to() {
    var Number = document.forms["register_form"]["user.id"].value;
    var name = document.forms["register_form"]["user.name"].value;
    var phone = document.forms["register_form"]["user.phone"].value;
    var position = document.forms["register_form"]["user.position"].value;
    var email=document.forms["register_form"]["user.email"].value;
    var p1=document.forms["register_form"]["user.password"].value;
    var p2=document.forms["register_form"]["mima2"].value;

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
    if(user_style1.checked()){
        user_style2.attr("disabled","disabled");
    }
    if(user_style2.checked()){
        user_style1.attr("disabled","disabled");
    }
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
function checkName(){
    var id=document.getElementById("user.id");
    var xhr=new XMLHttpRequest();//1.创建异步交互对象
    // alert(xhr);
    xhr.onreadystatechange=function () {//2.设置监听
        if (xhr.readyState==4){
            if (xhr.status==200){//5.回调函数
                document.getElementById("span1").innerText=xhr.responseText;//将回传值显示
            }
        }
    }

    xhr.open("GET","user/findByName?id="+id.value,true); //3.打开连接
    xhr.send(null);//4.发送
    // xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");//设置请求头

}

