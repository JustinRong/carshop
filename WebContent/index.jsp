<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>Home</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='https://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>  -->  
<!--slider-->
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script src="js/script.js" type="text/javascript"></script>
<script src="js/superfish.js"></script>

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
						<li class="active"><a href="index.jsp">Home</a></li>
						<li><a href="about.jsp">About</a></li>
						<li><a href="specials.jsp">Specials</a></li>
						<li><a href="new.jsp">New</a></li>
						<li id="info"><a href="contact.jsp" >个人信息</a></li>
					</ul>
					<div class="clear"></div> 
				</div>
		</div>
		<div class="banner-top">
			<div class="header-bottom">
				 <div class="header_bottom_right_images">
				     	<div id="slideshow">
							<ul class="slides">
						    	<li><a href="details.html"><canvas ></canvas><img src="images/banner4.jpg" alt="Marsa Alam underawter close up" ></a></li>
						        <li><a href="details.html"><canvas></canvas><img src="images/banner2.jpg" alt="Turrimetta Beach - Dawn" ></a></li>
						        <li><a href="details.html"><canvas></canvas><img src="images/banner3.jpg" alt="Power Station" ></a></li>
						        <li><a href="details.html"><canvas></canvas><img src="images/banner1.jpg" alt="Colors of Nature" ></a></li>
						    </ul>
						    <span class="arrow previous"></span>
						    <span class="arrow next"></span>
				  	</div>
		  			<div class="content-wrapper">		  
						<div class="content-top">
							  	<div class="box_wrapper"><h1>New Products For July</h1>
								</div>
							 <div class="text"> 	
								  <jsp:include page="items.jsp" />
								 <div class="clear"></div> 
								</div>
						</div>
						<div class="content-top">
							  	<div class="box_wrapper"><h1>Featured Products</h1>
								</div>
							 <div class="text"> 	
								<div class="grid_1_of_3 images_1_of_3">
									<div class="grid_1">
										<a href="single.html"><img src="images/pic1.jpg" title="continue reading" alt=""></a>
											<div class="grid_desc">
												<p class="title">Lorem ipsum dolor sitconsectetuer adipiscing elit</p>
												<p class="title1">Lorem ipsum dolor sitconsectetuer adipiscing elit</p>
													 <div class="price" style="height: 19px;">
													 	 <span class="reducedfrom">$12.00</span>
								        				<span class="actual">$66.00</span>
													</div>
													<div class="cart-button">
														<div class="cart">
															<a href="#"><img src="images/cart.png" alt=""/></a>
														</div>
														<button class="button"><span>Details</span></button>
													<div class="clear"></div>
												</div>
											</div>
								</div><div class="clear"></div>
							</div>
									<div class="grid_1_of_3 images_1_of_3">
										  <div class="grid_1">
										<a href="single.html"><img src="images/pic2.jpg" title="continue reading" alt=""></a>
											<div class="grid_desc">
												<p class="title">Lorem ipsum dolor sitconsectetuer adipiscing elit</p>
												<p class="title1">Lorem ipsum dolor sitconsectetuer adipiscing elit</p>
													 <div class="price" style="height: 19px;">
													 	 <span class="reducedfrom">$12.00</span>
								        				<span class="actual">$66.00</span>
													</div>
													<div class="cart-button">
														<div class="cart">
															<a href="#"><img src="images/cart.png" alt=""/></a>
														</div>
														<button class="button"><span>Details</span></button>
													<div class="clear"></div>
												</div>
											</div>
								</div><div class="clear"></div>
									</div>
									<div class="grid_1_of_3 images_1_of_3">
										  <div class="grid_1">
										<a href="single.html"><img src="images/pic3.jpg" title="continue reading" alt=""></a>
											<div class="grid_desc">
												<p class="title">Lorem ipsum dolor sitconsectetuer adipiscing elit</p>
												<p class="title1">Lorem ipsum dolor sitconsectetuer adipiscing elit</p>
													 <div class="price" style="height: 19px;">
													 	 <span class="reducedfrom">$12.00</span>
								        				<span class="actual">$66.00</span>
													</div>
													<div class="cart-button">
														<div class="cart">
															<a href="#"><img src="images/cart.png" alt=""/></a>
														</div>
														<button class="button"><span>Details</span></button>
													<div class="clear"></div>
												</div>
											</div>
								</div><div class="clear"></div>
									</div><div class="clear"></div>
								</div>
						</div>
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
							Now in your cart&nbsp;<strong> ${Cart } items</strong>
							</div>	
				</div>
				<div class="box-title">
					<h1><span class="title-icon"></span><a href="">Branches</a></h1>
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
				<div class="clear"></div>
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

    	
    	
            