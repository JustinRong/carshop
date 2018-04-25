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
	function addCars(carId){
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
</script>
<script type="text/javascript">
	$(function(){
		$(".button").click(function(){
			debugger;
			var carId=$(this).parent().find('input[class*=text_box]').val(); 
			$.ajax({
				url:"./cars/searchOneCar.action",
				data:{"carId":carId},
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.url!=null){
						window.location.href=data.url;
					}
				},
				error:function(XMLHttpRequest, textStatus, errorThrown){
					 // 状态码
                    console.log(XMLHttpRequest.status);
                    // 状态
                    console.log(XMLHttpRequest.readyState);
                    // 错误信息   
                    console.log(textStatus);
				}
			})
		})
	})
</script>
</head>
<body>
<c:forEach items="${Cars }" var="item" varStatus="status">
<%-- <c:if test="${status.count ==1 }"> </c:if> --%>
<c:if test="${ status.count == 3*(status.index)+1 }">
<div class="grid_1_of_3 images_1_of_3" style="margin-left: 0;">
</c:if>
<c:if test="${ status.count != 3*(status.index)+1 }">
<div class="grid_1_of_3 images_1_of_3" >
</c:if>
										  <div class="grid_1">
										<a href="single.html"><img src="${item.carUrl }" title="continue reading" alt=""></a>
											<div class="grid_desc">
												<p class="title">${item.carBrand }</p>
												<p class="title1">${item.carInstruction }</p>
													 <div class="price" style="height: 19px;">
													 	 <span class="reducedfrom">￥${item.carPrice }</span>
													 	 <span class="actual">$66.00</span>
							        				<span style="float: right">剩下数量：${item.carAmount }</span>
												</div>
													<div class="cart-button">
													<div class="cart">
															<a href="#" onclick="addCars(${item.carId })"><img src="images/cart.png" alt=""/></a>
														</div>
														<button class="button"><span>Details</span></button>
														<input class="text_box" style="display:none" value="${item.carId}"/>
													<div class="clear"></div>
												</div>
											</div>
								</div><div class="clear"></div>
									</div>
</c:forEach>
</body>
</html>