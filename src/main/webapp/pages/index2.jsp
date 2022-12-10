<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath %>">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	int id=(Integer)request.getAttribute("useid");
	int yes=Integer.parseInt(request.getAttribute("yes").toString());
%>
<body>
<jsp:forward page="${pageContext.request.contextPath}/pages/seeuser.jsp">
	<jsp:param value="<%=id %>" name="useid"/>
	<jsp:param name="yes" value="<%=yes%>"/>
</jsp:forward>
</body>
</html>