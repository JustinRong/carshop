<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function judePwd() {
		var rgsname = document.getElementById("rgsname").value;
		var rgspwd = document.getElementById("rgspwd").value;
		var sergspwd = document.getElementById("sergspwd").value;
		debugger;
		if (rgspwd !=null && rgspwd != "" && sergspwd !=null && sergspwd !=""){
			if (rgspwd == sergspwd){
				document.getElementById("registerForm").submit();
				return true;
			}else{
				alert("两次输入的密码不一致");
				document.getElementById("sergspwd").focus();
			}
		}
		if (rgsname == null || rgsname == "") {
			alert("登录账号不能为空");
			document.getElementById("rgsname").focus();
			return false;
		}
		if (rgspwd == null || rgspwd == "") {
			alert("密码不能为空");
			document.getElementById("rgspwd").focus();
			return false;
		}
		if (sergspwd == null || sergspwd == "") {
			alert("再次输入密码不能为空");
			document.getElementById("sergspwd").focus();
			return false;
		}
		return false;
	}
</script>
</head>
<body>
	<form id="registerForm" action="user/register.action" method="post">
		登录账号：<input type="text" name="rgsname" id="rgsname" ><br/>
		登录密码：<input type="password" name="rgspwd" id="rgspwd" ><br/>
		请再次输入密码：<input type="password" name="sergspwd" id="sergspwd"><br/>
	</form>
	<button onclick="judePwd()">提交</button>
</body>
</html>