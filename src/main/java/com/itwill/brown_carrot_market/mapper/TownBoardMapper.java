
package com.itwill.brown_carrot_market.mapper;
 
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.TownBoard;

@Mapper 
public interface TownBoardMapper {
/*
//동네 게시판 비회원이 전체조회
public List<TownBoard> selectNonMemberTownBoardList();
*/
//동네 게시판 비회원이 전체조회 - 페이징 처리
public List<TownBoard> selectNonMemberTownBoardList(int pageStart, int pageEnd);

//동네 게시판 비회원이 게시글 수 계산
public int selectNonMemberCountTownBoard();


//동네 게시판 비회원이 카테고리 조건으로 전체조회 -- 페이징처리
public List<TownBoard> selectNonMemberCtgrTownBoardList(int t_ctgr_no,int pageStart, int pageEnd);
//동네 게시판 카테고리 조건 비회원이 게시글 수 계산
public int selectNonMemberCountCtgrTownBoard(int t_ctgr_no);


//동네 게시판 회원이 좌표값 조건으로 전체조회
public List<TownBoard> selectTownBoardListCoordinate(Address address,int pageStart, int pageEnd);
//동네 게시판 회원이 게시글 수 계산
public int selectMemberCountTownBoard(Address address);




//동네 게시판 회원이 좌표값과 카테고리 조건으로 전체조회
//public List<TownBoard> selectTownBoardCtgrListCoordinate(int t_ctgr_no, Address address);
//회원이 카테고리 조건으로 게시판 전체조회
public List<TownBoard> selectTownBoardCtgrListCoordinate(int t_ctgr_no,int pageStart, int pageEnd,String user_id,int address_no);
//회원이 카테고리 조건 게시판 게시글 수 계산
public int selectMemberCtgrCountTownBoard(int t_ctgr_no,String user_id,int address_no);
//회원이 카테고리 조건 게시판 게시글 수 계산을 위한 파라메타 맵 만들기
public Map selectMemberCtgrTownBoardAddress(Map map);



//비회원 인기글 리스트 
public List<TownBoard> selectNonMemberTownBoardListTop3();

//회원 인기글 리스트
public List<TownBoard> selectMemberTownBoardListTop3(Address address);


//동네 게시판 게시글 한개 조회
public TownBoard selectTownBoardOne(int t_no);

//동네 게시판 글 하나 삭제
public int deleteTownBoardOne(int t_no);

//동네게시판 게시글 한개 수정
public int updateTownBoardOne(Map map);

//동네게시판 게시물 조회수 증가
public int updateTownBoardCount(int t_no);



//동네게시판 글 아이디로 조회(내가 쓴 글 조회)
public List<TownBoard> selectTownBoardIdList(String user_id);

/**********************************************/
//동네게시판 게시물 등록
//public int insertTownBoard(TownBoard townBoard);

public Map selectTownBoardAddress(Map map);

public int insertTownBoard(Map map);

public int selectTownBoardPK();

/**********************************************/


}

	


