<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" charset="UTF-8" src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
    <script type="text/javascript">
        $(function(){
            var deletesign='${deletesign}';
            var updatesign='${updatesign}';
            if (deletesign == 1)
            {
                document.getElementById('delete').style.display="block";
            }
            if (updatesign == 1)
            {
                document.getElementById('update').style.display="block";
            }
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
            window.location= "../user/alluser";
        }
    </script>
</head>
<body>
<h1 id = "delete" style="display: none">删除成功</h1>
<h1 id = "update" style="display: none">修改成功</h1>
操作完成，<span id="time"></span>s后返回上一页面。
<a href="../user/alluser">点这里手动返回</a>
</body>
</html>