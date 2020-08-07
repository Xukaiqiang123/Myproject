<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Title</title>
    <script type="text/javascript" charset="UTF-8" src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" src="<c:url value='/js/My97DatePicker/WdatePicker.js'/>"></script>
    <script type="text/javascript" charset="UTF-8" src="<c:url value='/js/loginsuccess.js'/>"></script>
    <style>
        <%@include file="../../css/frist.css"%>
    </style>
    <script type="text/javascript" charset="UTF-8" >
        <%@include file="../../js/loginsuccess2.js"%>
        function checkuse() {//根据图书id跳转到图书详情页
            var room_id=document.getElementById('room_id').value;
            $.ajax({
                method: 'POST',
                url: "../room/checkroomuse?room_id="+room_id,
                async:false,
                dateType: 'JSON',
                success: function (dat) {
                    var s = dat;
                    if (1 == s) {
                        alert("检查成功，结果为：已占用");
                    } else {
                        alert("检查成功，结果为：未占用");
                    }
                },
                error:function (data) {
                    alert("检查出错");
                }
            });
        }
    </script>

</head>
<body class="beijing">
<section class="left" style="z-index: 1">
    <img id="biaozhi" src="../images/huiyi.jpg">
    <div id="nav">
        <ul>
          <li> <a style="z-index:620" href="../user/myaccount">账号管理</a></li> <br/>
            <% int i = (int) session.getAttribute("powersign");
                if (i == 0){
                    out.print(" <li style='display:none'</li>");
                    out.print(" <li style='display:none'></li>");
                    out.print(" <li style='display:none'></li>");
                }
                else {
                    out.print(" <li ><a style='z-index: 620' href='../conference/allconferences'>会议管理</a></li><br/>");
                    out.print(" <li ><a style='z-index: 620' href='../room/meetingroom'>会议室管理</a></li><br/>");
                    out.print(" <li ><a style='z-index: 620' href='../user/alluser'>用户管理</a></li><br/>");
                }
            %>
            <li><a style="z-index:620" href="/SSM_conference_war/announcement.jsp">通告管理</a></li> <br/>
            <li><a style="z-index:620" href="/SSM_conference_war/meetingphoto.jsp">会议分析</a></li>
        </ul>
    </div>
</section>
<div class="right">
    <div class="right_top">
        <ul class="n">
            <li class="selected"><a href="#" id="dao1"><img id = "dao2" src="../images/shou.png"><br/>首页</a></li>
            <li><a href="../conference/lookconference" id="dao"><img src="../images/wode.png"><br/>我的会议</a></li>
            <li><a href="#" id="dao"><img src="../images/chuang.png"><br/>创建会议</a></li>
            <li><a href="../conference/afterconference" id="dao"><img src="../images/jishi.png"><br/>历史会议</a></li>
            <li><a href="../conference/cometimeconference" id="dao"><img src="../images/lishi.png"><br/>即时会议</a></li>
            <li><a href="../conference/allconference" id="dao"><img src="../images/sousu.png"><br/>会议搜索</a></li>
        </ul>
        <div class="right_top_left">  <a id="tuichu" href="/SSM_conference_war/lagout.jsp"><img src="../images/tuichu.jpg">退出</a>
        </div>
        <div class="right_top_right">
            <img id="user" src="../images/user.jpg"><br/><a href="../user/myaccount" id="name"><%=session.getAttribute("username")%></a>
        </div>
    </div>

    <div class="right_bottom">
        <div class="list" id="div0"><img style="height: 100%;width: 100%" src="../images/huiyi0.jpg">
        </div>
        <div class="list" id="div1"style="display: none">
            </br></br></br>
            <center>
                <strong style="font-size: 25px;text-align: center">我的会议</strong>
                <div class="book_list">
                    <table class="look1" >
                        <tr id="begin">
                            <th style="width: 90px">会议号</th>
                            <th >会议主题</th>
                            <th >参与人数</th>
                            <th >会议室</th>
                            <th >会议内容</th>
                            <th >会议类型</th>
                            <th >开始时间</th>
                            <th >结束时间</th>
                            <th >会议状态</th>
                            <th >操作</th>
                        </tr>
                        <c:forEach items="${pageInfo.list}" var="conference">
                            <tr id = "become">
                                <td>${conference.conference_id}</td>
                                <td>${conference.conference_name}</td>
                                <td>${conference.conference_people}</td>
                                <td>${conference.room_id}</td>
                                <td>${conference.content}</td>
                                <td>${conference.conference_style}</td>
                                <td>${conference.starttime}</td>
                                <td>${conference.endtime}</td>
                                <td>${conference.conference_state}</td>
                                <td>
                                    <button class="editmy" onclick="edit_myconference(this)">编辑</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

                <div><p>当前 ${pageInfo.pageNum }页,
                    总${pageInfo.pages }页,
                    总${pageInfo.total }条记录
                </div></p>
                <a href="lookconference?pageNo=${pageInfo.firstPage}">第一页</a>

                <c:if test="${pageInfo.hasPreviousPage }">
                <a href="lookconference?pageNo=${pageInfo.pageNum-1}">上一页</a>
                </c:if>
                <c:if test="${pageInfo.hasNextPage }">
                <a href="lookconference?pageNo=${pageInfo.pageNum+1}">下一页</a>
                </c:if>

                <a href="lookconference?pageNo=${pageInfo.lastPage}">最后页</a>
        </center>
        </div>
        <div class="list" id="div2" style="display: none">
            </br></br></br>
            <center>
            <strong style="font-size: 25px;text-align: center">创建会议</strong>
            <div class="book_list">
                <form name="create_form"  onsubmit="return go_to()" action="../conference/addconference" method="POST">
                <div class="create" style="background-color:honeydew;width: 600px;height:510px;border-radius:10px;border:bisque 5px solid;">
                    </br>
                    <label style="width: 100px">发起人</label>
                        <input type="text" style="width:150px;" id="username" name="username" autofocus="autofocus" value="<%=session.getAttribute("username")%>" onblur="checkuser()"/>
                        </br><span id="span1" style="font-size: 14px;color: green;margin-left: 50px"></span>
                    </br>
                        <label style="width: 100px">会议主题</label>
                        <input type="text" id="conference_name" name="conference_name"/>
                    </br>
                    </br>
                        <label style="width: 100px">参与人数</label>
                        <input type="text" id="conference_people" name="conference_people"/>
                    </br>
                    </br>
                        <label style="width: 100px;margin-left: 15px">会议状态</label>
                        <input type="text" id="conference_state" name="conference_state" readonly="true" value="未开始"/>
                    </br>
                    </br>
                    <label style="width: 100px;">会议类型</label>
                    <select type="text" id="conference_style" name="conference_style" style="width:150px"/>
                        <option value="例会">例会</option>
                        <option value="全体会">全体会议</option>
                        <option value="紧急会">紧急会</option>
                        <option value="其他">其他</option>
                    </select>
                    </br>
                    </br>
                        <label style="width: 100px">开始时间</label>
                        <input type="text" id="starttime" name="starttime" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00'})"/>
                    </br>
                    </br>
                        <label style="width: 100px">结束时间</label>
                        <input type="text" id="endtime" name="endtime" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00'})"/>
                    </br>
                    </br>
                        <label style="width: 100px;margin-left: 15px">会议室</label>
                        <input type="text" id="room_id" name="room_id" onblur="checkuse()"/>
                    </br>
                    </br>
                        <label style="width: 100px">会议内容</label>
                        <textarea rows="3" cols="20" id="content" name="content" style="resize:none;width:150px">
                        </textarea>
                    </br>
                    </br>
                        <label style="width: 100px">发送方式:</label>
                        <input type="radio" name="sendway" id="sendway2" value="邮箱">邮箱
                    </br>
                    </br>
                </div>
                    <input id="submit" type="submit" name='submit' value="提交">
                </form>
            </div>
            </center>
        </div>
        <div class="list" id="div3" style="display: none">  </br></br></br>
            <center>
                <strong style="font-size: 25px;text-align: center">历史会议</strong>
                <style>
                    .look2{
                        width:990px;
                        border:1px solid black;
                    }
                    #begin1{
                        background-color: #C5E1E4;
                    }
                    #become1{
                        background-color: white;
                        border:2px dotted black;
                    }
                    #become1:hover {
                        background: #cc0;
                    }
                </style>
                <div class="book_list">
                    <table class="look2">
                    <button>  <tr id="begin1">
                            <th style="width: 100px">会议号</th>
                            <th style="width: 100px">会议主题</th>
                            <th style="width: 100px">创建人</th>
                            <th style="width: 100px">参与人数</th>
                            <th style="width: 100px">会议室</th>
                            <th style="width: 100px">会议内容</th>
                            <th style="width: 100px">会议类型</th>
                            <th style="width: 100px">开始时间</th>
                            <th style="width: 100px">结束时间</th>
                            <th style="width: 100px">发送方式</th>
                        </tr></button>
                        <c:forEach items="${pageInfo.list}" var="conference">
                            <tr id="become1">
                                <td>${conference.conference_id}</td>
                                <td>${conference.conference_name}</td>
                                <td>${conference.user_id}</td>
                                <td>${conference.conference_people}</td>
                                <td>${conference.room_id}</td>
                                <td>${conference.content}</td>
                                <td>${conference.conference_style}</td>
                                <td>${conference.starttime}</td>
                                <td>${conference.endtime}</td>
                                <td>${conference.sendway}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div>
                    <p>当前 ${pageInfo.pageNum }页,
                        总${pageInfo.pages }页,
                        总${pageInfo.total }条记录
                </div></p>
                <a href="afterconference?pageNo=${pageInfo.firstPage}">第一页</a>

                <c:if test="${pageInfo.hasPreviousPage }">
                    <a href="afterconference?pageNo=${pageInfo.pageNum-1}">上一页</a>
                </c:if>
                <c:if test="${pageInfo.hasNextPage }">
                    <a href="afterconference?pageNo=${pageInfo.pageNum+1}">下一页</a>
                </c:if>

                <a href="afterconference?pageNo=${pageInfo.lastPage}">最后页</a>
            </center>
        </div>
        <div class="list" id="div4" style="display: none"> </br></br></br>
            <center>
            <strong style="font-size: 25px;text-align: center">即时会议</strong>
            <div class="book_list">
                <table class="look1">
                    <tr id="begin">
                        <th style="width: 100px">会议号</th>
                        <th style="width: 100px">会议主题</th>
                        <th style="width: 100px">创建人</th>
                        <th style="width: 100px">参与人数</th>
                        <th style="width: 100px">会议室</th>
                        <th style="width: 100px">会议内容</th>
                        <th style="width: 100px">会议类型</th>
                        <th style="width: 100px">开始时间</th>
                        <th style="width: 100px">结束时间</th>
                        <th style="width: 100px">发送方式</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="conference">
                        <tr id="become">
                            <td>${conference.conference_id}</td>
                            <td>${conference.conference_name}</td>
                            <td>${conference.user_id}</td>
                            <td>${conference.conference_people}</td>
                            <td>${conference.room_id}</td>
                            <td>${conference.content}</td>
                            <td>${conference.conference_style}</td>
                            <td>${conference.starttime}</td>
                            <td>${conference.endtime}</td>
                            <td>${conference.sendway}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div><p>当前 ${pageInfo.pageNum }页,
                总${pageInfo.pages }
                页,
                总${pageInfo.total }条记录
            </div></p>
            <a href="cometimeconference?pageNo=${pageInfo.firstPage}">第一页</a>

            <c:if test="${pageInfo.hasPreviousPage }">
                <a href="cometimeconference?pageNo=${pageInfo.pageNum-1}">上一页</a>
            </c:if>
            <c:if test="${pageInfo.hasNextPage }">
                <a href="cometimeconference?pageNo=${pageInfo.pageNum+1}">下一页</a>
            </c:if>

            <a href="cometimeconference?pageNo=${pageInfo.lastPage}">最后页</a>
        </center>
        </div>
        <div class="list" id="div5" style="display: none">
            <center>
                <div style="width: 100%;height: 120px;background-color: whitesmoke">
                    <div style="float: left;width: 330px; height: 120px;background-color: #5eb95e">
                        </br><form name="check_form1" onsubmit="return go_to1()" action="../conference/byroom">
                        <b>会议室查询</b></br>
                        <input style="width: 330px;font-size: 16px" type="text" placeholder="请输入会议室序号" name="room_id"></br>
                        <input id="submit1" style="font-size: 18px" type="submit" name='submit' value="查询"></form>
                    </div>
                    <div style="width: 330px;height: 120px;background-color: #2aabd2">
                        </br><form name="check_form2" onsubmit="return go_to2()" action="../conference/byname">
                        <b>会议名称查询</b></br>
                        <input style="width: 330px;font-size: 16px" type="text" placeholder="请输入会议名称" name="conference_name"></br>
                        <input id="submit2" style="font-size: 18px" type="submit" name='submit' value="查询"></form>
                    </div>
                    <div style="float:right;margin-top:-120px;width: 330px;height: 120px;background-color:#5eb95e">
                        </br><form name="check_form3" onsubmit="return go_to3()" action="../conference/byusername">
                        <b>创建人查询</b></br>
                        <input style="width: 330px;font-size: 16px" type="text" placeholder="请输入创建人账号" name="user_id"></br>
                        <input id="submit3"  style="font-size: 18px" type="submit" name='submit' value="查询"></form>
                    </div>
                </div>
            </br></br>
            <strong style="font-size: 25px;text-align: center">全部会议</strong>
            <div class="book_list">
                <table class="look1" >
                    <tr id="begin">
                        <th style="width: 100px">会议号</th>
                        <th style="width: 100px">会议主题</th>
                        <th style="width: 100px">创建人</th>
                        <th style="width: 100px">参与人数</th>
                        <th style="width: 100px">会议室</th>
                        <th style="width: 100px">会议内容</th>
                        <th style="width: 100px">会议类型</th>
                        <th style="width: 100px">开始时间</th>
                        <th style="width: 100px">结束时间</th>
                        <th style="width: 100px">会议状态</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="conference">
                        <tr id = "become">
                            <td>${conference.conference_id}</td>
                            <td>${conference.conference_name}</td>
                            <td>${conference.user_id}</td>
                            <td>${conference.conference_people}</td>
                            <td>${conference.room_id}</td>
                            <td>${conference.content}</td>
                            <td>${conference.conference_style}</td>
                            <td>${conference.starttime}</td>
                            <td>${conference.endtime}</td>
                            <td>${conference.conference_state}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div><p>当前 ${pageInfo.pageNum }页,
                总${pageInfo.pages }页,
                总${pageInfo.total }条记录
            </div></p>
            <a href="allconference?pageNo=${pageInfo.firstPage}">第一页</a>

            <c:if test="${pageInfo.hasPreviousPage }">
                <a href="allconference?pageNo=${pageInfo.pageNum-1}">上一页</a>
            </c:if>
            <c:if test="${pageInfo.hasNextPage }">
                <a href="allconference?pageNo=${pageInfo.pageNum+1}">下一页</a>
            </c:if>

            <a href="allconference?pageNo=${pageInfo.lastPage}">最后页</a>
        </center>
        </div>
    </div>
    <div class ="finally">
        2020烟台大学计算机与控制工程学院</br>
        设计师：163-2 徐凯强
    </div>
</div>
</body></html>
