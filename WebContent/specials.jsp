<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>Specials</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/menu.js">
</script>
<script src="js/cars.js" type="text/javascript"></script>
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
						<li><a href="about.jsp">详情</a></li>
						<li class="active"><a href="#" onclick="selectAllCars('${User.userName }')">车型</a></li>
						<li><a href="#" onclick="selectCart('${User.userName }')">购物车</a></li>
						<li><a href="contact.jsp" id="info">个人信息</a></li>
					</ul>
					<div class="clear"></div> 
				</div>
		</div>
		<div class="banner-top">
			<div class="header-bottom">
				 <div class="header_bottom_right_images">
				     	
		  			<div class="content-wrapper">		  
						<div class="content-top">
							  	<div class="about_wrapper"><h1>Specials</h1>
								</div>
							 <div class="text"> 	
							 	<jsp:include page="allCarsItems.jsp" ></jsp:include>
								<div class="clear"></div>
								</div>
						</div>
						<div class="content-top">
							  	<div class="box_wrapper"><h1>Featured Products</h1>
								</div>
							 <div class="text"> 	
								<div class="grid_1_of_3 images_1_of_3">
									<div class="grid_1">
										<a href="single.html"><img src="images/pic15.jpg" title="continue reading" alt=""></a>
											<div class="grid_desc">
												<p class="title">Lorem ipsum dolor sitconsectetuer adipiscing elit</p>
												
													 <div class="price" style="height: 19px;">
													 	 <span class="reducedfrom">$66.00</span>
								        				<span class="actual">$12.00</span>
													</div>
													<div class="cart-button">
														<div class="cart">
															<button class="button"><span>Details</span></button>
														</div>
														<button class="button"><span>Cart</span></button>
													<div class="clear"></div>
												</div>
											</div>
								</div><div class="clear"></div>
							</div>
									<div class="grid_1_of_3 images_1_of_3">
										  <div class="grid_1">
										<a href="single.html"><img src="images/pic16.jpg" title="continue reading" alt=""></a>
											<div class="grid_desc">
												<p class="title">Lorem ipsum dolor sitconsectetuer adipiscing elit</p>
												
													 <div class="price" style="height: 19px;">
													 	 <span class="reducedfrom">$66.00</span>
								        				<span class="actual">$12.00</span>
													</div>
													<div class="cart-button">
														<div class="cart">
															<button class="button"><span>Details</span></button>
														</div>
														<button class="button"><span>Cart</span></button>
													<div class="clear"></div>
												</div>
											</div>
								</div><div class="clear"></div>
									</div>
									<div class="grid_1_of_3 images_1_of_3">
										  <div class="grid_1">
										<a href="single.html"><img src="images/pic17.jpg" title="continue reading" alt=""></a>
											<div class="grid_desc">
												<p class="title">Lorem ipsum dolor sitconsectetuer adipiscing elit</p>
												
													 <div class="price" style="height: 19px;">
													 	 <span class="reducedfrom">$66.00</span>
								        				<span class="actual">$12.00</span>
													</div>
													<div class="cart-button">
														<div class="cart">
															<button class="button"><span>Details</span></button>
														</div>
														<button class="button"><span>Cart</span></button>
													<div class="clear"></div>
												</div>
											</div>
								</div><div class="clear"></div>
									</div><div class="clear"></div>
								</div>
						</div>
				</div>
				<div class="paging">
		            <ul>
		                <li><a href="#" target="_parent">Previous</a></li>
		                <li><a href="#" target="_parent">1</a></li>
		                <li><a href="#" target="_parent">2</a></li>
		                <li><a href="#" target="_parent">3</a></li>
		                <li><a href="#" target="_parent">4</a></li>
		                <li><a href="#" target="_parent">5</a></li>
		                <li><a href="#" target="_parent">6</a></li>
		                <li><a href="#" target="_parent">Next</a></li>
		            </ul>
       			</div>
		</div>
		<div class="header-para">
				<div class="categories">
						<div class="list-categories">
							<div class="first-list">
								<div class="div_2"><a href="">Cars</a></div>
								<div class="div_img">
									<img src="images/car1.jpg" alt="Cars" title="Cars" width="60" height="39">
								</div><div class="clear"></div>
							</div>
							<div class="first-list">
								<div class="div_2"><a href="">Rental</a></div>
								<div class="div_img">
									<img src="images/car2.jpg" alt="Cars" title="Cars" width="60" height="39">
								</div><div class="clear"></div>
							</div>
							<div class="first-list">
								<div class="div_2"><a href="">Banking</a></div>
								<div class="div_img">
									<img src="images/car3.jpg" alt="Cars" title="Cars" width="60" height="39">
								</div><div class="clear"></div>
							</div>
							<div class="first-list">
								<div class="div_2"><a href="">Trucks</a></div>
								<div class="div_img">
									<img src="images/car4.jpg" alt="Cars" title="Cars" width="60" height="39">
								</div><div class="clear"></div>
							</div>
				</div>
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
	</div><div class="clear"></div>
		
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

    	
    	
            