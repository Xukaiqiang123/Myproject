function goto() {
    var sendto = document.forms["create_form"]["sendto"].value;
    var emailname = document.forms["create_form"]["emailname"].value;
    var emailcontent = document.forms["create_form"]["emailcontent"].value;
    var sendto1 = document.forms["create_form"]["sendto"];
    alert("ddd");
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