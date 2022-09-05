<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'register.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <style type="text/css">
        .inputtt {
            font-family: Poppins-Medium;
            font-size: 15px;
            color: #666666;
            display: block;
            width: 100%;
            background: #e6e6e6;
            height: 30px;
            border-radius: 25px;
        }
        .rig{
            margin-top: -120px;
        }
        .imgg{
            margin-top: 380px;
            margin-right: -120px;
        }
        .bor{
            border: 2px solid red;
        }
        #input-code{
            font-family: Poppins-Medium;
            font-size: 15px;
            color: #666666;
            display: block;
            width: 50%;
            background: #e6e6e6;
            height: 30px;
            border-radius: 25px;
        }
        #verifi-code{
            margin-left: 140px;
            margin-top: -30px;
        }
        .safety-factor-div {
            line-height: 10px;
            top: -6px;
            left: 0px;
        }
        .safety-factor-div div{
            float: left;
            width: 30px;
            height: 10px;
            border-radius: 5px;
            margin: 0 8px;
            visibility: hidden;
        }
        .safety-factor-div span{
            float: left;
            visibility: hidden;
        }
        .verifi-div{
            position: relative;
        }
        .verifi-div canvas{
            position:relative;
            width: 90px;
            height: 30px;
            border-radius: 20px;
            border: 1px solid #57b846;
            background-color: #57b846;
            text-align: center;
            line-height: 40px;
            transition: 300ms;
        }
        input:focus, .verifi-div canvas:hover{
            box-shadow: 0 2px 11px #B34747
        }
    </style>
</head>

<body>
<div class="bg">
    <div class="body">
        <div class="img">
            <img src="/image/img-01.png" alt="IMG">
        </div>
        <div class="rig">
            <form  name="form1" id="form1" action="/accont/insert" method="post">
                <table cellspacing="10px">
                    <tr>
                        <td>姓名</td>
                        <td><input name="nname" id="nname" type="text"/></td>
                    </tr>
                    <tr>
                        <td>账户</td>
                        <td><input name="usename" id="usename" type="text"/></td>
                    </tr>
                    <tr>
                        <td>请输入密码</td>
                        <td><input name="password" type="password" id="pw1"/></td>
                    </tr>
                    <tr class="safety-factor-div">
                        <td>
                            <span id="safe-head">安全系数</span>
                        </td>
                        <td>
                            <div id="safe-d1" style="background-color:red;"></div>
                            <div id="safe-d2" style="background-color:#F0F028;"></div>
                            <div id="safe-d3" style="background-color:green;"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>再次输入密码</td>
                        <td><input name="password1" type="password" id="pw2" onchange="look()" /></td>
                    </tr>
                    <tr>
                        <td>邮箱</td>
                        <td><input name="email" type="text"/></td>
                    </tr>
                    <tr>
                        <td>birthday</td>
                        <td><select id="year" onchange="changeday()" name="year"> <option value="">年</option></select><select id="month" name="month"  onchange="changeday()"><option value="">月</option> </select><select id="day" name="day" ><option value="">日</option> </select><br/></td>
                    </tr>
                    <tr>
                        <td>性别</td>
                        <td><input type="radio" value='男' name="ssex" />男<input type="radio" value='女' name="ssex" />女</td>
                    </tr>
                    <tr>
                        <td>电话</td>
                        <td><input name="phone" type="text"></td>
                    </tr>
                    <tr>
                        <td>地址</td>
                        <td><textarea name="address" cols="20" rows="30" class="area"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div class="verifi-div">
                                <input id="input-code" type="text" placeholder="请输入验证码">
                                <canvas id="verifi-code"></canvas>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="button" value='注册' onclick="getday()" class="btnn"/><input type="reset" value='重置' class="btnn"/></td>
                    </tr>
                </table>

                <script type="text/javascript" language="javascript">
                    $(document).ready(function(){
                        $("input[type=text]").addClass("inputtt");
                        $("input[type=password]").addClass("inputtt");
                        $("input[id='input-code']").removeClass("inputtt");
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
                    }

                    //判断是否是闰年
                    function leapyear(intyear) {
                        var result = false;
                        if (((intyear % 400 == 0) && (intyear % 100 != 0)) || (intyear % 4 == 0)) {
                            result = true;
                        }
                        else {
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
                        }
                        else {
                            if (month.value == 1 || month.value == 3 || month.value == 5 || month.value == 7 || month.value == 8 || month.value == 10 || month.value == 12) {
                                addday(31);
                            }
                            else {
                                if (month.value == 4 || month.value == 6 || month.value == 9 || month.value == 11) {
                                    addday(30);
                                }
                                else {
                                    if (leapyear(year.value)) {
                                        addday(29);
                                    }
                                    else {
                                        addday(28);
                                    }
                                }
                            }
                        }
                    }
                    window.onload = add();
                    <% if(request.getAttribute("have")!=null){
                        %>
                    alert("用户名已存在!!!");
                    $("#usename").addClass("bor");

                    <%
                    }
                    if(request.getAttribute("ac")!=null){
                    %>
                    alert("注册成功!!!");
                    <%
                    }
                  %>
                    var username = document.getElementById('nname');
                    var myInput = document.getElementById('pw1');
                    var myReinput = document.getElementById('pw2');
                    var inputCode = document.getElementById('input-code');
                    var canvas = document.getElementById('verifi-code');

                    var code, password, repassword;

                    myInput.addEventListener('input',function(e){

                        let safe_head = document.getElementById('safe-head');
                        let safe_d1 = document.getElementById('safe-d1');
                        let safe_d2 = document.getElementById('safe-d2');
                        let safe_d3 = document.getElementById('safe-d3');

                        password = myInput.value;
                        safe_head.style.visibility = "visible";
                        switch (checkPwd(password)) {
                            case 0:{

                                safe_d1.style.visibility = "visible";
                                safe_d2.style.visibility = "hidden";
                                safe_d3.style.visibility = "hidden";
                                break;
                            }
                            case 1:{

                                safe_d1.style.visibility = "visible";
                                safe_d2.style.visibility = "visible";
                                safe_d3.style.visibility = "hidden";
                                break;
                            }
                            case 2:{

                                safe_d1.style.visibility = "visible";
                                safe_d2.style.visibility = "visible";
                                safe_d3.style.visibility = "visible";
                                break;
                            }
                            default:{

                            }
                        }
                    });

                    function createCode() {
                        let code = "";
                        var codeLength = 4;
                        var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
                        for (var i = 0; i < codeLength; i++) {
                            var charIndex = Math.floor(Math.random() * 36);
                            code += selectChar[charIndex];
                        }
                        console.log("生成验证码 " + code);
                        return code;
                    }

                    function draw_canvas(code) {
                        if (canvas) {
                            var ctx=canvas.getContext('2d');
                            ctx.clearRect(0,0,canvas.width,canvas.height);
                            ctx.fillStyle="white";
                            ctx.font="80px Verdana";
                            ctx.fillText(code,25,110);
                        }
                    }

                    function checkPwd(str){
                        var pattern1 = /([0-9]+)/i;
                        var pattern2 = /([a-z]+)/i;
                        if(str.length<6 || str.length>20){
                            return 0;
                        }
                        if(pattern1.exec(str)){
                            if(pattern2.exec(str))
                                return 2;
                            else
                                return 1;
                        }
                    };

                    canvas.onclick = function () {
                        code = createCode();
                        draw_canvas(code);
                    }
                    window.onload = function () {
                        code = createCode();
                        draw_canvas(code);
                    };
                    function getday(){
                        var ps=document.getElementById("pw1").value;
                        var ps2=document.getElementById("pw2").value;
                        var yzm=document.getElementById("input-code").value;
                        if(code != yzm.toUpperCase()){
                            window.alert("验证码错误或为空");
                            code = createCode();
                            draw_canvas(code);
                        }else if(ps==ps2){
                            document.getElementById("pw2").style="";
                            var s="";
                            s=s+document.getElementById("year").value+"-"+document.getElementById("month").value+"-"+document.getElementById("day").value;
                            document.getElementById("userBirthday").value=s;
                            form1.submit();
                        }else{
                            window.alert("两次密码不一致");
                            document.getElementById("pw2").style.border="2px solid red";
                        }
                    }
                </script>
                <input name="birthday" type="text" style="display: none" id="userBirthday"/>
            </form>
        </div>
        <a href="/pages/index.jsp" class="imgg"><img src="/image/goback.png"></a>
    </div>
</div>
</body>
</html>
