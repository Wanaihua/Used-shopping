<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.gx.domain.User"%>
<%@ page import="com.gx.dao.Link"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath %>">
<!--首页  -->
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
<%
int id=Integer.valueOf(request.getParameter("useid"));
if(request.getParameter("yes")!=null){
	int yes=Integer.parseInt(request.getParameter("yes"));
	if(yes==2){
		%>
		<script type="text/javascript">
			alert("封号成功!!!");
		</script>
		<%
	}else if(yes==1){
		%>
		<script type="text/javascript">
			alert("修改成功!!!");
		</script>
		<%
	}
}
%>
<body>
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
	int currPage = 1; // 当前页码
    if (request.getParameter("page") != null) { // 判断传递页码是否有效
        currPage = Integer.parseInt(request.getParameter("page"));// 对当前页码赋值
    }
    Link l=new Link(); // 实例化BookDao
    List<User> list = l.findUuser(id); // 查询所有图书信息
    request.setAttribute("list", list); // 将list放置到request中
    int pages; // 总页数
    int count = l.findCount(); // 查询总记录数
    if (count % User.PAGE_SIZE == 0) { // 计算总页数,总记录数和每页显示的数
        pages = count / User.PAGE_SIZE; // 对总页数赋值
    } else {
        pages = count / User.PAGE_SIZE + 1; // 对总页数赋值
    }
    StringBuffer sb = new StringBuffer(); // 实例化StringBuffer
    for (int i = 1; i <= pages; i++) { // 通过循环构建分页导航条
        if (i == currPage) { // 判断是否为当前页
            sb.append("『" + i + "』"); // 构建分页导航条
        } else {
            // 构建分页导航条
            sb.append("<a href='index.jsp?page=" + i + "'>" + i + "</a>");
        }
        sb.append("　"); // 构建分页导航条
    }
    request.setAttribute("bar", sb.toString()); // 将分页导航条的字符串放置到request中

 %>
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666" class="show">
		<tr>
			<th class="tb1_td3">用户名</th>
			<th class="tb1_td3">账号</th>
			<th  class="tb1_td3">手机号</th>
			<th  class="tb1_td3">邮箱</th>
			<th  class="tb1_td3">地址</th>
			<th  class="tb1_td3">修改非法用户名</th>
			<th  class="tb1_td3">封禁</th>
		</tr>
		<%
			// 获取图书信息集合
			List<User> list1 = (List<User>) request.getAttribute("list");
			// 判断集合是否有效
			if (list1 == null || list1.size() < 1) {
				out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>操作失败</td></tr>");
			} else {
				// 遍历图书集合中的数据
				for (User user : list1) {
		%>
		<tr align="center">
			<td bgcolor="#FFFFFF"><%=user.getNname()%></td>
			<td bgcolor="#FFFFFF"><%=user.getUsename()%></td>
			<td bgcolor="#FFFFFF"><%=user.getPhone()%></td>
			<td bgcolor="#FFFFFF"><%=user.getEmail()%></td>
			<td bgcolor="#FFFFFF"><%=user.getAddress()%></td>
			<td bgcolor="#FFFFFF">
				<form action="/account/ChangeUserName" method="post">
        			<input type="hidden" name="id" value="<%=user.getId()%>">
        			<input type="hidden" name="iid" value="<%=id%>">
        			<input type="text" name="nname" size="3">
        			<input type="submit" value="修　改" class="hover">
        		</form>
			</td>
			<td>
				<form action="/account/ban" method="post">
					<input type="hidden" name="id" value="<%=user.getId()%>">
					<input type="hidden" name="iid" value="<%=id%>">
					<input type="submit" value="封 号" class="hover">
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