<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="com.gx.domain.Goods"%>
<%@ page import="com.gx.dao.Link"%>
<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath %>">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="css/homepage.css">
<link rel="stylesheet" href="css/table.css" />
<script type="text/javascript" src="js/jquery.js"></script>
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
	background: #0080FF;
}
</style>
</head>
<%
	response.setContentType("text/html;charset=UTF-8"); 
	int id=Integer.valueOf(request.getParameter("useid"));
    Link l=new Link(); // 实例化BookDao
    List<Goods> list = l.findmyshopcar(id); // 查询所有图书信息
    request.setAttribute("list", list); // 将list放置到request中

 %>
<body>
<jsp:include page="top.jsp">
<jsp:param value="<%=id %>" name="id"/>
</jsp:include>
<div class="div1" style="width: 60%;padding-left: 400px;">
	<table width="60%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666" class="show">
		<tr align="center" style="height: 30px">
			<th class="tb1_td3">商品</th>
			<th class="tb1_td3">商品信息</th>
			<th class="tb1_td3">商品价格</th>
			<th class="tb1_td3">操作</th>
		</tr>
		<%
			// 获取图书信息集合
			List<Goods> list1 = (List<Goods>) request.getAttribute("list");
			// 判断集合是否有效
			if (list1 == null || list1.size() < 1) {
				out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>购物车是空的！</td></tr>");
			} else {
				// 遍历图书集合中的数据
				for (Goods goods : list1) {
		%>
		<tr align="center">
			<td bgcolor="#FFFFFF" width="35%"><%=goods.getNname()%></td>
			<td bgcolor="#FFFFFF" width="35%"><%=goods.getClassify()%></td>
			<td bgcolor="#FFFFFF" width="15%"><%=goods.getPrice()%></td>
			<td width="15%"><form action="/account/Deleteshopcargoods" method="post" onsubmit="return check(this);">
			<input type="hidden" value="<%=id%>" name="id">
			<input type="hidden" value="<%=goods.getId()%>" name="goodsid">
			<input type="submit" value="删除" class="hover">
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