<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function loginOut(){
		$.ajax({
			url:"./user/loginOut.action",
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.key == 0){
					alert("退出登录成功！");
					window.location="index.jsp";
				}
			}
		})
	}
</script>
<script type="text/javascript">
	function Until(){
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		if (username == null || username == ""){
			alert("用户名不能为空！");
			document.getElementById("username").focus();
			return false;
		}
		if (password == null || password == "") {
			alert("密码不能为空！")
			document.getElementById("password").focus();
			return false;
		}
		return true;
	}
	
	function login(){
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		if(Until()) {
			$.ajax({
				url:"./user/login.action",
				data:{"username":username,"password":password},
				type:"post",
				dataType:"json",
				success:function(data){
					if (data == null){
						alert("账号或者密码错误！")
					}else {
						var permission = data.permission;
						if(!permission){
						alert("账号不存在！请前往注册")
						}
						if(permission) {
							alert("登录成功！欢迎您："+data.userName);
							location.reload();
						}
					}
				}
			})
			return true;
		}else{
			return false;
		}
	}
	
	function register(){
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		if(Until()){
			$.ajax({
				url:"./user/register.action",
				data:{"username":username,"password":password},
				type:"post",
				dataType:"json",
				success:function(data){
					var isNo = data.key; //判断是否可以注册
					if (isNo == null){
						alert("输入有误！");
					}else if(isNo === "isRegisted") {
						alert("账号已存在！");
					}else if (isNo === "yes") {
						alert("注册成功！");
					}
					}
				
			})
		}
	}
	
	function searchCars() {
		var search=document.getElementById("searchForCars").value;
		$.ajax({
			url:"./cars/searchCars.action",
			data:{"carBrand":search},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.key == 0 ){
					alert("did!");
					location.reload();
				}
			}
		})
	}
</script>
</head>
<body>
<div id="header_user_out" style="display: none;">
	<div class="box_header_user_menu">
						<ul class="user_menu">
						<form id="loginForm" name="loginAndRegister" action="" method="post">
							<li class="act first">username: <input type="text" class="textbox" id="username" name="username"></li>
							<li class="">password: <input type="password" class="textbox" name="password" id="password"></li>
						</form>
								<li class="last">
										<div class="button-t">
											<button style="height: 20px;" class="gray-button" onclick="login()"><span>Log in</span></button>
										</div>
								</li>
								<li class="">
									<div class="button-t">
										<button style="height: 20px;" class="gray-button" onclick="register()"><span>Register</span></button>
									</div>
								</li>
								</ul>
					</div>
					<div class="header-right">
						<ul class="follow_icon" style="display:none">
							<li><a href="#"><img src="images/icon.png" alt=""/></a></li>
							<li><a href="#"><img src="images/icon1.png" alt=""/></a></li>
							<li><a href="#"><img src="images/icon2.png" alt=""/></a></li>
							<li><a href="#"><img src="images/icon3.png" alt=""/></a></li>
						</ul>
					</div><div class="clear"></div> 
					<div class="header-bot">
						<div class="logo">
							<a href="index.jsp"><img src="images/logo.png" alt=""/></a>
						</div>
						<div class="search">
						    <input type="text" id="searchForCars" class="textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">
						    <button class="gray-button" onclick="searchCars()"><span>Search</span></button>
				       </div>
					<div class="clear"></div> 
				</div>
</div>
<div id="header_user_logined" style="display: none;">
<div class="header-right">
						<ul class="follow_icon">
							<li><span>欢迎你：</span></li>
							<li><span>${User.userName }</span></li>
							<li><div class="button-t">
									<button style="height: 20px;" class="gray-button" onclick="loginOut()"><span>Log out</span></button>
								</div>
							</li>
						</ul>
					</div><div class="clear"></div> 
					<div class="header-bot">
						<div class="logo">
							<a href="index.jsp"><img src="images/logo.png" alt=""/></a>
						</div>
						<div class="search">
						    <input type="text" class="textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">
						    <button class="gray-button"><span>Search</span></button>
				       </div>
					<div class="clear"></div> 
				</div>
</div>	
</body>
<script type="text/javascript">
    var flag = "${User.userName }";
	if(flag != "" && flag != null){
		document.getElementById("header_user_out").style.display="none";
		document.getElementById("header_user_logined").style.display="";
	}else{
		document.getElementById("header_user_out").style.display="";
		document.getElementById("header_user_logined").style.display="none";
	}
</script>
</html>