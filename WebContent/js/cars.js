function selectAllCars(){
	debugger;
		$.ajax({
			url:"./cars/selectAllCars.action",
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.key==1){
					alert("did!");
					window.location.href="specials.jsp";
				}
			}
		})
}