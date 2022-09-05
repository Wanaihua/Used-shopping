<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.gx.domain.User"%>
<%@ page import="com.gx.dao.Link"%>
<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath %>">
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人信息</title>
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/public.css" />
	<link rel="stylesheet" href="css/content.css" />
	<script type="text/javascript" src="/js/jquery.min.js"></script>
</head>
<body>
<%
	if(request.getAttribute("yes")!=null){
		%>
			<script type="text/javascript">
				alert("修改成功!!!");
			</script>
		<%
	}
	response.setContentType("text/html;charset=UTF-8");
	int id=Integer.valueOf(request.getParameter("id"));
    Link l=new Link(); // 实例化BookDao
    List<User> list = l.findmyself(id); // 查询所有图书信息
    request.setAttribute("list", list); // 将list放置到request中
	String bir = null;
 %>
  <jsp:include page="top.jsp" flush="true"/>
	<div class="container">
		<div class="public-nav">您当前的位置：<a>账号信息</a>></div>
		<div class="public-content" style="margin-top: 0">
			
			<div class="public-content-cont">
			<form name="form1" id="form1" action="/account/Preserve" method="post" style="margin:0 auto;width:50%">
			<% List<User> list1 = (List<User>) request.getAttribute("list"); 
			if (list1 == null || list1.size() < 1) {
				out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何图书信息！</td></tr>");
			} else {
				// 遍历图书集合中的数据
				for (User user : list1) {
					bir=user.getBirthday();
			%>
				<input type="hidden" name="id" value="<%=user.getId() %>" id="id"/>
				<div class="form-group">
					<label for="">姓名</label>
					<input class="form-input-txt" type="text" name="nname" value="<%=user.getNname() %>" id="nname"/>
				</div>
				<div class="form-group">
					<label for="">用户名</label>
					<input class="form-input-txt" type="text" name="usename" value="<%=user.getUsename() %>" id="usename"/>
				</div>
				<div class="form-group">
					<label for="">年龄</label>
					<input class="form-input-txt" type="text" name="ssex" value="<%=user.getSsex() %>" id="ssex"/>
				</div>
				<div class="form-group">
					<label for="">电话</label>
					<input class="form-input-txt" type="text" name="phone" value="<%=user.getPhone() %>" id="phone"/>
				</div>
				<div class="form-group">
					<label for="">邮箱</label>
					<input class="form-input-txt" type="text" name="email" value="<%=user.getEmail() %>" id="email"/>
				</div>
				<div class="form-group">
					<label for="">birthday</label>
					<td>
						<select id="year" onchange="changeday()" name="year">
							<option value="">年</option>
						</select>
						<select id="month" name="month"  onchange="changeday()">
							<option value="">月</option>
						</select>
						<select id="day" name="day" >
							<option value="">日</option>
						</select>
					</td>
				</div>
				<div class="form-group">
					<label for="">地址</label>
					<input class="form-input-txt" type="text" name="address" value="<%=user.getAddress() %>" id="address" />
				</div>
				<div class="form-group" style="margin-left:150px;">
					<input type="button"  onclick="go()" class="sub-btn" value="保存" />
				</div>
				<input name="birthday" type="text" style="display: none" value="" id="userBirthday"/>
				<%}} %>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript" language="javascript">
	$(document).ready(function() {
		<%
            int a=0,year=0,month=0,day=0;
            StringBuffer sb = new StringBuffer("");
			for (int i = 0; i < bir.length(); i++) {
                if (bir.charAt(i) != '-') {
                    sb.append(bir.charAt(i));
                }else{
                    if(a==0){
                        year=Integer.parseInt(sb.toString());
                        sb=new StringBuffer("");;
                    }
                    if(a==1){
                        month=Integer.parseInt(sb.toString());
                        sb=new StringBuffer("");;
                    }
                    a++;
                }
            }
            day=Integer.parseInt(sb.toString());
        %>
		$("#year option[value='<%=year %>']").attr("selected", true);
		$("#month option[value='<%=month %>']").attr("selected", true);
		$("#day option[value='<%=day %>']").attr("selected", true);
	});
		var curdate = new Date();
		var year = document.getElementById("year");
		var month = document.getElementById("month");
		var day = document.getElementById("day");

		//绑定年份月分的默认
		function add() {
			var curyear = curdate.getFullYear();
			var minyear = curyear - 100;
			var maxyear = curyear;
			for (maxyear; maxyear >= minyear; maxyear = maxyear - 1) {
				year.options.add(new Option(maxyear, maxyear));
			}
			for (var mindex = 1; mindex <= 12; mindex++) {
				month.options.add(new Option(mindex, mindex));
			}
			addday(31);
		}

		//判断是否是闰年
		function leapyear(intyear) {
			var result = false;
			if (((intyear % 400 == 0) && (intyear % 100 != 0)) || (intyear % 4 == 0)) {
				result = true;
			} else {
				result = false;
			}
			return result;
		}

		//绑定天数
		function addday(maxday) {
			day.options.length = 1;
			for (var dindex = 1; dindex <= maxday; dindex++) {
				day.options.add(new Option(dindex, dindex));
			}
		}

		function changeday() {
			if (year.value == null || year.value == "") {
				alert("请先选择年份！");
				return false;
			} else {
				if (month.value == 1 || month.value == 3 || month.value == 5 || month.value == 7 || month.value == 8 || month.value == 10 || month.value == 12) {
					addday(31);
				} else {
					if (month.value == 4 || month.value == 6 || month.value == 9 || month.value == 11) {
						addday(30);
					} else {
						if (leapyear(year.value)) {
							addday(29);
						} else {
							addday(28);
						}
					}
				}
			}
		}

		window.onload = add();

		function go() {
			var s = "";
			s = s + document.getElementById("year").value + "-" + document.getElementById("month").value + "-" + document.getElementById("day").value;
			document.getElementById("userBirthday").value = s;
			form1.submit();
		}
</script>
</body>
</html>