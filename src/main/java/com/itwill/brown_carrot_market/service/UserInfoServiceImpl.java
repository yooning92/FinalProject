package com.itwill.brown_carrot_market.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.itwill.brown_carrot_market.dao.UserInfoDao;
import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Invitation;
import com.itwill.brown_carrot_market.dto.Transfer;
import com.itwill.brown_carrot_market.dto.UserInfo;

/*
 * - 회원관리 업무(비즈니스로직,예외처리,트랜젝션,보안,로깅)을 수행하는 클래스
 * - 웹컴포넌트(서블릿,JSP)에서 직접접근(메쏘드호출)하는 클래스(객체)
 * - Dao를 이용해서 데이타베이스를 조작작업(CRUD)하는 클래스
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {
	@Autowired
	@Qualifier("userDaoImpl")
	private UserInfoDao userDao;

	public UserInfoServiceImpl() throws Exception {
		System.out.println("#### UserServiceImpl() : 디폴트생성자 호출  ");
	}

	/*
	 * 회원가입
	 */
	/************** 1.반환값사용 ***********************/
	@Override
	public int create(UserInfo user, Address address, Invitation invitation) throws Exception {
		/*
		 * 0:아이디중복 1:회원가입성공 2:초대코드로 회원가입
		 */

		// 1.아이디중복체크
		if (userDao.existedUser(user.getUser_id())) {
			// 아이디중복
			return 0;
		} else {
			// 아이디안중복
			// 2.회원가입
			int insertRowCount = userDao.createUser(user);

			if (address != null) {
				address.setUser_id(user.getUser_id());

				int insertAddress = userDao.createAddress(address);

				System.out.println(insertAddress);
			}
			
			if (invitation !=null && userDao.existedInvitation(invitation)) {
				System.out.println("초대한   사람: "+userDao.findInvitation(invitation));
				System.out.println("초대받은 사람: "+invitation.getUser_id());
				/***************transaction 설정 필요******************/
				int invi_point = 500;	// 각각 500point 부여
				user.setUser_point(invi_point);
				
				int updateNewUser = userDao.updatePoint(user);
				int updateInviUser = userDao.updatePoint(new UserInfo(userDao.findInvitation(invitation), null, null, null, null, 0.0, invi_point, null, null));
				/******************************************************/
				return 2;
			}else {
				
				return 3;
			}

			//return insertRowCount;
		}
	}

	/*********************************************/

	/*
	 * 회원로그인
	 * 
	 * 0:아이디존재안함 1:패쓰워드 불일치 2:로그인성공
	 */
	@Override
	public int login(String user_id, String password) throws Exception {
		int result = -1;
		// 1.아이디 존재여부
		UserInfo user = userDao.findUser(user_id);
		if (user == null) {
			// 아이디존재안함
			result = 0;
		} else {
			// 아이디존재함
			if (user.isMatchPassword(password)) {
				// 패쓰워드일치(로그인성공)
				result = 2;
			} else {
				// 패쓰워드불일치
				result = 1;
			}
		}

		return result;
	}
	/*
	 * 회원로그아웃
	 */

	/*
	 * 회원상세보기
	 */
	@Override
	public UserInfo findUser(String user_id) throws Exception {
		return userDao.findUser(user_id);
	}
	/*
	 * [아이디찾기] 이름+이메일주소
	 */
	@Override
	public String findIdByNameEmail(UserInfo userInfo) throws Exception {
		return userDao.findIdByNameEmail(userInfo);
	}
	/*
	 * [비밀번호찾기] 아이디+이메일주소
	 */
	@Override
	public int findPwByIdEmail(UserInfo userInfo) throws Exception {
		return userDao.findPwByIdEmail(userInfo);
	}
	//비밀번호 업데이트
	@Override
	public int updatePwById(UserInfo userInfo) throws Exception {
		return userDao.updatePwById(userInfo);
	}

	@Override
	public List<Address> findAddressesById(UserInfo userInfo) throws Exception {
		return userDao.findAddressesById(userInfo);
	}
	
	/*
	 * 회원수정
	 */
	@Override
	public int update(UserInfo user) throws Exception {
		return userDao.updateUser(user);
	}

	@Override
	public int updateAddress(Address address) throws Exception {

		// 기존에 존재하는지 찾기
		List<Address> findAddressList = userDao.findUser(address.getUser_id()).getAddressList();

		for (Address findAddress : findAddressList) {
			if (findAddress.getAddress_no() != address.getAddress_no()
					&& findAddress.getAddress_name().equals(address.getAddress_name())) {
				// 동일한 주소가 존재한다면
				return 0;
			}
		}
		return userDao.updateAddress(address);
	}

	@Override
	public int updatePoint(UserInfo userInfo, Invitation invitation) throws Exception {
		/***************transaction 설정 필요******************/
		int invi_point = 500;	// 각각 500point 부여
		userInfo.setUser_point(invi_point);
		
		int updateNewUser = userDao.updatePoint(userInfo);
		int updateInviUser = userDao.updatePoint(new UserInfo(invitation.getUser_id(), null, null, null, null, 0.0, invi_point, null, null));
		/******************************************************/

		return updateInviUser * updateNewUser;
	}
	
	@Override
	public int updatePointByTransfer(Transfer transfer) throws Exception {
		UserInfo userInfo = new UserInfo();
		userInfo.setUser_id(transfer.getUser_id());
		if(transfer.getTransfer_deposit()!=0) {
			userInfo.setUser_point(transfer.getTransfer_deposit());
		}else {
			userInfo.setUser_point(transfer.getTransfer_withdraw());
		}
		return userDao.updatePoint(userInfo);
	}
	
	@Override
	public int updateProfile(UserInfo userInfo) throws Exception {
		return userDao.updateProfile(userInfo);
	}
	
	@Override
	public int updateFreshness(UserInfo userInfo) throws Exception {
		return userDao.updateFreshness(userInfo);
	}
	
	
	@Override
	public int createAddress(Address address) throws Exception {
		// 기존에 존재하는지 찾기
		List<Address> findAddressList = userDao.findUser(address.getUser_id()).getAddressList();

		for (Address findAddress : findAddressList) {
			if (findAddress.getAddress_no() != address.getAddress_no()
					&& findAddress.getAddress_name().equals(address.getAddress_name())) {
				// 동일한 주소가 존재한다면
				return 0;
			}
		}
		return userDao.createAddress(address);
	}
	
	@Override
	public int updateAddressRange(Address addressS) throws Exception {
		return userDao.updateAddressRange(addressS);
	}

	@Override
	public int createInvitation(Invitation invitation) throws Exception {
		return userDao.createInvitation(invitation);
	}

	/*
	 * 회원탈퇴
	 */
	@Override
	public int remove(String user_id) throws Exception {
		return userDao.removeUser(user_id);
	}
	
	@Override
	public int removeAddress(Address address) throws Exception {
		return userDao.removeAddress(address);
	}

	/*
	 * 전체회원리스트
	 */
	@Override
	public List<UserInfo> findUserList() throws Exception {
		return userDao.findUserList();
	}

	/*
	 * 아이디중복체크
	 */
	@Override
	public boolean isDuplicateId(String user_id) throws Exception {
		boolean isExist = userDao.existedUser(user_id);
		if (isExist) {
			return true;
		} else {
			return false;
		}
	}


}
