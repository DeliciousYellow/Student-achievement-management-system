<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>重庆财经学院成绩管理系统</title>
	<link rel="stylesheet" type="text/css" href="static/css/loginstyle.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="static/js/jquery-3.6.0.js"></script>
</head>
<body>
	<img class="wave" src="static/img/wave.png">
	<div class="container">
		<div class="img">
			<img src="static/img/bg.svg">
		</div>
		<div id="login" class="login-content">
			<form action="${pageContext.request.contextPath}/checklogin" method="post" onsubmit="return false">
				<img src="static/img/avatar.svg">
				<h2 class="title">Welcome</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<h5>用户ID</h5>
           		   		<input id="usercode" name="usercode" type="text" class="input" required="required">
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i">
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5>密码</h5>
           		    	<input id="password" name="password" type="password" class="input" required="required">
            	   </div>
            	</div>
				<div id="CodeText"></div>
            	<a id="forget" href="#">忘记密码？</a>
				<div id="CodeImg"></div>
				<h3 id="notnull" style="color: red"></h3>
				<h3 id="message" style="color: red">${message}</h3>
            	<input id="submit" type="submit" class="btn" value="登录">
            </form>
        </div>
    </div>
	<script type="text/javascript" src="static/js/main.js"></script>
</body>
	<script type="text/javascript">
		// $("#checkImg").focus(function (){
		// 	$("#code").addClass("focus");
		// })
		var count = 0;
		var regExp = new RegExp("^[ ]+$");
		$(document).ready(function(){
			<%--获取焦点后去除提示信息--%>
			$(".input").focus(function(){
				$("#message").html('');
				$("#notnull").html('');
			});
			<%--ajax登录--%>
			$("#usercode").html('');
			<%--发送登录请求--%>
			$("#submit").click(function(){
				<!--判断字段不为空和空格，且验证码正确再放行登录请求，减少服务器/数据库压力-->
				if ($("#usercode").val()==""){
					$("#notnull").html('用户名不能为空');
					// $("#notnull").html('');
					return;
				}
				if ($("#password").val()==""){
					$("#notnull").html('密码不能为空');
					// $("#notnull").html('');
					return;
				}
				if (regExp.test($("#usercode").val())){
					$("#notnull").html('用户名不能为空格');
					// $("#notnull").html('');
					return;
				}
				if (regExp.test($("#password").val())){
					$("#notnull").html('密码不能为空格');
					// $("#notnull").html('');
					return;
				}
				if ($("#checkImg").val()==""){
					$("#notnull").html('验证码不能为空');
					// $("#notnull").html('');
					return;
				}
				if (regExp.test($("#checkImg").val())){
					$("#notnull").html('验证码不能为空格');
					// $("#notnull").html('');
					return;
				}
				<!--先检查验证码是否正确-->
				var flag = 0;
				if(count>=3){
					<!--默认异步请求会导致验证码不管正确与否，都会发检查checklogin的请求-->
					$.ajaxSettings.async = false;
					$.get("${pageContext.request.contextPath}/checkCaptcha",
							{code : ''+$("#checkImg").val()},
							function (json){
								if (json == "error") {
									$("#message").html('验证码错误');
									$("#CodeImg").html('');
									$("#CodeImg").html('<img id="codeImg" style="height:50px" width="200px" onclick="changeCodeImg()" src="${pageContext.request.contextPath}/captcha?date=' + new Date().getTime() + '">"');
									flag = 1;
								}
							}
					)
					$.ajaxSettings.async = true;
					<%--$("#CodeImg").html('');--%>
					<%--$("#forget").before('<img style="height:50px" width="200px" src="${pageContext.request.contextPath}/captcha">')--%>
					if (flag){
						return;
					}
				}
				$.post("${pageContext.request.contextPath}/checklogin",
					{usercode : ''+$("#usercode").val(),
					password : ''+$("#password").val()},
					function(Code){
						if (Code == "200"){
							$(location).attr('href','${pageContext.request.contextPath}/homePage');
						}else {
							$("#message").html('登录失败,用户名或密码错误');
							// alert("登录失败");
							count++;
							<!--计数失败次数，第三次开始需要验证码-->
							if (count>=3){
								$("#message").html('登录失败累计3次，请输入验证码');
								//$("#forget").before('<div class="input-div pass"><div class="i"><i class="fas fa-lock"></i></div><div class="div"><h5>验证码</h5><input id="checkImg" name="checkImg" type="text" class="input" required="required"></div></div>')
								$("#CodeText").html('<div id="code" class="input-div pass focus"><div class="i"><i class="fas fa-lock"></i></div><div class="div"><h5>验证码</h5><input id="checkImg" name="checkImg" type="text" class="input" required="required"></div></div>');
								$("#CodeImg").html('<img id="codeImg" style="height:50px" width="200px" onclick="changeCodeImg()" src="${pageContext.request.contextPath}/captcha">');
							}
						}
					}
				)
			})
		})
	</script>
</html>
