
function edit_conference(node) {//根据图书id跳转到图书详情页
    var a=node.parentNode.parentNode;
    var conference_id=a.cells[0].innerText;
    window.location.href="../updateconferences.jsp?conference_id="+conference_id;
}
function delete_conference(node){//打开删除弹窗
    var a = node.parentNode.parentNode;
    var conference_id=a.cells[0].innerText;
    document.getElementById("conference_id").value=conference_id;//获取id
    document.getElementById("delete_wrap").style.display="block";//显示弹窗
}
function close_delete(){//关闭弹窗
    document.getElementById("delete_wrap").style.display="none";//关闭弹窗
}
function confirm_delete(){//确认删除
    var id=document.getElementById("id").value;
    alert("会议已删除!");
}