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
            
            function changeIssue(checkId) {
				if (checkId !=null &&checkId!="") {
					$.ajax({
						url:'<%=path %>/check/updateCheck.action',
						data:{"checkId":checkId},
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.key==1){
								alert("确定修改成功！");
								window.location.reload();
							}
							if(data.key==0){
								alert("修复失败");
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
					<td width="15%">发现人</td>
					<td width="15">发现环节</td>
					<td width="15">情况说明</td>
					<td width="15">发现时间</td>
					<td width="15">相关附件</td>
					<td width="15">操&nbsp;&nbsp;&nbsp;作</td>
		        </tr>	
				<c:forEach items="${sessionScope.allChecks}" var="qiche">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 ${qiche.checkCarId}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${qiche.checkCarBrand}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${qiche.checkCarPerson}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<c:if test="${qiche.checkLink==99}">入库和出库</c:if>
						<c:if test="${qiche.checkLink==0}">出库环节</c:if>
						<c:if test="${qiche.checkLink==1}">入库环节</c:if>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${qiche.checkInstruction}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${qiche.checkDate}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 无
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 <a href="#" onclick="changeIssue('${qiche.checkId}')">修复</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			
	</body>
</html>
