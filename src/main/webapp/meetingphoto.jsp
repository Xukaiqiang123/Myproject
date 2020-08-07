<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/gong.css" type="text/css"/>
    <script type="text/javascript" charset="UTF-8" src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="<c:url value='/js/meetingphoto.js'/>"></script>
    <style>
        <%@include file="css/frist.css"%>
        <%@include file="css/meetingphoto.css"%>
    </style>
</head>

<body class="beijing">
<div class="left"><img id="biaozhi" src="images/huiyi.jpg">
    <div id="nav">
        <ul>
            <li><a href="user/myaccount">账号管理</a></li><br/>
            <% int i = (int) session.getAttribute("powersign");
                if (i == 0){
                    out.print(" <li style='display:none'</li>");
                    out.print(" <li style='display:none'></li>");
                    out.print(" <li style='display:none'></li>");
                }
                else {
                    out.print(" <li ><a style='z-index: 620' href='conference/allconferences'>会议管理</a></li><br/>");
                    out.print(" <li ><a style='z-index: 620' href='room/meetingroom'>会议室管理</a></li><br/>");
                    out.print(" <li ><a style='z-index: 620' href='user/alluser'>用户管理</a></li><br/>");
                }
            %>
            <li><a href="announcement.jsp">通告管理</a></li><br/>
            <li><a href="meetingphoto.jsp">会议分析</a></li>
        </ul>
    </div>
</div>
<div class="right">
    <div class="right_top">
        <ul class="n">
            <li class="selected"><img src="images/shou.png"><br/><a id="dao" href="user/loginsuccess">首页</a></li>
            <li class="selected"><img src="images/shou.png"><br/><a id="dao" href="javascript:photo2();">饼状图</a></li>
        </ul>

        <div class="right_top_left">  <a id="tuichu" href="../lagout.jsp"><img src="images/tuichu.jpg">退出</a>
        </div>
        <div class="right_top_right">
            <img id="user" src="images/user.jpg"><br/><a href="user/myaccount" id="name"><%=session.getAttribute("username")%></a>
        </div>
    </div>
    <div class="right_bottom0">
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
        <div class="list" id="div2" style="display: block">
            <div class = "top">
                <div style=" height: 120px;background-color: #5eb95e">
                    </br>
                    <b>会议查询</b></br>
                    <input style="width: 300px;font-size: 16px" type="text" placeholder="请输入年份" name="year" id = "year"></br>
                    <button id="submit1" style="font-size: 18px" type="submit" value="查询" onclick="photo()">查询</button>

               </div>
            </div>
            <div class="bottom">
                <div id="main" style="width: 800px;height:400px;background-color: wheat;display: none">
                </div>
                <div id="main_hover" style="width: 800px;height:400px;background-color: wheat;display: block">
                </div>
            </div>
            <script>
                function photo2() {
                    var serData1 =new Array(4);
                    document.getElementById("div2").style.display = "none";
                    document.getElementById("div3").style.display = "block";
                    document.getElementById("main2_hover").style.display = "block";
                    var myChart2 = echarts.init(document.getElementById('main2_hover'));
                    $.ajax({
                        method: 'POST',
                        url: "style/selectstyle",
                        async:false,
                        dateType: 'JSON',
                        success: function (data) {
                            var map = jQuery.parseJSON(data);
                            serData1 = map.count;
                            myChart2.setOption({
                                series : [
                                    {
                                        name: '访问来源',
                                        type: 'pie',    // 设置图表类型为饼图
                                        radius: '55%',  // 饼图的半径，外半径为可视区尺寸（容器高宽中较小一项）的 55% 长度。
                                        label: {
                                            normal: {
                                                show: true,
                                                formatter: '{b}: {c}次({d}%)' //自定义显示格式(b:name, c:value, d:百分比)
                                            }
                                        },
                                        data:[          // 数据数组，name 为数据项名称，value 为数据项值
                                            {value:serData1[0], name:'全体会议'},
                                            {value:serData1[1], name:'例会'},
                                            {value:serData1[2], name:'紧急会议'},
                                            {value:serData1[3], name:'其他'}
                                        ]
                                    }
                                ]
                            })
                        },
                        error:function (data) {
                            alert("图标加载失败！");
                        }
                    });
                }
            </script>
    </div>
        <div class="list" id="div3" style="display: none">
            <div class = "top">
                <b style="font-size: 25px">会议类型分布展示</b>
            </div>
            <div class="bottom">
                <div id="main2_hover" style="width: 800px;height:400px;background-color: wheat;display: none">
                </div>
            </div>
        </div>
    </div>
    <div class ="finally">
        2020烟台大学计算机与控制工程学院</br>
        设计师：163-2 徐凯强
    </div>
</div>
</body>
</html>
