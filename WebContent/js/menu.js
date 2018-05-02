function selectCart(flag){
		if(flag != "" && flag != null){
			$.ajax({
				url:"./cart/selectCartAll.action",
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.key == 0) {
						window.location.href="new.jsp";
					}
				}
			})
		}else{
			window.location.href="new.jsp";
		}
	}