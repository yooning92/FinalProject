package com.itwill.brown_carrot_market.service;

import java.util.List;

import com.itwill.brown_carrot_market.dto.TownReply;

public interface TownReplyService {

	//댓글등록
	int insertTownBoardReply(TownReply townReply)throws Exception;
	
	//대댓글 등록
	int insertTownBoardReReply(TownReply townReply)throws Exception;
	
	//대댓글 step 증가
	int updateStep(TownReply townReply)throws Exception;
	
	//댓글삭제
	int deleteTownBoardReply(int t_reply_no)throws Exception;
	
	//댓글수정
	int updateTownBoardReply(TownReply townReply)throws Exception;
	
	//해당 게시물의 댓글 전체 조회
	List<TownReply> selectTownBoardReplyList(int t_no);
	
	//댓글 한개 조회
	TownReply selectTownBoardReplyOne(int t_reply_no);
	
	
}
