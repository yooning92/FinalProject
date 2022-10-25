package com.itwill.brown_carrot_market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.itwill.brown_carrot_market.dao.TownReplyDao;
import com.itwill.brown_carrot_market.dto.TownReply;

@Service
public class TownReplyServiceImpl implements TownReplyService{
	@Autowired
	@Qualifier("townReplyDaoImpl")
	private TownReplyDao townReplyDao;
	
	public TownReplyServiceImpl() throws Exception{
		System.out.println(">>> townReplyDaoImpl: 기본 생성자 호출");
	}

	//댓글등록
	@Override
	public int insertTownBoardReply(TownReply townReply) throws Exception {
		return townReplyDao.insertTownBoardReply(townReply);
	}
	
	//대댓글 등록
	@Override
	public int insertTownBoardReReply(TownReply townReply) throws Exception {
		townReplyDao.updateStep(townReply);
		return townReplyDao.insertTownBoardReReply(townReply);
	}
	
	//대댓글 step 증가
	@Override
	public int updateStep(TownReply townReply) throws Exception {
		return townReplyDao.updateStep(townReply);
	}
	

	@Override
	public int deleteTownBoardReply(int t_reply_no) throws Exception {
		return townReplyDao.deleteTownBoardReply(t_reply_no);
	}

	@Override
	public int updateTownBoardReply(TownReply townReply) throws Exception {
		return townReplyDao.updateTownBoardReply(townReply);
	}

	//해당 게시물의 댓글 전체 조회
	@Override
	public List<TownReply> selectTownBoardReplyList(int t_no) {
		return townReplyDao.selectTownBoardReplyList(t_no);
	}

	//댓글 한개 조회
	@Override
	public TownReply selectTownBoardReplyOne(int t_reply_no) {
		return townReplyDao.selectTownBoardReplyOne(t_reply_no);
	}




	
	
	
	
	
	
}
