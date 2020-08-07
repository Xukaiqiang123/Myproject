function checkuser(){
    var id=document.getElementById("user.id");
    var xhr=new XMLHttpRequest();//1.创建异步交互对象
    // alert(xhr);
    alert(id.value);
    alert(xhr);
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