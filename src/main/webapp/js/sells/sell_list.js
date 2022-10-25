/**
 * 
 */
 function sellStatus(p_sell){
	$.ajax({
		url:"sell_list_rest",
		method:"post",
		data:{
			"p_sell":p_sell
		},
		dataType:"json",
		success:function(resultObj){
			console.log(resultObj.data);
				let data = resultObj.data;
				let htmlBuffer = ``;
				for(var i=0; i<data.length; i++){
					htmlBuffer += `<tr>`;
					htmlBuffer += `<td>`;
					//htmlBuffer += ``+substring(${product_date},0,10);+``
					var date = 	data[i].p_date.substring(0,10);		   
					htmlBuffer += `<input type="hidden" class="" name="p_no_${data[i].p_no}" value="${data[i].p_no}" >
								   `+date+
								   `</td>`;   
					if(data[i].productImagesList[0].pi_name!=null && data[i].productImagesList[0].pi_name!="" ){
						if(data[i].productImagesList[0].pi_name.startsWith('http')){
							htmlBuffer += `<td>`;
							htmlBuffer += `<img src="${data[i].productImagesList[0].pi_name}" >`;
							htmlBuffer += `</td>`;
						}else{
							htmlBuffer += `<td>`;
							htmlBuffer += `<img src="img/product_img/${data[i].productImagesList[0].pi_name}" >`;	
							htmlBuffer +=`</td>`;
						}				                                
					}else{
						htmlBuffer += `<td>`;
						htmlBuffer += `<img src="img/chat-img/logo_carrot.png" >`;	
						htmlBuffer +=`</td>`;
					}
																  
					htmlBuffer += `<td>`;
					htmlBuffer += `<a href="product_detail?p_no=${data[i].p_no}">${data[i].p_title}</a>`;
					htmlBuffer +=`</td>`;		
					htmlBuffer +=`<td>
		                             ${data[i].p_price} 원
		                          </td>`;	
		            htmlBuffer += `<td>`;
		          
		            if(data[i].p_sell == 1){
					htmlBuffer += `판매중`;
					}else if(data[i].p_sell == 2){
					htmlBuffer += `예약중`;	
					}else if(data[i].p_sell == 3){
					htmlBuffer += `판매완료`;	
					}
		            htmlBuffer += `</td>`;	
		            htmlBuffer += `<td>
		                              <div id="sell_list">
		                              <script>check_isExisted_orders($('input[name=p_no_${data[i].p_no}]').val())</script>
		                              <a href="#" class="badge ${data[i].p_no}" id="" seller_id="" p_title="${data[i].p_title}" style="height:20px;font-size:1rem"></a>
		                              </div>
		                           </td>`;	
		            htmlBuffer += `</tr>`;
				};
				
			$('[id="sell_list_start"]').html(htmlBuffer);
			},
			error: function(request, status, error){
				console.log('실패');
			}
			
			
		
	});
  }
