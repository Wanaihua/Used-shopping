<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.gx.domain.User"%>
<%@ page import="com.gx.dao.Link"%>
<%@ page import="com.gx.domain.message" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath %>">
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>二手网，二货尽在此处！</title>
    <link rel="stylesheet" type="text/css" href="css/homepage.css">
    <link rel="stylesheet" href="css/table.css">
    <style type="text/css">
        .page-input{
            width:40px;
            height: 20px;
            line-height: 20px;
            padding-left: 5px;
            border-radius: 5px;
            border:1px solid #ccc;
            outline: none;
        }
        .page-btn{
            width:40px;
            height: 28px;
            line-height: 20px;
            padding-left: 5px;
            border-radius: 5px;
            border: none;
            color:#fff;
            background: #0080ff;
        }
    </style>
</head>
<body>
<%
    int ToId=Integer.parseInt(request.getParameter("useid"));
%>
<jsp:include page="topbar_1.jsp">
    <jsp:param name="useid" value="<%=ToId%>"/>
</jsp:include>

<div id="headerWrap">
    <div id="homeWrap" class="wrapper">

        <ul class="navcon" id="nav" style="margin-top:20px">
            <li id="homeNav" class="navBg fl">
                <a class="navWit" href="/" target="_self">首页</a>
            </li>
        </ul>
    </div>
</div>
<div>
    <%
        response.setContentType("text/html;charset=UTF-8");
        Link l=new Link();
        List<User> list = l.findUserMessage(ToId,request);
        request.setAttribute("list", list);
    %>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666" class="show">
        <tr>
            <th class="tb1_td3">用户</th>
        </tr>
        <%
            // 获取图书信息集合
            List<User> list1 = (List<User>) request.getAttribute("list");
            // 判断集合是否有效
            if (list1 == null || list1.size() < 1) {
                out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>暂无用户信息</td></tr>");
            } else {
                // 遍历图书集合中的数据
                for (User user : list1) {
        %>
        <tr align="center">
            <td bgcolor="#FFFFFF"><%=user.getNname()%></td>
            <td bgcolor="#FFFFFF"><form name="form1" id="form1" action="/account/talk" method="post" onsubmit="return check(this);">
                <input type="hidden" value="<%=user.getNname()%>" name="name">
                <input type="hidden" value="<%=user.getId()%>" name="ToId">
                <input type="hidden" value="<%=ToId%>" name="FromId" id="FromId">
                <input type="submit" value="交流" class="hover">
            </form>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
</div>
</body>
</html>