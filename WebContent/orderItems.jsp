<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<form method="post" action="">
	<table>
					    	<tr>
					    		<th><span><label>订单人：</label></span></th>
						    	<th><span><label>汽车名称：</label></span></th>
						    	<th><span><label>价格：</label></span></th>
						    	<th><span><label>数量：</label></span></th>
						    	<th><span><label>地址：</label></span></th>
						    	<th><span><label>状态：</label></span></th>
						    </tr>
						    <c:forEach items="${orderCart }" var="order">
					    	<tr>
					    		<td><span><input name="" type="text" class="textbox" value="${userForOrder.realName}" disabled="disabled"></span></td>
						    	<td><span><input name="" type="text" class="textbox" value="${order.cartThings}" disabled="disabled"></span></td>
						    	<td><span><input name="" type="text" class="textbox" value="${order.cartPrice}" disabled="disabled"></span></td>
						    	<td><span><input name="" type="text" class="textbox" value="${order.cartAmount}" disabled="disabled"></span></td>
						    	<td><span><input name="" type="text" class="textbox" value="${userForOrder.address}" disabled="disabled"></span></td>
						    	<td><span><input name="" type="text" class="textbox" value="买家已下单" disabled="disabled"></span></td>
						    </tr>
						    </c:forEach>
		</table>
</form>

</body>
</html>