function CommonHtmlContents(){
}

CommonHtmlContents.user_thumbnail=function(){
		return `<div class="user_account user-thumbnail">
			    			<i class="fa fa-user-circle"></i>
                            </div>
                            <ul class="user-meta-dropdown">
                                <li><a href="user_login"><i class="icofont-ui-user"></i> 회원가입</a></li>
                                <li><a href="user_login"><i class="icofont-login"></i> 로그인</a></li>
                            </ul>`;
}	
CommonHtmlContents.user_thumbnail_login=function(sUser){
	if(sUser.user_profile.startsWith('http://')){
		return `<div class="user_account user-thumbnail">
                            <img src='${sUser.user_profile}' alt="">
                            </div>
                            <ul class="user-meta-dropdown">
                                <li class="user-title"><span>안녕하세요,</span> ${sUser.user_id} 님</li>
                                <li><a href="user_my_account">마이페이지</a></li>
                                
                                <li><a href="user_logout_action"><i class="icofont-logout"></i> 로그아웃</a></li>
                            </ul>`;
	}
		return `<div class="user_account user-thumbnail">
                            <img src='img/user_profile/${sUser.user_profile}' alt="">
                            </div>
                            <ul class="user-meta-dropdown">
                                <li class="user-title"><span>안녕하세요,</span> ${sUser.user_id} 님</li>
                                <li><a href="user_my_account">마이페이지</a></li>
                                
                                <li><a href="user_logout_action"><i class="icofont-logout"></i> 로그아웃</a></li>
                            </ul>`;
}	