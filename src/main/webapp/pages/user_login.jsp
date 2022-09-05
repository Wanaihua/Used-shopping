<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
 String path = request.getContextPath();
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <base href="<%=basePath%>">

 <title>My JSP 'login.jsp' starting page</title>

 <meta http-equiv="pragma" content="no-cache">
 <meta http-equiv="cache-control" content="no-cache">
 <meta http-equiv="expires" content="0">
 <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
 <meta http-equiv="description" content="This is my page">
 <link rel="stylesheet" type="text/css" href="/css/main.css">
 <script src="/js/jquery.min.js" type="text/javascript" ></script>
 <script type="text/javascript">
  $(document).ready(function() {
   $("#show").addClass("n");
   $("#show1").addClass("n");
   <%
       if(request.getAttribute("useid")!=null){
         int id=Integer.parseInt(request.getAttribute("useid").toString());
         if(id==0){
          %>
          $("input[id='show']").removeClass("n").addClass("s");
          document.getElementById("show").value="用户名或密码错误";
          $("input[type='password']").addClass("bor");
          setTimeout(function(){$("input[id='show']").removeClass("s").addClass("n");$("input[type='password']").removeClass("bor");},3000);
          <%
         }else if(id==-1){
          %>
          alert("用户已封禁!!!");
          <%
         }
       }
  %>
  });
 </script>
 <style type="text/css">
  .bor{
   border: 2px solid red;
  }
  .txt2{
   margin-top: 400px;
   margin-right: -120px;
  }
  .s{
   display: block;
   color: red;
  }
  .n{
   display: none;
   color: #ffffff;
  }
 </style>
</head>

<body>
<div class="login">
 <div class="bg">
  <div class="body">
   <div class="img">
    <img src="/image/img-01.png" alt="IMG">
   </div>
   <form action="/account/userLogin" method="post" name="form1" id="form1" >
    <div class="title">
     <span class="pad1" id="userLogin">用户登录</span>
    </div>

    <div class="inputt">
     <input type="text"  id="show1" style="padding-left: 20px; padding-bottom: 5px;">
     <input name="usename" class="inputtt" id="usename" placeholder="用户名"/>
    </div>

    <div class="inputt">
     <input name="password" type="password" id="password" class="inputtt" placeholder="密码"/>
     <input type="text" align="right"  id="show" style="text-align: right;margin-left: 60px;">
    </div>

    <div class="">
     <input type="button" onclick="go()" value='提交' class="btn">
    </div>
   </form>
   <a class="txt2" href="${pageContext.request.contextPath}/pages/user_register.jsp">
    注册
   </a>
  </div>
 </div>
</div>
<script type="text/javascript">
  function go(){
   var username=document.getElementById("usename").value;
   var password=document.getElementById("password").value;
   if(username==""||password==""){
    $("input[id='show1']").removeClass("n").addClass("s");
    document.getElementById("show1").value="用户名或密码为空!!!";
    setTimeout(function(){$("input[id='show1']").removeClass("s").addClass("n");},3000);
   }else{
    form1.submit();
   }
  }

</script>
</body>
</html>
