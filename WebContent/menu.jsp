<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function selectCart(){
		var flag = "${User.userName }";
		if(flag != "" && flag != null){
			$.ajax({
				url:"./cart/selectCartAll.action",
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.key == 0) {
						window.location.href="new.jsp";
					}
				}
			})
		}else{
			window.location.href="new.jsp";
		}
	}
</script>
</head>
<body>
<div class="menu"> 	
			<div class="top-nav"> 
					<ul>
						<li class="active"><a href="index.jsp">主页</a></li>
						<li><a href="about.jsp">详情</a></li>
						<li><a href="specials.jsp">车型</a></li>
						<li><a href="#" onclick="selectCart()">购物车</a></li>
						<li id="info"><a href="contact.jsp" >个人信息</a></li>
					</ul>
					<div class="clear"></div> 
				</div>
		</div>
</body>
</html>