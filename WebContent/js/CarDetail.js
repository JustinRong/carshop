$(function(){
	$(".button").click(function(){
		debugger;
		var carId=$(this).parent().find('input[class*=text_box]').val(); 
		$.ajax({
			url:"./carDetail/searchOneCar.action",
			data:{"carId":carId},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.url!=null){
					window.location.href=data.url;
				}
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
				 // 状态码
                console.log(XMLHttpRequest.status);
                // 状态
                console.log(XMLHttpRequest.readyState);
                // 错误信息   
                console.log(textStatus);
			}
		})
	})
})