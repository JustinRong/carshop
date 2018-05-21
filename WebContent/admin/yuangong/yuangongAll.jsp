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
                 
                 var object=document.getElementsByName("yuangong_id");//返回的obeject是数组
				 for(i=0;i<object.length;i++)
				 {
				      if(object[i].checked==true)
					  {
					      sb.append(object[i].value); 
					  }
				 }
				 window.returnValue = sb.toString();
		         window.close();
            }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="100" background="<%=path %>/images/tbg.gif">&nbsp;客户选择&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				    <td width="7%">姓名</td>
					<td width="7%">性别</td>
					<td width="7%">年龄</td>
					<td width="7%">电话</td>
					
					<td width="7%">住址</td>
					<td width="7%">职位</td>
					<td width="7%">登录权限</td>
					<td width="7%">登录账号</td>
					<td width="7%">登录密码</td>
					<td width="7%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.yuangongList}" var="yuangong">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.sex}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${yuangong.age}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.tel}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.address}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${yuangong.zhiwei}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <c:if test="${yuangong.quanxian==0}">无</c:if>
					    <c:if test="${yuangong.quanxian==1}">销售人员</c:if>
					    <c:if test="${yuangong.quanxian==2}">售后服务员</c:if>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.loginName}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${yuangong.loginPw}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="radio" name="yuangong_id" value="${yuangong.id}"/>
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
