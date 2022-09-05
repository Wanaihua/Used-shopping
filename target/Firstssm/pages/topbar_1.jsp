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
<link rel="stylesheet" type="text/css" href="css/topbar.css">
<script src="js/jquery.min.js"></script>

</head>
<body marginwidth="0" marginheight="0">
<%
	int a=0;
    if(request.getAttribute("useid")!=null){
        a=Integer.parseInt(request.getAttribute("useid").toString());
    }else if(request.getParameter("useid")!=null){
        a=Integer.parseInt(request.getParameter("useid"));
    }
%>
<input type="hidden" id="uuname" />
	<div id="commonTopbar" class="commonTopbar">
   <div id="commonTopbar_welcome" class="bar_left" style="margin-left:50px">
     <label>欢迎来到二手网！</label> 
   </div>
   <div class="bar_right" style="position:relative;margin-right:50px" id="info">
        <div class="post_order">
           <a href="/pages/fabu.jsp?id=<%=a %>" target="_blank">发布商品
           </a>
        </div>         
        <div class="post_order">
           <a href="/pages/mygoods.jsp?useid=<%=a %>" target="_blank">我的商品
           </a>
        </div>
        <div class="post_order">
           <a href="/pages/shopcar.jsp?useid=<%=a %>" target="_blank">购物车
           </a>
        </div>        
        <div id="commonTopbar_my58menu" class="post_order">
           <a id="commonTopbar_tomy58" target="_blank" href="/pages/myself.jsp?id=<%=a %>">个人信息
           </a>
        </div>
       <div class="post_order">
           <a href="${pageContext.request.contextPath}/pages/message.jsp?useid=<%=a %>" target="_blank">消息
           </a>
       </div>
        <div class="post_order">
           <a href="/pages/index.jsp">退出账号
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