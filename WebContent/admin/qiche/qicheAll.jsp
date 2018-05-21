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
            
            function queding()
            {
                 var sb = new StringBuffer(); 
                 
                 var object=document.getElementsByName("qiche_id");//返回的obeject是数组
				 for(i=0;i<object.length;i++)
				 {
				      if(object[i].checked==true)
					  {
					      sb.append(object[i].value); 
					  }
				 }
				 var carId = sb.toString();
				 $.ajax({
					 url:'<%=path %>/cars/searchOneCar.action',
					 data:{"carId":carId},
					 type:"post",
					 dataType:"json",
					 success:function(data){
						 if(data.key==1){
							 window.location.href='<%=path %>/admin/qiche/qicheEdit.jsp';
						 }
						 if(data.key==0){
							 alert("没有这辆车");
						 }
					 }
				 })
            }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="100" background="<%=path %>/images/tbg.gif">&nbsp;汽车选择&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				    <td width="25%">汽车名称</td>
					<td width="25%">销售价格&nbsp;&nbsp;(万元)</td>
					<td width="25%">汽车数量</td>
					<td width="7%">操作</td>
		        </tr>	
				<c:forEach items="${sessionScope.allCars}" var="qiche">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 ${qiche.carBrand}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${qiche.carPrice}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${qiche.carAmount}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="radio" name="qiche_id" value="${qiche.carId}"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
				  <tr>
				    <td>
				      <input type="button" value="确定" style="width: 80px;" onclick="queding()" />
				    </td>
				  </tr>
			</table>
	</body>
</html>
