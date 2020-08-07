function edit_room(node) {//根据图书id跳转到图书详情页
    var a=node.parentNode.parentNode;
    var room_id=a.cells[0].innerText;
    window.location.href="../updateroom.jsp?room_id="+room_id;
}

function delete_room(node){//打开删除弹窗
    var a = node.parentNode.parentNode;
    var roomid=a.cells[0].innerText;
    alert(roomid);
    document.getElementById("roomid").value=roomid;//获取图书id
    document.getElementById("delete_wrap").style.display="block";//显示弹窗
}
function close_delete(){//关闭弹窗
    document.getElementById("delete_wrap").style.display="none";//关闭弹窗
}
function confirm_delete(){//确认删除
    var roomid=document.getElementById("roomid").value;
    alert("this book was deleted");
}
function select() {
    document.getElementById('div1').style.display="none";
    document.getElementById('div2').style.display="block";
    document.getElementById('username').focus();
}
function quxiao() {
    document.getElementById('div1').style.display="block";
    document.getElementById('div2').style.display="none";
}
function checkuser() {
    var username= document.getElementById("username");
    var xhr=new XMLHttpRequest();//1.创建异步交互对象
    // alert(xhr);
    xhr.onreadystatechange=function () {//2.设置监听
        if (xhr.readyState==4){
            if (xhr.status==200){//5.回调函数
                document.getElementById("span1").innerText=xhr.responseText;//将回传值显示
            }
        }
    }
    xhr.open("GET","../user/findByposition2?username="+username.value,true); //3.打开连接
    xhr.send(null);//4.发送
    // xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");//设置请求头

}
function go_to() {
    var username = document.forms["create_form"]["username"].value;
    var room_id = document.forms["create_form"]["room_id"].value;
    var room_name = document.forms["create_form"]["room_name"].value;
    var room_place= document.forms["create_form"]["room_place"].value;
    var room_number = document.forms["create_form"]["room_number"].value;
    var room_id1 = document.forms["create_form"]["room_id"];
    var room_number1 = document.forms["create_form"]["room_number"];

    if (username == null || username == "") {
        alert("请输入创建人！");
        return false;
    }
    if (room_id == null || room_id == "") {
        alert("请输入会议室序号！");
        return false;
    }
    if (room_name == null || room_name == "") {
        alert("请输入会议室名称！");
        return false;
    }
    if (room_place == null || room_place == "") {
        alert("请输入会议室地点！");
        return false;
    }
    if (room_number == null || room_number == "") {
        alert("请输入会议室容纳人数！");
        return false;
    }
    var room_id2 = /^[0-9]*$/;
    if (!room_id2.test(room_id1.value)) {
        alert("会议室编号不符合规定(仅限数字)");
        document.forms["create_form"]["room_id"].focus();
        return false;
    }
    var room_number0 = /^[0-9]*$/;
    if (!room_number0.test(room_number1.value)) {
        alert("容纳人数不符合规定(仅限数字)");
        document.forms["create_form"]["room_number"].focus();
        return false;
    }
}