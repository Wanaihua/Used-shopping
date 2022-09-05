<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath %>">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	int useid=(Integer)request.getAttribute("useid");
%>
<body>
<jsp:forward page="${pageContext.request.contextPath}/pages/index_button.jsp">
<jsp:param value="<%=useid %>" name="useid"/>
</jsp:forward>
</body>
</html>