<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>information</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
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
						<li><a href="specials.jsp">车型</a></li>
						<li><a href="#" onclick="selectCart('${User.userName }')">购物车</a></li>
						<li><a href="contact.jsp" id="info">个人信息</a></li>
						<li class="active"><a href="order.jsp">订单信息</a></li>
					</ul>
					<div class="clear"></div> 
				</div>
		</div>
		<div class="banner-top">
			<div class="header-bottom">
				 <div class="header_bottom_right_images">
				 	<!-- <div class="about_wrapper"><h1><a style="color:red">*</a> 为必填信息</h1>
					</div> -->
		    <div class="section group">
				<div class="col span_2_of_c">
				  <div class="contact-form">
				  	<h3>订单信息</h3>
					    <jsp:include page="orderItems.jsp" ></jsp:include>
				  </div>
  				</div><div class="clear"></div>
			</div>
		</div>
		<jsp:include page="right.jsp" ></jsp:include>
		<div class="clear"></div>
		
</div>
</div>
</div>
</div>
</div>
</div>
<c:forEach items="${orderCart }" var="order">
${ order.cartThings}
</c:forEach>
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

    	
    	
            