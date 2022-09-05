<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.gx.domain.message" %>
<%@ page import="java.util.List" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath %>">
<%--
  Created by IntelliJ IDEA.
  User: 万爱华
  Date: 2022/4/15
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>交流</title>
    <link type="text/css" rel="stylesheet" href="css/cs.css">
</head>
<body onload="document.body.scrollTop = document.body.scrollHeight">
<%
    int FromId=Integer.parseInt(request.getAttribute("FromId").toString());
    int ToId=Integer.parseInt(request.getAttribute("ToId").toString());
    String name=request.getAttribute("name").toString();
%>
<jsp:include page="topbar_1.jsp">
    <jsp:param name="useid" value="<%=FromId %>" />
</jsp:include>
<div class="main">
    <div class="top">
        <div class="top-left"><%=name%></div>
    </div>
    <div class="box">
        <div class="box-right">
            <div class="recvfrom">
                <div class="news-top" id="ull">
    <ul>
    <%
        List<message> list1 = (List<message>) request.getAttribute("list");
        if (list1 == null || list1.size() < 1) {

        } else {
            for (message mes : list1) {
                if(Integer.parseInt(mes.getFromId())!=FromId){
    %>
    <li class="other">
        <div class="msg">
            <p class="msg-text"><%=mes.getConten()%></p>
            <time><%=mes.getTime()%></time>
        </div>
    </li>
    <%
    }else{
    %>
    <li class="self">
        <div class="msg">
            <p class="msg-text"><%=mes.getConten()%></p>
            <time><%=mes.getTime()%></time>
        </div>
    </li>
    <%
                }
            }
        }%>
    </ul>
                </div>
            </div>
            <div class="sendto">
                <div class="but-text">
                    <form name="from1" id="form1" action="/account/message" method="post">
                        <input name="name" id="name" type="hidden" value="<%=name%>">
                        <input name="FromId" id="FromId" type="hidden" value="<%=FromId%>">
                        <input name="ToId" id="ToId" type="hidden" value="<%=ToId%>">
                        <input name="time" id="time" type="hidden">
                        <textarea name="conten" id="conten" cols="110" rows="6"></textarea>
                        <input type="button" id="add" style="margin-left: 660px;width: 60px;background: #3bb4f2;border-color: #1c75d3c2;" name="发送" value="发送">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" language="javascript">
    function $c(tagname){
        return document.createElement(tagname);
    }
    function getNowTime() {
        var date = new Date();
        //年 getFullYear()：四位数字返回年份
        var year = date.getFullYear();  //getFullYear()代替getYear()
        //月 getMonth()：0 ~ 11
        var month = date.getMonth() + 1;
        //日 getDate()：(1 ~ 31)
        var day = date.getDate();
        //时 getHours()：(0 ~ 23)
        var hour = date.getHours();
        //分 getMinutes()： (0 ~ 59)
        var minute = date.getMinutes();
        //秒 getSeconds()：(0 ~ 59)
        var second = date.getSeconds();

        var time = year + '-' + addZero(month) + '-' + addZero(day) + ' ' + addZero(hour) + ':' + addZero(minute) + ':' + addZero(second);
        return time;
    }

    function addZero(s) {
        return s < 10 ? ('0' + s) : s;
    }
    $(document).ready(function(){
        var mess = document.getElementById('ull');
        mess.scrollTop = mess.scrollHeight;
        $("#add").bind("click",function(){
            var tab=$("#tab");
            var time=getNowTime();
            var conten="<a>"+time+"</a><br/>";
            conten+=document.getElementById("conten").value;
            var tr=$c("tr");
            tab.append(tr);
            var td=$c("td");
            td.innerHTML=conten;
            tr.appendChild(td);
            $("#time").val(time);
            from1.submit();
            mess = document.getElementById('ull');
            mess.scrollTop = mess.scrollHeight;
        });
    });
</script>
</html>
