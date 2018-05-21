<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="com.myit.scm.entity.Check"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.js"></script>
        <script language="javascript">
            function StringBuffer()
            { 
			   this._strs = new Array; 
			} 
			StringBuffer.prototype.append = function (str) 
			{ 
			   this._strs.push(str); //添加
			} 
			StringBuffer.prototype.pop = function (str) 
			{ 
			   this._strs.pop(str); //删除最后一个
			} 
			StringBuffer.prototype.toString = function()
		    { 
			   return this._strs.join(","); 
			}
            
            function outCar(cartId) {
            	debugger;
				if (cartId !=null &&cartId!="") {
					$.ajax({
						url:'<%=path %>/cart/updateCartOrder.action',
						data:{"cartId":cartId},
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.key==1){
								alert("出库成功！");
								window.location.reload();
							}
							if(data.key==0){
								alert("出库失败");
							}
						}
					})
				}
			}
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="100" background="<%=path %>/images/tbg.gif">&nbsp;汽车检查列表</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				    <td width="15%">汽车编号</td>
					<td width="15%">汽车名称</td>
					<td width="15%">汽车价格</td>
					<td width="15">汽车数量</td>
					<td width="15">客户姓名</td>
					<td width="15">客户电话</td>
					<td width="15">客户地址</td>
					<td width="15">客户身份证号</td>
					<td width="15">是否下单</td>
					<td width="15">操&nbsp;&nbsp;&nbsp;作</td>
		        </tr>	
				<c:forEach items="${sessionScope.allOrders}" var="allOrders">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 ${allOrders.carId}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${allOrders.carBrand}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${allOrders.carPrice}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${allOrders.carAmount}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${allOrders.username}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${allOrders.phone}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${allOrders.address}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${allOrders.cardId}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<c:if test="${allOrders.isPay==1}">已下单</c:if> 
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 <c:if test="${allOrders.isOrder==0}"><a href="#" onclick="outCar('${allOrders.cartId}')">出库</a></c:if> 
					</td>
				</tr>
				</c:forEach>
			</table>
			
	</body>
</html>
