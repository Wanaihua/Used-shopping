<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath %>">
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>发布信息</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css" />
</head>
<%
	String id=request.getParameter("id");
%>
<script>
function upload(){
    document.getElementById("describe_1").value = document
    .getElementById("text").value;
    document.getElementById("form1").submit();
    }
</script>
<body>
<jsp:include page="top.jsp" flush="true">
  <jsp:param name="id" value="<%=id %>" />
</jsp:include>
	<div class="container">
		<div class="public-nav">您当前的位置：<a>发布信息</a></div>
		<div class="public-content" style="margin-top: 0">
			<div class="public-content-cont">
			<form action="${pageContext.request.contextPath}/account/Addgoods?id=<%=id %>" name="form1" method="post" style="margin:0 auto;width:50%" onsubmit="return checkForm(this);">
				<input type="hidden" id="uuid" value="<%= id%>" name="useid"/>
				<div class="form-group">
					<label for="">商品名称</label>
					<input class="form-input-txt" type="text" name="nname" value="" />
				</div>
				
				<div class="form-group">
					<label for="">商品价格</label>
					<input class="form-input-txt" type="text" name="price" value="" />
				</div>
				
				<div class="form-group">
					<label for="">请选择分类</label>
					<select name="classify" class="form-select" style="height: 30px;" id="classify">
						<option value="书本">书本</option>
						<option value="单车">代步车</option>
						<option value="玩具">玩具</option>
						<option value="乐器">乐器</option>
						<option value="活动服">活动服</option>
						<option value="电子产品">电子产品</option>
						<option value="生活用品">生活用品</option>
						<option value="其他">其他</option>
					</select>
				</div>
				
				<div class="form-group">
					<label for="">商品描述</label>
					<textarea class="form-input-textara" id="text" name="ddescribe" ></textarea>
				</div>
				
				<div id="large"></div>
				<div class="form-group" style="margin-left:150px;">
					<input type="submit" class="sub-btn" id="btn" value="提  交" onclick="upload()"/>
					<input type="reset" class="sub-btn" value="重  置" />
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
/* document.write(id);
 	if(id==0){
				if(confirm("您尚未登录。是否现在去登录？")){
					window.location.href="user_login.jsp";
					}else{
						window.location.href="../index/index.jsp";
					}
			
}else{
	alert("id");
}  */
	 function checkForm(form1){
		if(form1.classify.value==""){
			 alert("分类不能为空！");
			 return false;
		}
		if(form1.nname.value==""){
			alert("商品名称不能为空！");
			return false;
		}
		if(form1.price.value==""){
			alert("商品价格不能为空！");
			return false;
		}
	}
</script>
<script src="js/jquery.min.js"></script>
</html>