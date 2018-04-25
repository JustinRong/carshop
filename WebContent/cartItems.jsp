<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){ 
	$(".add").click(function(){ 
	var t=$(this).parent().find('input[class*=text_box]'); 
	var cartprice = $(this).parent().find("input[class*=cartPrice]");
	var cartamount = $(this).parent().find("input[class*=cartAmount]");
	t.val(parseInt(t.val())+1) ;
	
	var single = cartprice.val()/cartamount.val();
	
	var num = parseInt(cartamount.val())+1;
	var count = single*num;
	cartamount.val(parseInt(t.val()));
	cartprice.val(parseInt(count));
	}) 
	
	$(".min").click(function(){ 
	var t=$(this).parent().find('input[class*=text_box]'); 
	var cartprice = $(this).parent().find("input[class*=cartPrice]");
	var cartamount = $(this).parent().find("input[class*=cartAmount]");
	t.val(parseInt(t.val())-1) 
	if(parseInt(t.val())<0){ 
	t.val(0); 
	} 
	var single = cartprice.val()/cartamount.val();
	
	var num = parseInt(cartamount.val())-1;
	var count = single*num;
	cartamount.val(parseInt(t.val()));
	cartprice.val(parseInt(count));
	}) 
	
	}) 
</script>
</head>
<body>
<c:forEach items="${Cart }" var="cart" varStatus="status">
<c:if test="${ status.count == 3*(status.index)+1 }">
<div class="grid_1_of_3 images_1_of_3" style="margin-left: 0;">
</c:if>
<c:if test="${ status.count != 3*(status.index)+1 }">
<div class="grid_1_of_3 images_1_of_3" >
</c:if>
										  <div class="grid_1">
										<a href="single.html"><img src="images/pic14.jpg" title="continue reading" alt=""></a>
											<div class="grid_desc">
												<p class="title">${cart.cartThings }</p>
												
													 <div class="price" style="height: 19px;">
													 	 	<%-- <span class="reducedfrom" id="cartPrice${status.count }">￥${cart.cartPrice }</span>  --%>
													 	 	￥<input style="margin-right: 8%;color: #000;font-size: 1.2em;font-weight: bold;width: 20%;border: none;" class="cartPrice" name="" type="text "value="${cart.cartPrice }" disabled="disabled"/>
													 	 	<input class="min" name="" type="button" value="-" /> 
													 	 	<input class="cartAmount" style="display:none" value="${cart.cartAmount }"/>
															<input class="text_box" style="width: 10%;" name="" type="text" value="${cart.cartAmount }" /> 
														 	<input class="add" name="" type="button" value="+" />
													 	 <%-- <span style="float: right">数量：${cart.cartAmount }</span> --%>
													</div>
													<div class="cart-button">
														<div class="cart">
															<button class="button"><span>Details</span></button>
														</div>
														<!-- <button class="button"><span>Cart</span></button> -->
													<div class="clear"></div>
												</div>
											</div>
								</div><div class="clear"></div>
									</div>
</c:forEach>
</body>
</html>