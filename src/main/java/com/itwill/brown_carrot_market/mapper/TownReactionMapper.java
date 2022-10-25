package com.itwill.brown_carrot_market.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.brown_carrot_market.dto.TownReaction;

@Mapper
public interface TownReactionMapper {
	
	//공감하기 한개 등록
	public int insertTownBoardReac(TownReaction townReaction);
	
	//공감하기 삭제
	public int deleteTownBoardReac(int t_reac_no);
	
	//공감하기 전체 수 계산
	public int selectTownBoardReacCount(int t_no);
	
	//공감하기 타입별 숫자 계산
	public int selectTownBoardReacTypeCount(int t_no, int t_reac_type);
	
	
}
