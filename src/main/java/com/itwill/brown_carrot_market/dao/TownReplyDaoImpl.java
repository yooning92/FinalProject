package com.itwill.brown_carrot_market.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.brown_carrot_market.dto.TownReply;
import com.itwill.brown_carrot_market.mapper.TownReplyMapper;

@Repository(value = "townReplyDaoImpl")
public class TownReplyDaoImpl implements TownReplyDao{
	@Autowired(required = true)
	private TownReplyMapper townReplyMapper;
	
	public TownReplyDaoImpl() {
		System.out.println(">>> TownReplyDaoImpl 호출");
	}
	public TownReplyMapper getTownReplyMapper() {
		return townReplyMapper;
	}
	public void setTownReplyMapper(TownReplyMapper townReplyMapper) {
		System.out.println(">>> townReplyDaoImpl : setTownReplyMapper()호출");
		this.townReplyMapper = townReplyMapper;
	}
	
	
	//댓글등록
	@Override
	public int insertTownBoardReply(TownReply townReply) throws Exception{
		System.out.println(">>> townReplyDaoImpl: insertTownBoardReply()호출");
		return townReplyMapper.insertTownBoardReply(townReply);
	}
	
	//대댓글 등록
	@Override
	public int insertTownBoardReReply(TownReply townReply) throws Exception {
		System.out.println(">>> townReplyDaoImpl: insertTownBoardReReply(TownReply townReply)호출");
		return townReplyMapper.insertTownBoardReReply(townReply);
	}
	
	//대댓글 step 증가
	@Override
	public int updateStep(TownReply townReply) throws Exception{
		System.out.println(">>> townReplyDaoImpl: updateStep(TownReply townReply)호출");
		return townReplyMapper.updateStep(townReply);
	}
	
	@Override
	public int deleteTownBoardReply(int t_reply_no) throws Exception{
		System.out.println(">>> townReplyDaoImpl : deleteTownBoardReply()호출");
		return townReplyMapper.deleteTownBoardReply(t_reply_no);
	} 
	@Override
	public int updateTownBoardReply(TownReply townReply) throws Exception{
		System.out.println(">>> townReplyDaoImpl :updateTownBoardReply()호출");
		return townReplyMapper.updateTownBoardReply(townReply);
	}
	
	//해당 게시물의 댓글 전체 조회
	@Override
	public List<TownReply> selectTownBoardReplyList(int t_no) {
		return townReplyMapper.selectTownBoardReplyList(t_no);
	}
	
	//댓글 한개 조회
	@Override
	public TownReply selectTownBoardReplyOne(int t_reply_no) {
		System.out.println(">>> townReplyDaoImpl :selectTownBoardReplyOne(int t_reply_no)호출");
		return townReplyMapper.selectTownBoardReplyOne(t_reply_no);
	}

	
	
	
	
	
	
	
	
}
