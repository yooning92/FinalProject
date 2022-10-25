package com.itwill.brown_carrot_market.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.brown_carrot_market.dto.Notice;
import com.itwill.brown_carrot_market.mapper.NoticeMapper;

@Repository(value = "noticeDaoImpl")
public class NoticeDaoImpl implements NoticeDao{
	@Autowired(required = true)
	private NoticeMapper noticeMapper;
	
	public NoticeDaoImpl() {
		System.out.println(">>> NoticeDaoImpl 호출");
	}
	
	public NoticeMapper getNoticeMapper() {
		return noticeMapper;
	}
	public void setNoticeMappper(NoticeMapper noticeMapper) {
		System.out.println(">>> noticeDaoImpl():setNoticeMappper()호출");
		this.noticeMapper = noticeMapper;
	}

/*
	@Override
	public List<Notice> selectAll() throws Exception{
		System.out.println(">>>noticeDaoImpl : selectAll()호출");
		return noticeMapper.selectAll();
	}
*/
	//페이징 처리 공지사항 전체조회
	@Override
	public List<Notice> selectAll(int pageStart, int pageEnd) throws Exception{
		System.out.println(">>>noticeDaoImpl : selectAll()호출");
		
		//
		Map<String, Integer>map = new HashMap<>();
		map.put("pgaeStart", pageStart);
		map.put("pageEnd", pageEnd);
		
		return noticeMapper.selectAll(pageStart, pageEnd);
	}
	
	//전체 게시물 수 계산
	@Override
	public int selectCountNotice() throws Exception{
		return noticeMapper.selectCountNotice();
	}

	
	@Override
	public Notice selectByNo(int notice_no) throws Exception{
		System.out.println(">>>noticeDaoImpl : selectByNo()호출");
		return noticeMapper.selectByNo(notice_no);
	}

	@Override
	public int insertNotice(Notice notice) throws Exception{
		System.out.println(">>>noticeDaoImpl : insertNotice()호출");
		return noticeMapper.insertNotice(notice);
	}

	@Override
	public int deleteNotice(int notice_no) throws Exception{
		System.out.println(">>>noticeDaoImpl : deleteNotice()호출");
		return noticeMapper.deleteNotice(notice_no);
	}

	@Override
	public int updateNotice(Notice notice) throws Exception{
		System.out.println(">>>noticeDaoImpl : updateNotice()호출");
		return noticeMapper.updateNotice(notice);
	}

	@Override
	public int updateNoticeCount(int notice_no) throws Exception{
		System.out.println(">>>noticeDaoImpl : updateNoticeCount()호출");
		return noticeMapper.updateNoticeCount(notice_no);
	}


	
	
	
	
	
	
	
	
	
	
}
