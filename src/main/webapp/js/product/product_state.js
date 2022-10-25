var you_id="";

	$(document).ready(function(){
	
	$('#changeReserve').click(function(){
	
	const NodeList
  = document.getElementsByName('productState');
	
	  NodeList.forEach((node) => {
    if(node.checked)  {
       you_id
        = node.value;
    }
  })
	console.log(you_id);
	console.log(window.opener.p_no);
	
	var reserve={
		"p_no":window.opener.p_no,
		"yourId":you_id
	}
		$.ajax({
		url:"chatdetail_reserve_rest",
		method:"POST",
		data: JSON.stringify(reserve),
		async: true,
        contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
        dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)  
		success:function(jsonResult){
		product=jsonResult.product;
		
		console.log(product);
		window.alert("변경이 완료되었습니다.");
		window.close();
		}
		
		
		})
	
	
	});
	
	
		$('#changeSoldOut').click(function(){
	
	const NodeList
  = document.getElementsByName('productState');
	
	  NodeList.forEach((node) => {
    if(node.checked)  {
       you_id
        = node.value;
    }
  })
	console.log(you_id);
	console.log(window.opener.p_no);
	
	var reserve={
		"p_no":window.opener.p_no,
		"yourId":you_id
	}
		$.ajax({
		url:"chatdetail_soldout_rest",
		method:"POST",
		data: JSON.stringify(reserve),
		async: true,
        contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
        dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)  
		success:function(jsonResult){
		product=jsonResult.product;
		
		console.log(product);
		window.alert("변경이 완료되었습니다.");
		window.close();
		}
		
		
		})
	
	
	});
	
	
	
	})