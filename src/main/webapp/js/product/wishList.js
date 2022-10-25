
$(function(){
	$("a[id^='wishDeleteA']").click(function(e){
/*	e.preventDefault();
	e.stopPropagation();*/
	var w_no=this.id.split("=");
	alert("관심 해제하시겠습니까?");
	
	$.ajax({
		url:"wishDelete",
		method:"POST",
		data:{
			"w_no":w_no[1]
		},
		dataType:"json",
		success:function(result){
			/*	toastr.options.positionClass = 'toast-top-full-width' ;
	            toastr['info']("관심 해제");*/
	            location.reload();
		}
		
		
	});
	
	
	})
	
	
})