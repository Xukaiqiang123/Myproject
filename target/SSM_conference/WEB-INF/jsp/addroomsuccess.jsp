<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" charset="UTF-8" src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
</head>

<script type="text/javascript">
    $(function(){
        var wait= 3;
        time(wait);
    });
    function time(wait) {
        $("#time").html("<font color='red'>"+wait+"</font>");
        wait--;
        setTimeout(function() {
                if (wait == 0) {
                    delayedRedirect();
                }
                time(wait);
            },
            1000);
    }
    function delayedRedirect(){
        window.location= "../room/meetingroom";
    }
</script>
<br>
<h1>保存成功</h1>
操作完成，<span id="time"></span>s后返回上一页面。
</br>
<a href="../room/meetingroom">点这里手动返回</a>
</body>
</html>
