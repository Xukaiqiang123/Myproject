function go_to() {
    var Number0 = document.forms["register_form"]["id"].value;
    var p1=document.forms["register_form"]["password"].value;
    var hao = document.getElementById("id");
    var mima = document.getElementById("password");
    if(Number0==null||Number0==""){
        alert("请输入账号！");
        return false;
    }
    var regex3 = /^[1-9](\d){5,10}$/;
    if (!regex3.test(hao.value)){
        alert("账号不符合规定");
        hao.focus()
        hao.value="";
        return false;
    }
    if (p1==null||p1==""){
        alert("请输入密码！");
        return false;
    }
    var rege= /(?!^\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]{4,23}/;
    if (!rege.test(mima.value)){
        alert("密码不符合规定");
        mima.focus()
        mima.value="";
        return false;
    }
}