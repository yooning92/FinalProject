package com.itwill.brown_carrot_market.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.mapper.TownBoardMapper;

@Repository(value = "townBoardDaoImpl")
public class TownBoardDaoImpl implements TownBoardDao{
	
	@Autowired(required = true)
	private TownBoardMapper townBoardMapper;
	
	public TownBoardDaoImpl() {
		System.out.println(">>> TownBoardDaoImpl 호출");
	}
	
	public TownBoardMapper getTownBoardMapper() {
		return townBoardMapper;
	}
	public void setTownBoardMapper(TownBoardMapper townBoardMapper) {
		System.out.println(">>> townBoardDaoImpl() : setTownBoardMapper() 호출");
		this.townBoardMapper = townBoardMapper;
	}
	
	/*
	비회원이 동네 게시판 전체 조회
	@Override
	public List<TownBoard> selectNonMemberTownBoardList() throws Exception{
		System.out.println(">>> townBoardDaoImpl : selectNonMemberTownBoardList()호출");
		return townBoardMapper.selectNonMemberTownBoardList();
	}
	*/
	//비회원이 동네 게시판 전체 조회 페이징처리
	@Override
	public List<TownBoard> selectNonMemberTownBoardList(int pageStart, int pageEnd) throws Exception {
		Map<String, Integer>map = new HashMap<>();
		map.put("pageStart", pageStart);
		map.put("pageEnd", pageEnd);
		return townBoardMapper.selectNonMemberTownBoardList(pageStart,pageEnd);
	}
	
	//동네 게시판 비회원이 게시글 수 계산
	@Override
	public int selectNonMemberCountTownBoard() {
		return townBoardMapper.selectNonMemberCountTownBoard();
	}
	

	
	
	//비회원이 동네 게시판 카테고리 조건 전체 조회 페이징처리
	@Override
	public List<TownBoard> selectNonMemberCtgrTownBoardList(int t_ctgr_no, int pageStart, int pageEnd) throws Exception {
		System.out.println(">>> townBoardDaoImpl : selectNonMemberCtgrTownBoardList()호출");
		return townBoardMapper.selectNonMemberCtgrTownBoardList(t_ctgr_no, pageStart, pageEnd);
	}
	//동네 게시판 카테고리 조건 비회원이 게시글 수 계산
	@Override
	public int selectNonMemberCountCtgrTownBoard(int t_ctgr_no) {
		return townBoardMapper.selectNonMemberCountCtgrTownBoard(t_ctgr_no);
	}
	
	
	
	
	
	//회원이 동네 게시판 전체 조회
	@Override
	public List<TownBoard> selectTownBoardListCoordinate(Address address,int pageStart, int pageEnd) throws Exception{
		System.out.println(">>> townBoardDaoImpl : selectTownBoardListCoordinate()호출");
		Map<String, Integer>map = new HashMap<>();
		map.put("pageStart", pageStart);
		map.put("pageEnd", pageEnd);
		return townBoardMapper.selectTownBoardListCoordinate(address,pageStart,pageEnd);
	}
	//회원의 동네 게시판 게시글 수 계산
	@Override
	public int selectMemberCountTownBoard(Address address) {
		return townBoardMapper.selectMemberCountTownBoard(address);
	}
	
	
	
	//동네 게시판 회원이 좌표값과 카테고리 조건으로 전체조회 -- 페이징처리
	@Override
	public List<TownBoard> selectTownBoardCtgrListCoordinate(Map map,int t_ctgr_no, int pageStart, int pageEnd) throws Exception{
		//(추가)
		System.out.println(">>> townBoardDaoImpl : selectTownBoardCtgrListCoordinate()호출- map >>"+map);
		
		/*
		Map<String, Integer> map1 = new HashMap<>();
		map1.put("pageStart", pageStart);
		map1.put("pageEnd", pageEnd);

		*/
		return townBoardMapper.selectTownBoardCtgrListCoordinate(t_ctgr_no, pageStart, pageEnd, (String)map.get("user_id"),(Integer)map.get("address_no"));

	}
	//회원이 카테고리 조건 게시판 게시글 수 계산
	@Override
	public int selectMemberCtgrCountTownBoard(Map map,int t_ctgr_no) {
		System.out.println("selectMemberCtgrCountTownBoard디에이오 - map: "+map);
		return townBoardMapper.selectMemberCtgrCountTownBoard(t_ctgr_no,(String)map.get("user_id"),(Integer)map.get("address_no"));

	}
	//회원이 카테고리 조건 게시판 게시글 수 계산을 위한 파라메타 맵 만들기
	@Override
	public Map selectMemberCtgrTownBoardAddress(String user_id,int address_no) {
		Map paramMap = new HashMap<>();
		paramMap.put("user_id", user_id);
		paramMap.put("address_no", address_no);
		
		Map aa = townBoardMapper.selectMemberCtgrTownBoardAddress(paramMap);
		return aa;
	}
	
	
	//비회원 인기글 리스트
	@Override
	public List<TownBoard> selectNonMemberTownBoardListTop3() {
		System.out.println(">>> townBoardDaoImpl : selectNonMemberTownBoardListTop3()()호출");
		return townBoardMapper.selectNonMemberTownBoardListTop3();
	}
	
	//회원 인기글 리스트
	@Override
	public List<TownBoard> selectMemberTownBoardListTop3(Address address) {
		System.out.println(">>> townBoardDaoImpl : selectMemberTownBoardListTop3()()호출");
		return townBoardMapper.selectMemberTownBoardListTop3(address);
	}
	
	


	@Override
	public TownBoard selectTownBoardOne(int t_no) throws Exception{
		System.out.println(">>> townBoardDaoImpl : selectTownBoardOne()호출");
		return townBoardMapper.selectTownBoardOne(t_no);
	}
	
	@Override
	public int deleteTownBoardOne(int t_no) throws Exception{
		System.out.println(">>> townBoardDaoImpl : delete()호출");
		return townBoardMapper.deleteTownBoardOne(t_no);
	}

	@Override
	public int updateTownBoardOne(Map map) throws Exception{
		System.out.println(">>> townBoardDaoImpl : updateTownBoardOne()호출");
		return townBoardMapper.updateTownBoardOne(map);
	}

	@Override
	public int updateTownBoardCount(int t_no) throws Exception{
		System.out.println(">>> townBoardDaoImpl : updateTownBoardCount()호출");
		return townBoardMapper.updateTownBoardCount(t_no);
	}
	
	@Override
	public List<TownBoard> selectTownBoardIdList(String user_id) throws Exception{
		System.out.println(">>> townBoardDaoImpl : selectTownBoardIdList()호출");
		return townBoardMapper.selectTownBoardIdList(user_id);
	}


	/*
	@Override
	public int insertTownBoard(TownBoard townBoard) throws Exception{
		System.out.println(">>> townBoardDaoImpl : insertTownBoard()호출");
		return townBoardMapper.insertTownBoard(townBoard);
	}
	 */
	@Override
	public int insertTownBoard(Map map) throws Exception{
		System.out.println(">>> townBoardDaoImpl : insertTownBoard(Map map)호출");
		townBoardMapper.insertTownBoard(map);
		return selectTownBoardPK();
	}
	
	@Override
	public int selectTownBoardPK() throws Exception {
		return townBoardMapper.selectTownBoardPK();
	}
	

	@Override
	public Map selectTownBoardAddress(String user_id, int address_no) {
		Map paramMap = new HashMap();
		paramMap.put("user_id", user_id);
		paramMap.put("address_no", address_no);
		
		Map aa = townBoardMapper.selectTownBoardAddress(paramMap);
		System.out.println(aa);
		return aa;
	}








	

	



	

	

	
	
	

	
	
	
	
	
	
	
	
	
}
