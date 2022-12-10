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
<title>二手网，你要的二货在此！</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/topbar.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

</head>
<body marginwidth="0" marginheight="0">
<input type="hidden" id="uuname" />
	<div id="commonTopbar" class="commonTopbar">
   <div id="commonTopbar_welcome" class="bar_left" style="margin-left:50px">
     <label>欢迎来到二手网！</label> 
   </div>
   <div class="bar_right" style="position:relative;margin-right:50px" id="info">
        <div id="commonTopbar_login">
           <a href="${pageContext.request.contextPath}/pages/user_login.jsp">登录
           </a>
           <span class="gap">|</span>
           <a href="${pageContext.request.contextPath}/pages/user_register.jsp">注册
           </a> 
        </div>     
        <div class="post_order">
           <a href="${pageContext.request.contextPath}/pages/fabu_1.jsp" >发布商品
           </a>
        </div>        
   </div> 
  
</div>
</body>
<script type="text/javascript">
	
	var uuname=$("#uuname").val();
	if(uuname!=null&&uuname!=""){
		$("#commonTopbar_login").hide();
		temp='<span style="color:#00A33B">欢迎：<strong>'+uuname+' </strong> 登录本系统！</span>';
		$("#info").append(temp);
	}
</script>
</html>