package com.itwill.brown_carrot_market.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.brown_carrot_market.dto.TownReaction;
import com.itwill.brown_carrot_market.mapper.TownReactionMapper;

@Repository(value = "townReactionDaoImpl")
public class TownReactionDaoImpl implements TownReactionDao{
	@Autowired(required = true)
	private TownReactionMapper townReactionMapper;
	
	public TownReactionDaoImpl() {
		System.out.println(">>>  TownReactionDaoImpl 호출");
	}
	public TownReactionMapper getTownReactionMapper() {
		
		return townReactionMapper;
	}
	public void setTownReactionMapper(TownReactionMapper townReactionMapper) {
		System.out.println(">>>  townReactionDaoImpl():setTownReactionMapper 호출");
		this.townReactionMapper = townReactionMapper;
	}
	@Override
	public int insertTownBoardReac(TownReaction townReaction) throws Exception{
		System.out.println(">>>  townReactionDaoImpl():insertTownBoardReac 호출");
		return townReactionMapper.insertTownBoardReac(townReaction);
	}
	@Override
	public int deleteTownBoardReac(int t_reac_no) throws Exception{
		System.out.println(">>>  townReactionDaoImpl():deleteTownBoardReac 호출");
		return townReactionMapper.deleteTownBoardReac(t_reac_no);
	}
	@Override
	public int selectTownBoardReacCount(int t_no) throws Exception{
		System.out.println(">>>  townReactionDaoImpl():selectTownBoardReacCount 호출");
		return townReactionMapper.selectTownBoardReacCount(t_no);
	}
	@Override
	public int selectTownBoardReacTypeCount(int t_no, int t_reac_type) throws Exception{
		System.out.println(">>>  townReactionDaoImpl():selectTownBoardReacTypeCount 호출");
		return townReactionMapper.selectTownBoardReacTypeCount(t_no, t_reac_type);
	}
	
	
	
	
}
