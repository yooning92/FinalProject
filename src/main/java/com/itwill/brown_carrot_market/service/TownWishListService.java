package com.itwill.brown_carrot_market.service;

import java.util.List;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.TownWishList;

public interface TownWishListService {
	
	//관심목록 총 갯수
	int selectTownWishListCount(String user_id)throws Exception;
	
	//관심목록 전체 리스트 조회
	List<TownWishList> selectTownWishListAll(String user_id)throws Exception;
	
	//관심목록 리스트에서 한개 글 선택
	TownWishList selectTownWishListOne(int t_wl_no)throws Exception;
	
	//관심목록 등록
	int insertTownWishList(TownWishList townWishList)throws Exception;
	
	//관심목록 한개 삭제
	int deleteTownWishList(int t_wl_no)throws Exception;
	
	//관심 글 존재 확인
	int selectTownWishExist(String user_id, int t_no)throws Exception;
	
	
}
