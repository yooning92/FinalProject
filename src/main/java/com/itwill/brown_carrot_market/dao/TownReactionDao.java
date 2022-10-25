package com.itwill.brown_carrot_market.dao;

import com.itwill.brown_carrot_market.dto.TownReaction;

public interface TownReactionDao {

	//공감하기 한개 등록
	int insertTownBoardReac(TownReaction townReaction)throws Exception;
	
	//공감하기 삭제
	int deleteTownBoardReac(int t_reac_no)throws Exception;
	
	//공감하기 전체 수 계산
	int selectTownBoardReacCount(int t_no)throws Exception;
	
	//공감하기 타입별 숫자 계산
	int selectTownBoardReacTypeCount(int t_no, int t_reac_type)throws Exception;
	
	
	
}
