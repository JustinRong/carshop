function cartOrder(username){
	if(username!=null){
		debugger;
		$.ajax({
			url:"./cart/carBuyMess.action",
			data:{"username":username},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.key==1){
					window.location.href="order.jsp";
				}
			}
		})
	}
}