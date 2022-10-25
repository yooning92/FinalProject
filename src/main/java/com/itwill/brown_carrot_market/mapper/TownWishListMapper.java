package com.itwill.brown_carrot_market.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.brown_carrot_market.dto.TownWishList;

@Mapper
public interface TownWishListMapper {
	
	//관심목록 총 갯수
	public int selectTownWishListCount(String user_id);
	
	//관심목록 전체 리스트 조회
	public List<TownWishList> selectTownWishListAll(String user_id);
	
	//관심목록 리스트에서 한개 글 선택
	public TownWishList selectTownWishListOne(int t_wl_no);
	
	//관심목록 등록
	public int insertTownWishList(TownWishList townWishList);
	
	//관심목록 한개 삭제
	public int deleteTownWishList(int t_wl_no);
	
	//관심 글 존재 확인
	public int selectTownWishExist(String user_id, int t_no);
	
	
	
	
	
	
	
	
	
	
	
	
}
