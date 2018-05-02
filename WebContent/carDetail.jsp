<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>About</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.8.3.js"></script> 
<script type="text/javascript" src="js/menu.js"></script> 
<script type="text/javascript">
function addCars(carId){
	debugger;
		var username= "${User.userName }";
		if (username == "" || username == null){
			alert("您还没登录，请先登录！");
			return false;
		}
		alert(carId);
		$.ajax({
			url:"./cart/addCart.action",
			data:{"carId":carId,"amount":1,"userName":username},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.key == 0) {
					alert("添加购物车成功！");
					searchCars();
				}
			}
		})
	}
	
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
<div class="header-bg">
	<div class="wrap"> 
		<div class="h-bg">
			<div class="total">
				<div class="header">
					<jsp:include page="head.jsp"></jsp:include>		
		</div>	
		<div class="menu"> 	
			<div class="top-nav"> 
					<ul>
						<li><a href="index.jsp">主页</a></li>
						<li class="active"><a href="about.jsp">详情</a></li>
						<li><a href="specials.jsp">车型</a></li>
						<li><a href="#" onclick="selectCart('${User.userName }')">购物车</a></li>
						<li><a href="contact.jsp" id="info">个人信息</a></li> 
					</ul>
					<div class="clear"></div> 
				</div>
		</div>
		<div class="banner-top">
			<div class="header-bottom">
				 <div class="header_bottom_right_images">
				 	<div class="about_wrapper"><h1>汽车具体信息</h1>
					</div>
				    <div class="grid_1_of_3 images_1_of_3" >
				    <div class="grid_1">
										<a href="single.html"><img src="${carDetail.carUrl }" title="continue reading" alt=""></a>
											<div class="grid_desc">
												<p class="title">${carDetail.carBrand }</p>
												<p class="title1">${carDetail.carInstruction }</p>
													 <div class="price" style="height: 19px;">
													 	 <span class="reducedfrom">￥${carDetail.carPrice }</span>
													 	 <span class="actual">$66.00</span>
							        				<span style="float: right">剩下数量：${carDetail.carAmount }</span>
												</div>
												
												<div style="padding: 5% 0;">
													<table>
													<tr>
														<td>厂商：</td>
														<td>${carDetails.carVendor }</td>
													</tr>
													<tr>
														<td>级别：</td>
														<td>${carDetails.carLevel }</td>
													</tr>
													<tr>
														<td>能源类型：</td>
														<td>${carDetails.carEnergyType }</td>
													</tr>
													<tr>
														<td>上市时间：</td>
														<%-- <td>${carDetails.carTimeToMarket }</td> --%>
														<td><fmt:formatDate value="${carDetails.carTimeToMarket }" pattern="yyyy-MM"/></td>
													</tr>
													<tr>
														<td>最大功率(kw)：</td>
														<td>${carDetails.carMaxPower }</td>
													</tr>
													<tr>
														<td>最大扭矩：</td>
														<td>${carDetails.carMaxTorque }</td>
													</tr>
													<tr>
														<td>发动机：</td>
														<td>${carDetails.carEngine }</td>
													</tr>
													<tr>
														<td>变速箱：</td>
														<td>${carDetails.carTransmission }</td>
													</tr>
													<tr>
														<td>车身：</td>
														<td>${carDetails.carBody }</td>
													</tr>
													<tr>
														<td>车身结构(mm)：</td>
														<td>${carDetails.carBodyStructure }</td>
													</tr>
													<tr>
														<td>最高时速(km/h)：</td>
														<td>${carDetails.carHighestSpeed }</td>
													</tr>
													<tr>
														<td>0-100km/h加速秒数(s)：</td>
														<td>${carDetails.carAccelerationSeconds }</td>
													</tr>
													<tr>
														<td>整车质保：</td>
														<td>${carDetails.carVehicleWarranty }</td>
													</tr>
													</table>
												</div>
											
												<div class="cart-button">
													<div class="cart">
															<a href="#" onclick="addCars(${carDetail.carId })"><img src="images/cart.png" alt=""/></a>
														</div>
														<input class="text_box" style="display:none" value="${carDetail.carId}"/>
													<div class="clear"></div>
												</div>
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
${carDetails.carEnergyType }
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

    	
    	
            