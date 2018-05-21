<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
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
           function check()
           {
               if(document.formAdd.shijian.value=="")
               {
                  alert("请输入销售时间");
                  return false;
               }
               if(document.formAdd.kehu_id.value=="")
               {
                  alert("请选择客户");
                  return false;
               }
               if(document.formAdd.qiche_id.value=="")
               {
                  alert("请选择汽车");
                  return false;
               }
               document.formAdd.submit();
           }
           
           
           function qicheAll()
			{
				var strUrl = "<%=path %>/qiche?type=qicheAll";
				var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
			    if(ret==undefined)
			    {
			        ret="";
			    }
			    document.getElementById("qiche_id").value=ret;
			}
			
			function kehuAll()
			{
				var strUrl = "<%=path %>/kehu?type=kehuAll";
				var ret = window.showModalDialog(strUrl,"","dialogWidth:950px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
			    if(ret==undefined)
			    {
			        ret="";
			    }
			    document.getElementById("kehu_id").value=ret;
			}
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/shouhou?type=shouhouAdd" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>售后服务管理</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						          时间：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						        <input name="shijian" class="Wdate" readonly="readonly" type="text" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						          客户：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="kehu_id" id="kehu_id" size="20" readonly="readonly"/>
						        <input type="button" value="选择" onclick="kehuAll()"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						          汽车：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="qiche_id" id="qiche_id" size="20" readonly="readonly"/>
						        <input type="button" value="选择" onclick="qicheAll()"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						        备注信息：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						        <FCK:editor instanceName="beizhu"  basePath="/fckeditor" width="400" height="140" value="请输入内容" toolbarSet="Basic">
	                            </FCK:editor>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						       <input type="button" value="提交" onclick="check()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
