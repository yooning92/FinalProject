package com.itwill.brown_carrot_market.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.brown_carrot_market.dto.TownImage;

@Mapper
public interface TownImageMapper {
	
	//해당 게시물의 사진 전체 삭제
	public int deleteTownBoardImgAll(int t_no);
	
	//해당 게시물의 사진 한개 삭제
	public int deleteTownBoardImgOne(int t_img_no);
	
	//사진 한장 삽입
	public int insertTownBoardImg(TownImage townImage);
	
	//사진 여러장 삽입
	public int insertTownBoardListImg(List<TownImage> townBoardImageList);
	
	//t_no로 이미지 리스트 불러오기
	public List<TownImage> selectTownBoardImgList(int t_no);
	
	//사진 한장 선택
	public TownImage selectTownBoardImgOne(int t_img_no);
	

}
