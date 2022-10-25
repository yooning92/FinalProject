package com.itwill.brown_carrot_market.dao;

import java.util.List;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Invitation;
import com.itwill.brown_carrot_market.dto.UserInfo;

public interface UserInfoDao {

	/*
	 * 사용자관리테이블에 새로운사용자생성
	 */
	int createUser(UserInfo userInfo) throws Exception;
	/*
	 * 사용자관리테이블에 새로운사용자의 주소생성
	 */
	int createAddress(Address address) throws Exception;

	int createInvitation(Invitation invitation) throws Exception;

	/*
	 * 기존의 사용자정보를 수정
	 */
	int updateUser(UserInfo userInfo) throws Exception;

	int updateAddress(Address address) throws Exception;
	
	int updateAddressRange(Address address) throws Exception;

	int updatePoint(UserInfo userInfo) throws Exception;
	
	int updateProfile(UserInfo userInfo) throws Exception;

	int updateFreshness(UserInfo userInfo) throws Exception;
	
	/*
	 * 사용자아이디에해당하는 사용자를 삭제
	 */
	int removeUser(String user_id) throws Exception;
	
	int removeAddress(Address address) throws Exception;

	/*
	 * 사용자아이디에해당하는 정보를 데이타베이스에서 찾아서 User 도메인클래스에 저장하여 반환
	 */
	UserInfo findUser(String user_id) throws Exception;
	
	String findInvitation(Invitation invitation) throws Exception;
	
	String findIdByNameEmail(UserInfo userInfo) throws Exception;
	//비밀번호찾기
	public int findPwByIdEmail(UserInfo userInfo);
	//비밀번호 업데이트
	int updatePwById(UserInfo userInfo) throws Exception;
	
	List<Address> findAddressesById(UserInfo userInfo) throws Exception;
	
	/*
	 * 모든사용자 정보를 데이타베이스에서 찾아서 List<User> 콜렉션 에 저장하여 반환
	 */
	List<UserInfo> findUserList() throws Exception;

	/*
	 * 인자로 전달되는 아이디를 가지는 사용자가 존재하는지의 여부를판별
	 */
	boolean existedUser(String userId) throws Exception;
	
	boolean existedInvitation(Invitation invitation) throws Exception;
	

}