<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.gx.domain.Goods"%>
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
<body>
<%
int id=Integer.valueOf(request.getParameter("useid"));
%>
<jsp:include page="topbar_2.jsp">
<jsp:param name="id" value="<%=id %>" />
</jsp:include>
<div id="headerWrap">
    <div id="homeWrap" class="wrapper">
        <div id="brand_top_banner" style="display:none"></div>
        <div id="header">
            <div id="headerinside">
                <a href="index.jsp" target="_self" id="logo">
	                <img id="bigLogo" src="image/logo-l.png" style="width:70px;" alt="" title="logo" />
	               <img id="miniLogo" src="image/logo-l.png" style="width:40px;height:20px"alt="" title="logo" />
                </a><div id="brand_mini_banner" class="search-no" style="display:none"></div>
                <form onsubmit="" action="" method="post" target="_self">
                <div id="searchbar" style="margin-top:15px">
                     <div id="saerkey">
                        <span id="key">
                        	<input type="text" id="keyword" name="proName" class="keyword2" placeholder="找你要的二货" />
                        </span>
                    </div>
                    <div class="inputcon">
                        <input  type="submit" name="button" id="searchbtn" class="btnall"  value="搜&nbsp;索" onMouseMove="this.className='btnal2'" onMouseOut="this.className='btnall'" tongji_tag="pc_home_search" onclick="loadData();return false;" />
                    </div>
                </div>
                </form>
            </div>
        </div>
        <ul class="navcon" id="nav" style="margin-top:20px">
            <li id="homeNav" class="navBg fl">
            	<a class="navWit" href="../index/index.jsp" target="_self">首页</a>
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
    List<Goods> list = l.mygoods(currPage,id); // 查询所有图书信息
    request.setAttribute("list", list); // 将list放置到request中
    int pages; // 总页数
    int count = l.findCount(); // 查询总记录数
    if (count % Goods.PAGE_SIZE == 0) { // 计算总页数,总记录数和每页显示的数
        pages = count / Goods.PAGE_SIZE; // 对总页数赋值
    } else {
        pages = count / Goods.PAGE_SIZE + 1; // 对总页数赋值
    }
    StringBuffer sb = new StringBuffer(); // 实例化StringBuffer
    for (int i = 1; i <= pages; i++) { // 通过循环构建分页导航条
        if (i == currPage) { // 判断是否为当前页
            sb.append("『" + i + "』"); // 构建分页导航条
        } else {
            // 构建分页导航条
            sb.append("<a href='user/mygoods.jsp?page=" + i + " & id=" + id + "'>" + i + "</a>");
        }
        sb.append("　"); // 构建分页导航条
    }
    request.setAttribute("bar", sb.toString()); // 将分页导航条的字符串放置到request中

 %>
	<table width="98%" border="0" align="center" cellpadding="0"
		cellspacing="1" bgcolor="#666666" class="show">
		<tr>
			<th class="tb1_td3">名称</th>
			<th class="tb1_td3">价格</th>
			<th class="tb1_td3">分类</th>
			<th class="tb1_td3">描述</th>
			<th class="tb1_td3">修改价格</th>
			<th class="tb1_td3">下架商品</th>
		</tr>
		<%
			// 获取图书信息集合
			List<Goods> list1 = (List<Goods>) request.getAttribute("list");
			// 判断集合是否有效
			if (list1 == null || list1.size() < 1) {
				out.print("<tr><td bgcolor='#FFFFFF' colspan='6'>没有发布商品！</td></tr>");
			} else {
				// 遍历图书集合中的数据
				for (Goods goods : list1) {
		%>
		<tr align="center">
			<td bgcolor="#FFFFFF"><%=goods.getNname()%></td>
			<td bgcolor="#FFFFFF"><%=goods.getPrice()%></td>
			<td bgcolor="#FFFFFF"><%=goods.getClassify()%></td>
			<td bgcolor="#FFFFFF"><%=goods.getDdescribe()%></td>
			<td bgcolor="#FFFFFF"><form action="account/UpdateGoods" method="post">
        	<input type="hidden" name="id" value="<%=goods.getId()%>">
        	<input type="hidden" name="useid" value="<%=goods.getUseid()%>">
        	<input type="text" name="price" size="3">
        	<input type="submit" value="修　改" class="hover">
        	</form></td>
        	<td bgcolor="#FFFFFF"><form action="account/DeleteGoods" method="post">
        	<input type="hidden" name="id" value="<%=goods.getId()%>">
        	<input type="hidden" name="useid" value="<%=goods.getUseid()%>">
        	<input type="submit" value="下 架" class="hover">
      		</form></td>
		</tr>
		<%
			}
		}
		%>
	</table>
<%-- 	<div class="div2">
        <%=request.getAttribute("bar")%>
    </div> --%>
</div>
</body>
</html>