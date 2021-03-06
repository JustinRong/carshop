<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>information</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/menu.js">
</script>  
<script src="js/cars.js" type="text/javascript"></script>
<script type="text/javascript">
	function judeInput(){
		var realname = document.getElementById("realname");
		var email = document.getElementById("email");
		var phone = document.getElementById("phone");
		var idnum = document.getElementById("idnum");
		var address = document.getElementById("address");
		if (realname.value == "" || realname.value == null){
			alert("姓名不能为空！");
			realname.focus();
			return false;
		}
		if(phone.value == "" || phone.value == null) {
			alert("联系电话不能为空！");
			phone.focus();
			return false;
		}
		if (phone.value != "" && phone.value != null){
			var phoneValue = phone.value;
			var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
			if (!myreg.test(phone.value)){
				alert("手机号码格式不正确！");
				phone.focus();
				return false;
			}
		}
		debugger;
		if (email.value != "" && email.value != null){
			var emaiValue = email.value;
			var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); 
			if (!reg.test(email.value)){
				alert("邮箱格式错误");
				email.focus();
				return false;
			}
		}
		if (email.value == "" && email.value == null){
			var emailValue = null;
		}
		if (idnum.value == "" || idnum == null ){
			alert("身份证信息不能为空！");
			idnum.focus();
			return false;
		}
		 if (idnum != "" && idnum != null) {
			var idnumValue = idnum.value;
			 var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
	            var tip = "";
	            var pass= true;
				var code = idnum.value;
	            if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
	                tip = "身份证号格式错误";
	                pass = false;
	            }

	           else if(!city[code.substr(0,2)]){
	                tip = "地址编码错误";
	                pass = false;
	            }
	            else{
	                //18位身份证需要验证最后一位校验位
	                if(code.length == 18){
	                    code = code.split('');
	                    //∑(ai×Wi)(mod 11)
	                    //加权因子
	                    var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
	                    //校验位
	                    var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
	                    var sum = 0;
	                    var ai = 0;
	                    var wi = 0;
	                    for (var i = 0; i < 17; i++)
	                    {
	                        ai = code[i];
	                        wi = factor[i];
	                        sum += ai * wi;
	                    }
	                    var last = parity[sum % 11];
	                    if(parity[sum % 11] != code[17]){
	                        tip = "校验位错误";
	                        pass =false;
	                    }
	                }
	            }
	            if(!pass) {
	            alert(tip);
	            return false;}
		} 
		 if (address.value == "" || address == null ){
				alert("地址信息不能为空！");
				address.focus();
				return false;
			}
		if (idnum != "" && idnum != null) {
			var idnumValue = idnum.value;
		}
		var realnameValue = realname.value;
		if(address.value!=null && address.value != ""){
			addressValue = address.value;
		}
		var username = "${User.userName}";
		$.ajax({
			url:"./user/update.action",
			data:{"userName":username,"realName":realnameValue,"email":emaiValue,"phone":phoneValue,"IdNum":idnumValue,"address":addressValue},
			type:"post",
			dataType:"json",
			success:function(data){
				var key = data.key;
				if (key!=0){
					alert("更新信息成功！");
				}
				if(key == 0){
					alert("更新信息失败！");
				}
			}
		})
	}
	function outLogin(){
		alert("注销成功！5秒后跳转");
		window.location.href='index.jsp';   
	}
</script>
</head>
<body>
<div class="header-bg">
	<div class="wrap"> 
		<div class="h-bg">
			<div class="total">
				<div class="header">
				<jsp:include page="head.jsp" />
		</div>	
		<div class="menu"> 	
			<div class="top-nav"> 
					<ul>
						<li><a href="index.jsp">主页</a></li>
						<li><a href="about.jsp">详情</a></li>
						<li><a href="#" onclick="selectAllCars('${User.userName }')">车型</a></li>
						<li><a href="#" onclick="selectCart('${User.userName }')">购物车</a></li>
						<li class="active"><a href="contact.jsp" id="info">个人信息</a></li>
					</ul>
					<div class="clear"></div> 
				</div>
		</div>
		<div class="banner-top">
			<div class="header-bottom">
				 <div class="header_bottom_right_images">
				 	<div class="about_wrapper"><h1><a style="color:red">*</a> 为必填信息</h1>
					</div>
		    <div class="section group">
				<div class="col span_2_of_c">
				  <div class="contact-form">
				  	<h3>Information</h3>
					    <form method="post" action="contact-post.html">
					    	<div>
						     	<span><label>登录账号：</label><a style="color:red">*</a></span>
						    	<span><input name="username" type="text" class="textbox" value="${User.userName}" disabled="disabled"></span>
						    </div>
					    	<div>
						    	<span><label>收货人名称：</label><a style="color:red">*</a></span>
						    	<span><input name="realname" type="text" class="textbox" id="realname"></span>
						    </div>
						    <div>
						    	<span><label>电子邮箱：</label></span>
						    	<span><input name="email" type="text" class="textbox" id="email"></span>
						    </div>
						    <div>
						     	<span><label>手机号码：</label><a style="color:red">*</a></span>
						    	<span><input name="phone" type="text" class="textbox" id="phone"></span>
						    </div>
						    <!-- <div>
						    	<span><label>SUBJECT</label></span>
						    	<span><textarea name="userMsg"> </textarea></span>
						    </div> -->
						    <div>
						     	<span><label>身份证号码：</label><a style="color:red">*</a></span>
						    	<span><input name="id_num" type="text" class="textbox" id="idnum"></span>
						    </div>
						    <div>
						     	<span><label>地址：</label><a style="color:red">*</a></span>
						    	<span><input name="address" type="text" class="textbox" id="address"></span>
						    </div>
						   <div>
						   		<span><input style="padding: 7px 20px;
    color: #FFF;
    cursor: pointer;
    background: #D54F30 url(../images/large-button-overlay.png);
    border: 1px solid rgba(0, 0, 0, 0.25);
    text-shadow: 0 -1px 1px rgba(0, 0, 0, 0.25);
    -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.50);
    -webkit-border-radius: 5px;
    border-radius: 2px;
    font-family: Arial, Helvetica, sans-serif;
    position: absolute;
    right: 0;" type="button" value="Submit" onclick="judeInput()"></span>
						  </div>
					    </form>
				  </div>
  				</div><div class="clear"></div>
			</div>
		</div>
		<jsp:include page="right.jsp" ></jsp:include>
		<div class="clear"></div>
		
</div>
</div>
</div>
</div>
</div>
</div>
</body>
<script type="text/javascript">
    var flag = "${User.userName }";
	if(flag != "" && flag != null){
		document.getElementById("info").style.display="";
	}else{
		document.getElementById("info").style.display="none";
	}
</script>
</html>

    	
    	
            