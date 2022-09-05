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
<script>
	<%
		int id=Integer.parseInt(request.getAttribute("useid").toString());
	%>
	if(confirm("发布成功!!!")){
		window.location.href="${pageContext.request.contextPath}/pages/fabu.jsp?id=<%=id %>";
	}else{
		response.sendRedirect("${pageContext.request.contextPath}/pages/index.jsp");
	}
		</script>
<body>
</body>
</html>