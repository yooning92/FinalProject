package com.itwill.brown_carrot_market.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.brown_carrot_market.dto.TownReply;

@Mapper
public interface TownReplyMapper {

	//댓글등록
	public int insertTownBoardReply(TownReply townReply);
	
	//대댓글 등록
	public int insertTownBoardReReply(TownReply townReply);
	
	//대댓글 step 증가
	public int updateStep(TownReply townReply);
	
	//댓글삭제
	public int deleteTownBoardReply(int t_reply_no);
	
	//댓글수정
	public int updateTownBoardReply(TownReply townReply);
	
	//해당 게시물의 댓글 전체 조회
	public List<TownReply> selectTownBoardReplyList(int t_no);
	
	//댓글 한개 조회
	public TownReply selectTownBoardReplyOne(int t_reply_no);
	
	
}
