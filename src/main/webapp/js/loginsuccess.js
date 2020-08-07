
function go_to() {
    var username = document.forms["create_form"]["username"].value;
    var conference_name = document.forms["create_form"]["conference_name"].value;
    var conference_people = document.forms["create_form"]["conference_people"].value;
    var conference_people1= document.forms["create_form"]["conference_people"];
    var room_id = document.forms["create_form"]["room_id"].value;
    var room_id1 = document.forms["create_form"]["room_id"];
    var starttime = document.forms["create_form"]["starttime"].value;
    var endtime = document.forms["create_form"]["endtime"].value;
    var sendway1 = document.forms["create_form"]["sendway1"];
    var sendway2 = document.forms["create_form"]["sendway2"];
    if (username == null || username == "") {
        alert("请输入创建人！");
        return false;
    }
    if (conference_name == null || conference_name == "") {
        alert("请输入会议主题名称！");
        return false;
    }
    if (conference_people == null || conference_people == "") {
        alert("请输入参加会议人数！");
        return false;
    }
    if (room_id == null || room_id == "") {
        alert("请输入会议室序号！");
        return false;
    }
    if (starttime == null || starttime == "") {
        alert("请输入会议开始时间！");
        return false;
    }
    if (endtime == null || endtime == "") {
        alert("请输入会议结束时间！");
        return false;
    }
    var room_id2 = /^[0-9]*$/;
    if (!room_id2.test(room_id1.value)) {
        alert("序号不符合规定(仅限数字)");
        document.forms["create_form"]["room_id"].focus();
        return false;
    }
    var conference_people0 = /^[0-9]*$/;
    if (!conference_people0.test(conference_people1.value)) {
        alert("序号不符合规定(仅限数字)");
        document.forms["create_form"]["conference_people"].focus();
        return false;
    }
    if(sendway1.checked()){
        sendway2.attr("disabled","disabled");
    }
    if(sendway2.checked()){
        sendway1.attr("disabled","disabled");
    }
}
function go_to1() {
    var room_id = document.forms["check_form1"]["room_id"];
    if (room_id == null || room_id == "") {
        alert("请输入会议室序号！");
        return false;
    }
    var room_id0 = /^[0-9]*$/;
    if (!room_id0.test(room_id.value)) {
        alert("序号不符合规定(仅限数字)");
        document.forms["check_form1"]["room_id"].focus();
        return false;
    }
}

function go_to2() {
    var conference_name = document.forms["check_form2"]["conference_name"].value;
    if (conference_name == null || conference_name == "") {
        alert("请输入会议名称！");
        return false;
    }
}

function go_to3() {
    var user_id = document.forms["check_form3"]["user_id"];
    if (user_id == null || user_id == "") {
        alert("请输入创建人账号！");
        return false;
    }
    var user_id0 = /^[0-9]*$/;
    if (!user_id0.test(user_id.value)) {
        alert("账号不符合规定(仅限数字)");
        document.forms["check_form3"]["user_id"].focus();
        return false;
    }
}

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