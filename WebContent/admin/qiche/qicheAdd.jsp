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
        <script type="text/JavaScript" src="<%=path %>/js/calendar.js"></script>
        <script language="javascript">
           function checkforcar()
           {
               if(document.formAdd.carBrand.value=="")
               {
                  alert("请输入汽车名称");
                  return false;
               }
               if(document.formAdd.carPrice.value=="")
               {
                  alert("请输入销售价格");
                  return false;
               }
               
                var reg=  /^(-[1-9]|[1-9]|(0[.])|(-(0[.])))[0-9]{0,}(([.]*\d{1,2})|[0-9]{0,})$/;
                var jiage=document.formAdd.carPrice.value; 
				if(reg.test(jiage)==false)
				{
				   alert("价格输入不正确");
				   return false;
				}
               var carBrand = document.formAdd.carBrand.value;
               var carAmount = document.formAdd.carAmount.value;
               var carIn = document.formAdd.carInstruction.value;
               var carDate = document.formAdd.carDate.value;
               $.ajax({
            	   url:'<%=path %>/cars/addCar.action',
            	   data:{"carBrand":carBrand,"carAmount":carAmount,"carPrice":jiage,"carInstruction":carIn,"carDate":carDate},
            	   type:"post",
       			   dataType:"json",
       			   success:function(data){
            		   if(data.key == 1){
            			   alert("入库成功！");
            			   window.location.href= '<%=path %>/admin/qiche/qicheAdd.jsp';
            		   }
            	   }
               })
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>汽车信息管理</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						          汽车品牌：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="carBrand" size="50"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						          销售价格：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="carPrice" size="50"/>(万，小数点后最多两位)
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						        汽车数量：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						         <input type="text" name="carAmount" size="50"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						        汽车说明：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						         <input type="text" name="carInstruction" size="50"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						        入库时间：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						         <input type="text" name="carDate" id="carDate" size="50"/>
						         <img src='<%=path %>/images/cal.gif' alt="" width="16" align="middle" style="cursor: hand" height="16" onclick="selectDate(document.all['carDate'],'yyyy/MM/dd');"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						       <input type="button" value="提交" onclick="checkforcar()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
