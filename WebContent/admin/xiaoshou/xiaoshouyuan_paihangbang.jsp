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
		
		<script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
        <script language="javascript">
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="43" background="<%=path %>/img/tbg.gif"><font color="red">${requestScope.yuefen}</font>&nbsp;&nbsp;销售排行榜&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">销售员</td>
					<td width="10%">销售总价格</td>
		        </tr>	
				<c:forEach items="${requestScope.xiaoshoupaihangpangList}" var="xiaoshoupaihangpang">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 ${xiaoshoupaihangpang.yuangong.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${xiaoshoupaihangpang.xiaoshouzongjia}
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<form action="<%=path %>/xiaoshou?type=xiaoshouyuan_paihangbang" name="form1" method="post">
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			           月份：
			         <input name="yuefen" class="Wdate" readonly="readonly" type="text" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM'})"/>
					 <input type="submit" value="统计"/>
			    </td>
			  </tr>
		    </table>
		    </form>
	</body>
</html>
