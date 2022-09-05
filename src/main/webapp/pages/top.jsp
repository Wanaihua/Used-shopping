<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.gx.domain.User" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath %>">
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>校园二手交易网</title>
<link rel="stylesheet" type="text/css" href="css/style1.css" />
</head>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
%>
<body marginwidth="0" marginheight="0">
	<header>
		 <h1><img src="image/logo-m.png"/></h1>
		 <ul class="rt_nav">
			  <%-- <li><a href="index_top.jsp?id=<%=id %>" target="_blank" class="website_icon">首页</a></li> --%>
			  <li><a href="pages/mygoods.jsp?useid=<%=id %>" class="admin_icon">我的商品</a></li>
  			  <li><a href="pages/myself.jsp?id=<%=id %>" class="set_icon">个人信息</a></li>
			  <li><a href="pages/index.jsp" class="quit_icon">退出账号</a></li>
		 </ul>
	</header>
</body>
</html>