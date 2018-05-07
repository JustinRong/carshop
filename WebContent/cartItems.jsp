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
	
$(function(){
	$(".button2").click(function(){
		var cartId=$(this).parent().find('input[class*=cart_id]').val();
		var carId=$(this).parent().find('input[class*=car_id]').val();
		var cartamount = $(this).parent().find("input[class*=cartAmount]").val();
		if(carId!=null &&carId!="" &&cartamount!=null && cartamount!=""){
			$.ajax({
				url:"./cart/buyCar.action",
				data:{"cartId":cartId,"cartAmount":cartamount,"carId":carId},
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.key==1){
						alert("购买成功！");
						window.location.href="new.jsp";
					}else{
						alert("购买失败！");
					}
				}
			})
		}
	})
})

$(function(){
	$(".button1").click(function(){
		debugger;
		var cartId=$(this).parent().find('input[class*=cart_id]').val();
		var carId=$(this).parent().find('input[class*=car_id]').val();
		if(carId!=null &&carId!="" &&cartId!=null &&cartId!=""){
			$.ajax({
				url:"./cart/deleteCar.action",
				data:{"cartId":cartId,"carId":carId},
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.key==1){
						alert("删除成功！");
						window.location.href="new.jsp";
					}else{
						alert("删除失败！");
					}
				}
			})
		}
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
											<!-- <div><input type="checkbox" name="" value=""></div> -->
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
													 	 	<div class="clear"></div>
													 	 	<button class="button1"><span>删除</span></button>
															<button class="button2"><span>购买</span></button>
															<input class="cart_id" style="display:none" value="${cart.cartId}"/>
															<input class="car_id" style="display:none" value="${cart.carId}"/>
													</div>
													
													<div class="cart-button" style="margin-top: 10%;">
														<div class="cart">
															<button class="button"><span>Details</span></button>
															<input class="text_box" style="display:none" value="${cart.carId}"/>
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