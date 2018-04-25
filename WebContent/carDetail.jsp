<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>About</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='https://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>   
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
						<li><a href="index.jsp">Home</a></li>
						<li class="active"><a href="about.jsp">About</a></li>
						<li><a href="specials.jsp">Specials</a></li>
						<li><a href="new.jsp">New</a></li>
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
		<div class="header-para">
				<div class="categories">
						
				<div class="box"> 
							<div class="box-heading"><h1><a href="#">Cart:&nbsp;</a></h1></div>
							 <div class="box-content">
							Now in your cart&nbsp;<strong> 0 items</strong>
							</div>	
				</div>
				<div class="box-title">
					<h1><span class="title-icon"></span><a href="">Specials</a></h1>
				</div>
				<div class="section group example">
					<div class="col_1_of_2 span_1_of_2">
					  <img src="images/pic21.jpg" alt=""/>
					   <img src="images/pic24.jpg" alt=""/>
					   <img src="images/pic25.jpg" alt=""/>
					   <img src="images/pic27.jpg" alt=""/>
	 				</div>
					<div class="col_1_of_2 span_1_of_2">
						 <img src="images/pic22.jpg" alt=""/>
					  	<img src="images/pic23.jpg" alt=""/>
					  	<img src="images/pic26.jpg" alt=""/>
					  	<img src="images/pic28.jpg" alt=""/>
					  </div><div class="clear"></div>
		   		 </div>
				</div>
	</div>
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

    	
    	
            