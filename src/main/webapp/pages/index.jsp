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
tr:hover, tr:nth-child(even):hover {
    background: #87cefa;
}
</style>
</head>
<body>
<jsp:include page="topbar.jsp"></jsp:include>
<div id="headerWrap">
    <div id="homeWrap" class="wrapper">
        <div id="brand_top_banner" style="display:none"></div>
        <div id="header">
            <div id="headerinside">
                <a href="${pageContext.request.contextPath}/pages/index.jsp" target="_self" id="logo">
	                <img id="bigLogo" src="${pageContext.request.contextPath}/image/logo-l.png" style="width:70px;" alt="" title="logo" />
	               <img id="miniLogo" src="${pageContext.request.contextPath}/image/logo-l.png" style="width:40px;height:20px"alt="" title="logo" />
                </a><div id="brand_mini_banner" class="search-no" style="display:none"></div>
                <form onsubmit="" action="/account/Seekgoods" method="post" target="_self">
                <div id="searchbar" style="margin-top:15px">
                     <div id="saerkey">
                        <span id="key">
                        	<input type="text" id="keyword" name="goodsname" class="keyword2" placeholder="找你要的二货" />
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
            	<a class="navWit" href="/pages/index.jsp" target="_self">首页</a>
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
    Link l=new Link();
    List<Goods> list = l.find(currPage); // 查询所有图书信息
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
            sb.append("<a href='/pages/index.jsp?page=" + i + "'>" + i + "</a>");
        }
        sb.append("　"); // 构建分页导航条
    }
    request.setAttribute("bar", sb.toString()); // 将分页导航条的字符串放置到request中

 %>
    <div class="div1">
	<table id="tab" width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666" class="show">
        <thead>
		<tr style="height: 30px">
			<th class="tb1_td3">名称</th>
			<th class="tb1_td3" id="UpOrDown">价格↑↓</th>
			<th class="tb1_td3"><select name="sel" id="sel" style="border: none;text-align: center;background: #87cefa">
                <option value="分类">分类</option>
                <option value="书本">书本</option>
                <option value="代步车">代步车</option>
                <option value="玩具">玩具</option>
                <option value="乐器">乐器</option>
                <option value="活动服">活动服</option>
                <option value="电子产品">电子产品</option>
                <option value="生活用品">生活用品</option>
                <option value="其他">其他</option>
            </select></th>
			<th class="tb1_td3">描述</th>
			<th class="tb1_td3"></th>
			<th class="tb1_td3"></th>
		</tr>
        </thead>
        <tbody>
		<%
			// 获取图书信息集合
			List<Goods> list1 = (List<Goods>) request.getAttribute("list");
			// 判断集合是否有效
			if (list1 == null || list1.size() < 1) {
				out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何图书信息！</td></tr>");
			} else {
				// 遍历图书集合中的数据
				for (Goods goods : list1) {
		%>
		<tr align='center'>
			<td bgcolor="#FFFFFF" width="20%"><%=goods.getNname()%></td>
			<td bgcolor="#FFFFFF" width="10%"><%=goods.getPrice()%></td>
			<td bgcolor="#FFFFFF" width="10%"><%=goods.getClassify()%></td>
			<td bgcolor="#FFFFFF" width="40%"><%=goods.getDdescribe()%></td>
			<td width="20%"><form action="${pageContext.request.contextPath}/account/information" method="post" onsubmit="return check(this);">
			<input type="hidden" value="<%=goods.getUseid()%>" name="useid">
			<input type="submit" value="卖家信息" class="hover">
			</form>
			</td>
		</tr>
		<%
			}
		}
		%>
        </tbody>
	</table>
    </div>
	<div class="div2">
        <%=request.getAttribute("bar")%>
    </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function(){
        var oTab = document.getElementById('tab');
        var oBtn = document.getElementById('UpOrDown');
        var k=1;
        oBtn.onclick = function(){
            var arr = [];
            for (var i = 0; i < oTab.tBodies[0].rows.length; i++) {
                arr[i]=oTab.tBodies[0].rows[i];
            }
            arr.sort(function (tr1, tr2) {
                var n1 = parseInt(tr1.cells[1].innerHTML);
                var n2 = parseInt(tr2.cells[1].innerHTML);
                if(k==1)
                    return n1-n2;
                else
                    return  n2-n1;
            });
            k=-k;
            for (var i = 0; i < arr.length; i++) {
                oTab.tBodies[0].appendChild(arr[i]);
            }
        };
        $("#sel").change(function(){
            var cla=$("#sel").val();
            var arr = [];
            var n=[];
            var j=0;

            for (var i = 0; i < oTab.tBodies[0].rows.length; i++) {
                arr[i]=oTab.tBodies[0].rows[i];
            }
            arr.forEach(function (tr1,index) {
                var n1 = tr1.cells[2].innerHTML;
                if(n1==cla){
                    n[j]=arr[index];
                    arr[index]=arr[j];
                    arr[j]=n[j];
                    j++;
                }
            });
            for (var i = 0; i < arr.length; i++) {
                oTab.tBodies[0].appendChild(arr[i]);
            }
        });
    });
</script>
</html>