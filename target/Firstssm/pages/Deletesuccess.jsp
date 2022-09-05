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
<body>
"成功删除了数据！"<br>
<a href="${pageContext.request.contextPath}/index.jsp">返回</a>
</body>
</html>