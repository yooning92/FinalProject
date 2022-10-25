package com.itwill.brown_carrot_market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.itwill.brown_carrot_market.dao.NoticeDao;
import com.itwill.brown_carrot_market.dto.Notice;
import com.itwill.brown_carrot_market.util.PageMaker;
import com.itwill.brown_carrot_market.util.PageMakerDto;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	@Qualifier("noticeDaoImpl")
	private NoticeDao noticeDao;
	
	
	
	public NoticeServiceImpl() throws Exception{
		System.out.println(">>> NoticeServiceImpl : 기본 생성자 호출");
	}
	
/*
	@Override
	public List<Notice> selectAll() throws Exception {
		return noticeDao.selectAll();
	}
*/
	//페이징 처리 전체조회
	
	public PageMakerDto<Notice> selectAll(int currrentPage) throws Exception {
		int totNoticeCount = noticeDao.selectCountNotice();
		PageMaker pageMaker = new PageMaker(totNoticeCount, currrentPage, 10, 5);
		List<Notice> noticeList = noticeDao.selectAll(pageMaker.getPageBegin(), pageMaker.getPageEnd());
		PageMakerDto<Notice> pageMakerNoticeList = new PageMakerDto<Notice>(noticeList, pageMaker, totNoticeCount);
		
		//게시글 제목 수정
		for(Notice notice:pageMakerNoticeList.getItemList()) {
			//getTitleString(notice);
		}
		return pageMakerNoticeList;
	}
	

	/*
	 * 게시글 제목을 수정해 반환하는 메서드
	 */
	public Notice getTitleString(Notice notice) {
		StringBuilder title = new StringBuilder(128);
		String t = notice.getNotice_title();
		if (t.length() > 15) {
			// t = t.substring(0,15);
			// t = t+"...";
			t = String.format("%s...", t.substring(0, 15));
		}
		

		title.append(t.replace(" ", "&nbsp;"));
		notice.setNotice_title(title.toString());
		
		return notice;
	}
	
	
	
	@Override
	public int selectCountNotice() throws Exception{
		return noticeDao.selectCountNotice();
	}
	
	
	

	@Override
	public Notice selectByNo(int notice_no) throws Exception {
		return noticeDao.selectByNo(notice_no);
	}

	@Override
	public int insertNotice(Notice notice) throws Exception {
		
		return noticeDao.insertNotice(notice);
	}

	@Override
	public int deleteNotice(int notice_no) throws Exception {
		return noticeDao.deleteNotice(notice_no);
	}

	@Override
	public int updateNotice(Notice notice) throws Exception {
		return noticeDao.updateNotice(notice);
	}

	@Override
	public int updateNoticeCount(int notice_no) throws Exception {
		return noticeDao.updateNoticeCount(notice_no);
	}


	
	
	
	
	
	
	
	
	
}
