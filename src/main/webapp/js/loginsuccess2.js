$(function(){
    var sign='${sign}';
    var addsign='${addconferencesign}';
    $(".n li").click(function(){
        var divShow = $(".right_bottom").children('.list');
        if (!$(this).hasClass('selected')) {
            var index = $(this).index();
            $(this).addClass('selected').siblings('li').removeClass('selected');
            $(divShow[index]).show();
            $(divShow[index]).siblings('.list').hide();
        }
        if($(".div2").show()){
            document.getElementById('username').focus();
            if(addsign==1){
                alert("SUCCESS");
            }
        }
    });
    function selectl() {
        sign = 0;
    }
    if (sign == 0)
    {
        document.getElementById('div0').style.display="block";
        document.getElementById('div1').style.display="none";
        document.getElementById('div2').style.display="none";
        document.getElementById('div3').style.display="none";
        document.getElementById('div4').style.display="none";
        document.getElementById('div5').style.display="none";
    }
    if (sign == 1)
    {
        document.getElementById('div0').style.display="none";
        document.getElementById('div1').style.display="block";
        document.getElementById('div2').style.display="none";
        document.getElementById('div3').style.display="none";
        document.getElementById('div4').style.display="none";
        document.getElementById('div5').style.display="none";
    }
    if (sign == 2)
    {
        document.getElementById('div0').style.display="none";
        document.getElementById('div1').style.display="none";
        document.getElementById('div2').style.display="block";
        document.getElementById('div3').style.display="none";
        document.getElementById('div4').style.display="none";
        document.getElementById('div5').style.display="none";
    }
    if (sign == 3)
    {
        document.getElementById('div0').style.display="none";
        document.getElementById('div1').style.display="none";
        document.getElementById('div2').style.display="none";
        document.getElementById('div3').style.display="block";
        document.getElementById('div4').style.display="none";
        document.getElementById('div5').style.display="none";
    }
    if (sign == 4)
    {
        document.getElementById('div0').style.display="none";
        document.getElementById('div1').style.display="none";
        document.getElementById('div2').style.display="none";
        document.getElementById('div3').style.display="none";
        document.getElementById('div4').style.display="block";
        document.getElementById('div5').style.display="none";
    }
    if (sign == 5)
    {
        document.getElementById('div0').style.display="none";
        document.getElementById('div1').style.display="none";
        document.getElementById('div2').style.display="none";
        document.getElementById('div3').style.display="none";
        document.getElementById('div4').style.display="none";
        document.getElementById('div5').style.display="block";
    }
    if(document.getElementById('div2').style.display=="block"){
        document.getElementById('username').focus();
        if(addsign==1){
            alert("SUCCESS");
        }
    }
});
function checkuser(){
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
    xhr.open("GET","../user/findByposition?username="+username.value,true); //3.打开连接
    xhr.send(null);//4.发送
    // xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");//设置请求头

}
function edit_myconference(node) {//根据图书id跳转到图书详情页
    var a=node.parentNode.parentNode;
    var conference_id=a.cells[0].innerText;
    window.location.href="../updateconferences.jsp?conference_id="+conference_id;
}