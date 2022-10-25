<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매상태 변경</title>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">
    
    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
    
    <script src="js/product/product_state.js"></script>

</head>
<body>
  <img src="img/core-img/logo.png" alt="logo">
<hr>
<br>
	<div>
		<label>채팅 리스트</label> 
		
	</div>
	<br>
	<div class="cart-table">
	                        <div class="table-responsive" >
	                            <table class="table table-bordered mb-30" style="width:350px; margin : auto; ">
	                                <thead>
	                                    <tr style="height:50px; background-color:#FBCEB1;">
	                                        <!--<th scope="col"><i class="icofont-ui-delete"></i></th>-->
	                                        
	                                        <th scope="col">프로필</th>
	                                        <th scope="col">아이디</th>
	                                        <th scope="col">매너온도</th>
	                                        <th scope="col">선택</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                
									    <c:forEach items="${userList}" var="userList" >
		                                    <tr>

		                                        <td>
 													<img src="img/user_profile/${userList.you_image}" >
		                                        </td>
		                                        <td>
		                                        	${userList.you_id}
		                                        </td>
		                                        <td>
		                                        	${userList.you_fresh}
		                                        </td>
		                                        <td>
		                                        <input type="radio" name="productState" value=${userList.you_id}>
		                                        </td>
		                                      
		                                    </tr>
										</c:forEach> 

										
	                                </tbody>
	                            </table>		
	                                            </div>
	                                            <br>
	                                            <br>
	                                  <button type="button" id="changeReserve">예약중 변경</button>
									  <button type="button" id="changeSoldOut">판매완료 변경</button>
	                    </div>	
	<br>
	

	
	
	<br>
	
	
	

	
	
	<style type="text/css">
	
	#changeReserve{
	position: fixed;
	
    left: 0;
    bottom: 0;
    margin-left: 30px;
    width: 40%;
    height: 44px;
    display: block;
    /* text-align: center; */
    /* position: relative; */
    border-radius: 8px;
    background-color: orange;
    border-color: orange;
    cursor: pointer;
    color: white;
    border: 1px solid;
    font-weight: 700;
    font-size: 14pt;
    padding: 0 24px;
	}
	
	#changeReserve:hover{
	color:orange;
	 background-color:white;
	 border-color:orange;
	 border: 2px solid ;
	}
	#changeSoldOut{
	position: fixed;
    right: 0;
    bottom: 0;
    margin-right: 30px;
    
    width: 40%;
    height: 44px;
    display: block;
    /* text-align: center; */
    /* position: relative; */
    border-radius: 8px;
    background-color: orange;
    border-color: orange;
    cursor: pointer;
    color: white;
    border: 1px solid;
    font-weight: 700;
    font-size: 14pt;
    padding: 0 24px;
	}
	
	#changeSoldOut:hover{
	color:orange;
	 background-color:white;
	 border-color:orange;
	 border: 2px solid ;
	}
	
	hr{
color:orange;
border:1px solid orange;
 }
	th{
	 font-size: 15px;
    font-weight: normal;
    margin-left: 40px;
    color: #7f3808;

    }
    label{
	    font-size: 15px;
    font-weight: normal;
    margin-left: 40px;
    color: #7f3808;
    text-decoration: underline;
    text-decoration-color: orange;
    text-decoration-style: wavy;
    text-underline-position: under;
    /* margin: 0 auto; */
	}
	


	
</body>
</html>