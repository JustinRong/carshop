<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
Date date = new Date();
SimpleDateFormat ft = new SimpleDateFormat ("yyyy/MM/dd HH:mm:ss");
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
        	   if(document.formCheck.checkCarId.value==""){
        		   alert("汽车编号不能为空！");
        		   return false;
        	   }
               if(document.formCheck.checkCarBrand.value=="")
               {
                  alert("请输入汽车名称");
                  return false;
               }
               if (document.formCheck.checkPerson.value==""){
            	   alert("发现人不能为空！");
            	   return false;
               }
               if(document.formCheck.checkDate.value=="")
               {
                  alert("检测时间不能为空！");
                  return false;
               }
               var CarId = document.formCheck.checkCarId.value;
               var carBrand = document.formCheck.checkCarBrand.value;
               var checkPerson = document.formCheck.checkPerson.value;
               var checkLink = document.formCheck.checkLink.value;
               var checkIns = document.formCheck.checkIns.value;
               var checkDate = document.formCheck.checkDate.value;
               var files = new FormData($("#uploadFiles")[0]);
               $.ajax({
            	   url:'<%=path %>/check/checkAdd.action',
            	   data:{"checkCarId":CarId,"checkCarBrand":carBrand,"checkPerson":checkPerson,"checkLink":checkLink,"checkIns":checkIns,"checkDate":checkDate},
            	   type:"post",
            	   dataType:"json",
            	   success:function(data){
            		   if(data.key==1){
            			   $.ajax({
            				   url:'<%=path %>/check/uploadFiles.action',
            				   data:files,
            				   type:'post',
            				   async: false,  
            		           cache: false,  
            		           contentType: false,  
            		           processData: false,
            		           dataType:"json",
            		           success:function(Rdata){
            		        	   if(Rdata.key==1){
            		        		   alert("上传信息成功！");
                        			   window.location.href= '<%=path %>/admin/qiche/qicheCheck.jsp';
            		        	   }
            		           }
            			   })
            		   }
            	   }
               })
           }
           
           function addFile(){
        	   var btn=document.getElementById("btn");
        	   var newChild = document.createElement("input");
        	   newChild.setAttribute("type","file");
        	   newChild.setAttribute("name","upload");
        	   btn.parentNode.appendChild(newChild);
        	   btn.parentNode.appendChild(document.createElement("br"));
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action='' name="formCheck" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>汽车检测管理</span></td>
					    </tr>
					    <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						        汽车编号：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						         <input type="text" name="checkCarId" id="checkCarId" size="50"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						          汽车品牌：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="checkCarBrand" id="checkCarBrand" size="50"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						          发现人：
						    </td>
						     <c:if test="${sessionScope.userType==0}">
						      <td width="85%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="checkPerson" id="checkPerson" value="系统管理员" size="50"/>
						      </td>
			        	    </c:if>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						        发现质损环节：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						         <select class="xiala" name="checkLink" id="checkLink" style="width:120px;">
									<option value="99" selected="selected">全选</option>
									<option value="0" >出库环节</option>
									<option value="1" >入库环节</option>
								</select>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						        汽车说明：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						         <!-- <input type="text" name="carInstruction" size="50"/> -->
						         <textarea name="checkIns" id="checkIns" rows="" cols="" style="margin: 0px; width: 356px; height: 64px;"></textarea>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						        检查时间：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						         <input type="text" name="checkDate" id="checkDate" value='<%=ft.format(date) %>' size="50"/>
						         <img src='<%=path %>/images/cal.gif' alt="" width="16" align="middle" style="cursor: hand" height="16" onclick="selectDate(document.all['checkDate'],'yyyy/MM/dd');"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						          附件：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left" >
						    <form action="#" id="uploadFiles" enctype="multipart/form-data">
						        <input type="file" multiple="multiple" name="upload" value="提交附件" id="" size="50"/>
						        <input type="button" id="btn" value="继续添加" onclick="addFile()"/><br/>
						    </form>
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
