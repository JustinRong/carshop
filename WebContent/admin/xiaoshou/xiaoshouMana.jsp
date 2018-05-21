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
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
           function xiaoshouAdd()
           {
              var url="<%=path %>/admin/xiaoshou/xiaoshouAdd.jsp";
              window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="43" background="<%=path %>/img/tbg.gif">&nbsp;销售管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">销售时间</td>
					<td width="10%">销售价格</td>
					<td width="10%">汽车</td>
					<td width="10%">客户</td>
					<td width="10%">销售员</td>
					<td width="10%">备注信息</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.xiaoshouList}" var="xiaoshou">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 ${xiaoshou.shijian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${xiaoshou.jiage}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${xiaoshou.qiche.mingcheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${xiaoshou.kehu.mingcheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${xiaoshou.yuangong.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <c:out value="${xiaoshou.beizhu}" escapeXml="false"></c:out>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a class="pn-loperator" href="<%=path %>/xiaoshou?type=xiaoshouDel&id=${xiaoshou.id}">删除</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="xiaoshouAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
