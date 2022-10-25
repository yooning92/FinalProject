package com.itwill.brown_carrot_market.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.brown_carrot_market.dto.Notice;

@Mapper
public interface NoticeMapper {

/*
	//공지사항 전체조회
	public List<Notice> selectAll();
*/	
	
	//공지사항 전체조회--페이징 처리
	public List<Notice> selectAll(int pageStart, int pageEnd);
	
	
	//공지사항 전게 게시글 수 계산
	public int selectCountNotice();
	
	
	//공지사항 글 한개 찾기
	public Notice selectByNo(int notice_no);
	
	//공지사항 글 등록
	public int insertNotice(Notice notice);
	
	//공지사항 글 한개 삭제
	public int deleteNotice(int notice_no);
	
	//공지사항 글 수정
	public int updateNotice(Notice notice);
	
	//공지사항 글 조회수 증가
	public int updateNoticeCount(int notice_no);
	
	
	
	
}
