package com.itwill.brown_carrot_market.dao;

import java.util.List;

import com.itwill.brown_carrot_market.dto.TownImage;

public interface TownImageDao {
	
	//해당 게시물의 사진 전체 삭제
	int deleteTownBoardImgAll(int t_no)throws Exception;
	
	//해당 게시물의 사진 한개 삭제
	int deleteTownBoardImgOne(int t_img_no)throws Exception;
	
	//사진 한장 삽입
	int insertTownBoardImg(TownImage townImage) throws Exception;
	
	//사진 여러장 삽입
	int insertTownBoardListImg(List<TownImage> townBoardImageList) throws Exception;
	
	//t_no로 이미지 리스트 불러오기
	List<TownImage> selectTownBoardImgList(int t_no) throws Exception;
	
	//사진 한장 선택
	TownImage selectTownBoardImgOne(int t_img_no) throws Exception;
	
	
}
