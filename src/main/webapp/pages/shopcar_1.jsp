<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	int id=(Integer)request.getAttribute("useid");

%>
<body>
<jsp:forward page="shopcar.jsp">
<jsp:param value="<%=id %>" name="useid"/>
</jsp:forward>
</body>
</html>