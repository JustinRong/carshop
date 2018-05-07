<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>Cart</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/CarDetail.js"></script>
<script type="text/javascript" src="js/menu.js">
</script>
<script type="text/javascript" src="js/cartOrder.js">
</script>
<script src="js/cars.js" type="text/javascript"></script>
<style >
.sumBtn {
    border: 1px solid #D9D9D9;
    border-bottom: 1px solid #B9B9B9;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    background: #F5F5F5;
    float: right;
    padding: 7px 20px;
    color: #D54F30;
    font-size: 1em;
    font-weight: bold;
    cursor: pointer
}
.userInfo th {
    font-size: 15px;
    color: #D54F30;
    line-height: 1.6em;
    margin-top: 9%;
}
.userInfo td {
	text-align: center;
}
</style>
</head>
<body>
<div class="header-bg">
	<div class="wrap"> 
		<div class="h-bg">
			<div class="total">
				<div class="header">
					<jsp:include page="head.jsp" />		
		</div>	
		<div class="menu"> 	
			<div class="top-nav"> 
					<ul>
						<li><a href="index.jsp">主页</a></li>
						<li><a href="about.jsp">详情</a></li>
						<li><a href="#" onclick="selectAllCars('${User.userName }')">车型</a></li>
						<li class="active"><a href="#" onclick="selectCart('${User.userName }')">购物车</a></li>
						<li><a href="contact.jsp" id="info">个人信息</a></li>
						<li><a href="#" onclick="cartOrder('${User.userName }')">订单信息</a></li>
					</ul>
					<div class="clear"></div> 
				</div>
		</div>
		<div class="banner-top">
			<div class="header-bottom">
				 <div class="header_bottom_right_images">
				     	<div class="content-wrapper">		  
						<div class="content-top">
							  	<div class="about_wrapper"><h1>地址信息：</h1>
							  	<table class="userInfo" style="width:100%;">
							  		<tr>
							  			<th>账&nbsp;&nbsp;号</th>
							  			<th>收货人</th>
							  			<th>电话号码</th>
							  			<th>地址</th>
							  		</tr>
							  		<tr>
							  			<td>${User.userName }</td>
							  			<td>${User.realName }</td>
							  			<td>${User.phone }</td>
							  			<td>${User.address }</td>
							  		</tr>
							  	</table>
								</div>
							<div>
							 <div class="text"> 	
									<jsp:include page="cartItems.jsp" />
									<div class="clear"></div>
								</div>
								<!-- <button class="sumBtn"><span>结算</span></button> -->
								</div>
						</div>
						<div class="content-top">
						</div>
				</div>
				
		</div>
		<jsp:include page="right.jsp" />
		<div class="clear"></div>
		
</div>
</div>
</div>
</div>
</div>
</div>

</body>
<script type="text/javascript">
    var flag = "${User.userName }";
	if(flag != "" && flag != null){
		document.getElementById("info").style.display="";
	}else{
		document.getElementById("info").style.display="none";
	}
</script>
</html>

    	
    	
            