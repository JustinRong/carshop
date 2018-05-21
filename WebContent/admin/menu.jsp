<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path %>/css/base.css" type="text/css" />
	<link rel="stylesheet" href="<%=path %>/css/menu.css" type="text/css" />
	<style type="text/css">
	    div {
			padding:0px;
			margin:0px;
		}
		
		body {
		 scrollbar-base-color:#bae87c;
		 scrollbar-arrow-color:#FFFFFF;
		 scrollbar-shadow-color:#c1ea8b;
		 padding:0px;
		 margin:auto;
		 text-align:center;
		 background-color:#9ad075;
		}
		
		dl.bitem {
			width:148px;
			margin:0px 0px 5px 4px;
		}
		
		dl.bitem dt {
		  background:url(<%=path %>/img/menubg.gif);
		  height:26px;
		  line-height:26px;
		  text-align:center;
		  cursor:pointer;
		}
		
		dl.bitem dd {
		  padding:3px 3px 3px 3px;
		  background-color:#fff;
		}
		
		.fllct
		{
			float:left;
			
			width:90px;
		}
		
		.flrct
		{
			padding-top:3px;
			float:left;
		}
		
		div.items
		{
			line-height:22px;
			background:url(<%=path %>/img/arr4.gif) no-repeat 10px 9px;
		}
		
		span.items
		{
			padding:10px 0px 10px 22px;
			background:url(<%=path %>/img/arr4.gif) no-repeat 10px 12px;
		}
		
		ul {
		  padding-top:3px;
		}
		
		li {
		  height:22px;
		}
		
		.sitemu li {
			padding:0px 0px 0px 22px;
			line-height:24px;
			background:url(<%=path %>/img/arr4.gif) no-repeat 10px 9px;
		}
	</style>
	<script language='javascript'>var curopenItem = '1';</script>
	<script language="javascript" type="text/javascript" src="<%=path %>/js/menu1.js"></script>
	<script language="javascript" type="text/javascript" src="<%=path %>/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
	function selectAllCars(){
			$.ajax({
				url:'<%=path %>/cars/selectAllCars.action',
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.key==1){
						var qicheAll = document.getElementById("qicheAll");
						qicheAll.setAttribute("href",'<%=path %>/admin/qiche/qicheAll.jsp');
					}
				}
			})
	}
	
	function selectAllCheck(){
		$.ajax({
			url:'<%=path %>/check/selectAllCheck.action',
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.key==1){
					var checkAll = document.getElementById("checkAll");
					checkAll.setAttribute("href",'<%=path %>/admin/qiche/checkAll.jsp');
				}
			}
		})
	}
	
	
	function selectAllBorders(){
		$.ajax({
			url:'<%=path %>/cart/selectAllOrder.action',
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.key==1){
					var checkAll = document.getElementById("allBorders");
					checkAll.setAttribute("href",'<%=path %>/admin/xiaoshou/allOrders.jsp');
				}
				if(data.key==2){
					alert("没有订单");
				}
				if(data.key==3){
					alert("没有该用户");
				}
			}
		})
	}
	</script>
	<base target="main" />
  </head>
  
  <body target="main">
    <c:if test="${sessionScope.userType==0}">
	<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
	  <tr>
	    <td style='padding-left:3px;padding-top:8px' valign="top">
	      <dl class='bitem'>
	        <dt onClick='showHide("items1_1")'><b>修改个人密码</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/admin/userinfo/userPw.jsp' target='main'>修改个人密码</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("items1_1")'><b>汽车信息管理</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/admin/qiche/qicheAdd.jsp' target='main'>汽车信息添加</a> </li>
	            <li><a onclick="selectAllCars()" id="qicheAll" target='main'>汽车信息管理</a> </li>
	            <li><a href='<%=path %>/admin/qiche/qicheCheck.jsp' target='main'>汽车检测管理</a> </li>
	            <li><a onclick="selectAllCheck()" id="checkAll" target='main'>汽车检测信息</a> </li>
	          </ul>
	        </dd>
	      </dl>
	     
	      
	      <dl class='bitem'>
	        <dt onClick='showHide("items1_1")'><b>销售信息管理</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'>
	            <li><a onclick="selectAllBorders()" id="allBorders" target='main'>销售信息管理</a> </li>
	          </ul>
	        </dd>
	      </dl>
		</td>
	  </tr>
	</table>
	</c:if>
	<c:if test="${sessionScope.userType==1}">
	<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
	  <tr>
	    <td style='padding-left:3px;padding-top:8px' valign="top">
	      <dl class='bitem'>
	        <dt onClick='showHide("items1_1")'><b>客户信息管理</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/admin/kehu/kehuAdd.jsp' target='main'>客户信息添加</a> </li>
	            <li><a href='<%=path %>/kehu?type=kehuMana' target='main'>客户信息管理</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("items1_1")'><b>销售信息管理</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/admin/xiaoshou/xiaoshouAdd.jsp' target='main'>销售信息添加</a> </li>
	            <li><a href='<%=path %>/xiaoshou?type=xiaoshouMana' target='main'>销售信息管理</a> </li>
	            <li><a href='<%=path %>/xiaoshou?type=xiaoshouyuan_paihangbang' target='main'>销售---排行榜</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("items1_1")'><b>系统公告信息</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/gonggao?type=gonggaoAll' target='main'>公告信息浏览</a> </li>
	          </ul>
	        </dd>
	      </dl>
		</td>
	  </tr>
	</table>
	</c:if>
	<c:if test="${sessionScope.userType==2}">
	<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
	  <tr>
	    <td style='padding-left:3px;padding-top:8px' valign="top">
	      <dl class='bitem'>
	        <dt onClick='showHide("items1_1")'><b>售后服务管理</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/admin/shouhou/shouhouAdd.jsp' target='main'>售后服务添加</a> </li>
	            <li><a href='<%=path %>/shouhou?type=shouhouMana' target='main'>售后服务管理</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("items1_1")'><b>系统公告信息</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/gonggao?type=gonggaoAll' target='main'>公告信息浏览</a> </li>
	          </ul>
	        </dd>
	      </dl>
		</td>
	  </tr>
	</table>
	</c:if>
  </body>
</html>
