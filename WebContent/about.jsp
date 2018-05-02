<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>About</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/menu.js">
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
				 	<div class="about_wrapper"><h1>Long-Term Business</h1>
					</div>
				    <div class="about-group">
		  			<div class="about-top">	
						<div class="grid images_3_of_1">
							<img src="images/pic7.jpg" alt=""/>
						</div>
						<div class="grid span_2_of_3">
							<h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure.</p>
						</div><div class="clear"></div> 
					</div>
			   <p class="about-para">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.aliquam erat vol.</p><div class="clear"></div>
			  	<button class="btn btn-6 btn-6a">Read More</button> 
			   <div class="team">
						<h2>Management Team</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.Ut enim ad minim veniam, quis nostrud exercitation.</p>
					    <div class="section group">
							<div class="grid_1_of_3 images_1_of_3">
								  <img src="images/pic8.jpg" alt=""/>
								  <h3>Jacalyn Markel</h3>
								  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
							</div>
							<div class="grid_1_of_3 images_1_of_3">
								  <img src="images/pic9.jpg" alt=""/>
								  <h3>Steven Burge</h3>
								  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
							</div>
							<div class="grid_1_of_3 images_1_of_3">
								  <img src="images/pic10.jpg" alt=""/>
								  <h3>Jon Mackenzie </h3>
								  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
							</div><div class="clear"></div> 
				        </div>
				  </div>
				  <div class="about-bottom">	
						<div class="grid span_2_of_a">
							<h4>Our History</h4>
							<ul class="list-2">
                        <li><span><a href="#">1990&nbsp;&nbsp;&nbsp;:</a>&nbsp;&nbsp;&nbsp;soluta nobis eleifend option congue nihil imperdiet doming augue duis dolore te feugait nulla facilisi. Nam liber tempo</span></li>
                        <li><span><a href="#">1996&nbsp;&nbsp;&nbsp;:</a>&nbsp;&nbsp;&nbsp; soluta nobis eleifend option congue nihil imperdiet doming augue duis dolore te feugait nulla facilisi. Nam liber tempo</span></li>
                        <li><span><a href="#">2008&nbsp;&nbsp;&nbsp;:</a>&nbsp;&nbsp;&nbsp; Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper</span></li>
                    </ul>
						</div><div class="clear"></div> 
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

    	
    	
            