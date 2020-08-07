
function edit_user(node) {//根据图书id跳转到图书详情页
    var a=node.parentNode.parentNode;
    var id=a.cells[0].innerText;
    window.location.href="../updateusers.jsp?id="+id;
}
function delete_user(node){//打开删除弹窗
    var a = node.parentNode.parentNode;
    var id=a.cells[0].innerText;
    document.getElementById("id").value=id;//获取图书id
    document.getElementById("delete_wrap").style.display="block";//显示弹窗
}
function close_delete(){//关闭弹窗
    document.getElementById("delete_wrap").style.display="none";//关闭弹窗
}
function confirm_delete(){//确认删除
    var id=document.getElementById("id").value;
    alert("用户已删除!");
}