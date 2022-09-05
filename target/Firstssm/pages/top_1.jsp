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
<link rel="stylesheet" type="text/css" href="/css/style.css" />
</head>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");	
	int uid=0;
	User userLoginInfo=(User)request.getSession().getAttribute("id");
	if(userLoginInfo==null){
		%><script>
		if(confirm("您尚未登录。是否现在去登录？")){
			window.location.href="/pages/user_login.jsp";
		}else{
			response.sendRedirect("/pages/index.jsp");
		}</script><%
	}else{
		response.sendRedirect("/pages/index.jsp");
	}
%>
<body marginwidth="0" marginheight="0">
	<header>
		 <h1><img src="../image/logo-m.png"/></h1>
		 <ul class="rt_nav">
			  <%-- <li><a href="index_top?uid=<%=uid %>.jsp" target="_blank" class="website_icon">首页</a></li> --%>
			  <li><a href="/pages/mygoods.jsp?uid=<%=uid %>" class="admin_icon">我的商品</a></li>
  			  <li><a href="/pages/myself.jsp?uid=<%=uid %>" class="set_icon">个人信息</a></li>
			  <li><a href="/pages/index.jsp" class="quit_icon">退出账号</a></li>
		 </ul>
	</header>
</body>
</html>