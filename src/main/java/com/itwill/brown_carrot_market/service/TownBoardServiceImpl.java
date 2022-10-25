package com.itwill.brown_carrot_market.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.itwill.brown_carrot_market.dao.TownBoardDao;
import com.itwill.brown_carrot_market.dao.TownImageDao;
import com.itwill.brown_carrot_market.dao.UserInfoDao;
import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.ProductImage;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.TownImage;
import com.itwill.brown_carrot_market.util.PageMaker;
import com.itwill.brown_carrot_market.util.PageMakerDto;

@Service
public class TownBoardServiceImpl implements TownBoardService{
	@Autowired
	@Qualifier("townBoardDaoImpl")
	private TownBoardDao townBoardDao;
	
	@Autowired
	@Qualifier("userDaoImpl")
	private UserInfoDao userInfoDao;
	
	@Autowired
	@Qualifier("townImageDaoImpl")
	private TownImageDao townImageDao;
	
	
	
	public TownBoardServiceImpl() throws Exception{
		System.out.println(">>> townBoardServiceImpl : 기본 생성자 호출");
	}
	
	//비회원 동네게시판 전체조회 페이징처리
	@Override
	public PageMakerDto<TownBoard> selectNonMemberTownBoardList(int currentPage) throws Exception {
		int totTownBoardNonMemberCount = townBoardDao.selectNonMemberCountTownBoard();
		PageMaker pageMaker = new PageMaker(totTownBoardNonMemberCount, currentPage, 5, 5);
		List<TownBoard> townBoardList = townBoardDao.selectNonMemberTownBoardList(pageMaker.getPageBegin(), pageMaker.getPageEnd());
		PageMakerDto<TownBoard> pageMakerTownBoardList = new PageMakerDto<TownBoard>(townBoardList, pageMaker, totTownBoardNonMemberCount);
		
		return pageMakerTownBoardList;
	}
	//비회원이 동네 게시판 게시글 수 계산
	@Override
	public int selectNonMemberCountTownBoard() {
		return townBoardDao.selectNonMemberCountTownBoard();
	}
	
	
	//동네 게시판 비회원이 카테고리 조건으로 전체조회
	@Override
	public PageMakerDto<TownBoard> selectNonMemberCtgrTownBoardList(int t_ctgr_no, int currentPage) throws Exception {
		int totTownBoardNonMemberCtgrCount = townBoardDao.selectNonMemberCountCtgrTownBoard(t_ctgr_no);
		PageMaker pageMaker = new PageMaker(totTownBoardNonMemberCtgrCount, currentPage, 5, 5);
		List<TownBoard> townBoardList = townBoardDao.selectNonMemberCtgrTownBoardList(t_ctgr_no, pageMaker.getPageBegin(), pageMaker.getPageEnd());
		PageMakerDto<TownBoard> pageMakerTownBoardList = new PageMakerDto<TownBoard>(townBoardList, pageMaker, totTownBoardNonMemberCtgrCount);
		return pageMakerTownBoardList;
	}
	//동네 게시판 카테고리 조건 비회원이 게시글 수 계산
	@Override
	public int selectNonMemberCountCtgrTownBoard(int t_ctgr_no) {
		return townBoardDao.selectNonMemberCountCtgrTownBoard(t_ctgr_no);
	}
	
	
	
	

	//회원이 동네 게시판 전체조회 페이징
	@Override
	public PageMakerDto<TownBoard> selectTownBoardListCoordinate(Address address,int currentPage) throws Exception {
		int totTownBoardMemberCount = townBoardDao.selectMemberCountTownBoard(address);
		PageMaker pageMaker = new PageMaker(totTownBoardMemberCount, currentPage, 5, 5);
		List<TownBoard> townBoardList = townBoardDao.selectTownBoardListCoordinate(address, pageMaker.getPageBegin(), pageMaker.getPageEnd());
		PageMakerDto<TownBoard> pageMakerTownBoardList = new PageMakerDto<TownBoard>(townBoardList, pageMaker, totTownBoardMemberCount);
		return pageMakerTownBoardList;
	}
	//회원이 동네 게시판 게시글 수 계산
	@Override
	public int selectMemberCountTownBoard(Address address) {
		return townBoardDao.selectMemberCountTownBoard(address);
		
	}

	
	
	
	//동네 게시판 회원이 좌표값과 카테고리 조건으로 전체조회 -- 페이징처리
	@Override
	public PageMakerDto<TownBoard> selectTownBoardCtgrListCoordinate(Map map, int t_ctgr_no, int currentPage) throws Exception {
		//(추가)
		System.out.println("selectTownBoardCtgrListCoordinate- map >>"+map);
		
		int totTownBoardMemberCtgrCount = townBoardDao.selectMemberCtgrCountTownBoard(map, t_ctgr_no);
		PageMaker pageMaker = new PageMaker(totTownBoardMemberCtgrCount, currentPage, 5, 5);
		List<TownBoard> townBoardList = townBoardDao.selectTownBoardCtgrListCoordinate(map,t_ctgr_no ,pageMaker.getPageBegin(), pageMaker.getPageEnd());
		PageMakerDto<TownBoard> pageMakerTownBoardList = new PageMakerDto<TownBoard>(townBoardList, pageMaker, totTownBoardMemberCtgrCount);
		return pageMakerTownBoardList;
	}
	
	//회원이 카테고리 조건 게시판 게시글 수 계산
	@Override
	public int selectMemberCtgrCountTownBoard(Map map,int t_ctgr_no) {
		System.out.println("selectMemberCtgrCountTownBoard서비스 - map: "+map);
		
		return townBoardDao.selectMemberCtgrCountTownBoard(map,t_ctgr_no);
	}
	//회원이 카테고리 조건 게시판 게시글 수 계산을 위한 파라메타 맵 만들기
	@Override
	public Map selectMemberCtgrTownBoardAddress(String user_id, int address_no) {
		return townBoardDao.selectMemberCtgrTownBoardAddress(user_id, address_no);
	}
	
	
	//비회원 인기글 리스트
	@Override
	public List<TownBoard> selectNonMemberTownBoardListTop3() {
		return townBoardDao.selectNonMemberTownBoardListTop3();
	}
	
	//회원 인기글 리스트
	@Override
	public List<TownBoard> selectMemberTownBoardListTop3(Address address) {
		return townBoardDao.selectMemberTownBoardListTop3(address);
	}
	
	

	@Override
	public TownBoard selectTownBoardOne(int t_no) throws Exception {
		return townBoardDao.selectTownBoardOne(t_no);
	}
	
	//게시글 삭제
	@Override
	public int deleteTownBoardOne(int t_no) throws Exception {
		return townBoardDao.deleteTownBoardOne(t_no);
	}

	//게시글 수정
	@Override
	public int updateTownBoardOne(Map map) throws Exception {
		int result = 0;
		int t_no = Integer.parseInt((String) map.get("t_no"));
		int rowCount = townBoardDao.updateTownBoardOne(map);
		
		List<String> imageList = new ArrayList<>();
		imageList = (List<String>) map.get("ImageNameList");

		if(imageList!=null) {
		for (int i=0; i < imageList.size(); i++) {
			String t_img_name = imageList.get(i).toString();
			TownImage townImage = new TownImage();
			townImage.setT_no(t_no);
			townImage.setT_img_name(t_img_name);
			
			result = townImageDao.insertTownBoardImg(townImage);
			
			}
		}
		
		
		return result;
	}
	
	
	//게시글 수정 위한 사진 전체 삭제
	@Override
	public int deleteTownBoardImgAll(int t_no) throws Exception {
		return townImageDao.deleteTownBoardImgAll(t_no);
	}
	
	
	

	@Override
	public int updateTownBoardCount(int t_no) throws Exception {
		return townBoardDao.updateTownBoardCount(t_no);
	}
	@Override
	public List<TownBoard> selectTownBoardIdList(String user_id) throws Exception {
		return townBoardDao.selectTownBoardIdList(user_id);
	}

	
	/*
	@Override
	public int insertTownBoard(TownBoard townBoard) throws Exception {
		return townBoardDao.insertTownBoard(townBoard);
	}
	 */
	/*
	@Override
	public Map selectTownBoardAddress(String user_id, int address_no) {
		return townBoardDao.selectTownBoardAddress(user_id, address_no);
	}
*/
	@Override
	public int insertTownBoard(Map map) throws Exception {
		int result = 0;
		int t_no = townBoardDao.insertTownBoard(map);
		System.out.println(">>>>>Service map"+map);
		//List<String> fileNames = new ArrayList<>();
		System.out.println(">>>service map의 t_img_name"+map.get("ImageNameList"));
		//System.out.println(map.size());
		
		
		//Product product = (Product) map;
		
		List<String> imageList = new ArrayList<>();
		imageList = (List<String>) map.get("ImageNameList");

		if(imageList!=null) {
		for (int i=0; i < imageList.size(); i++) {
			String t_img_name = imageList.get(i).toString();
			TownImage townImage = new TownImage();
			townImage.setT_no(t_no);
			townImage.setT_img_name(t_img_name);
			
			result = townImageDao.insertTownBoardImg(townImage);
			
			}
			//System.out.println(imageList.get(2).toString());
		}	
			/*
			List<ProductImage> productImageList = new ArrayList();
			((Product) productImageList).setP_no(p_no);
			((ProductImage) productImageList).setPi_name("pi_name");
			productImageList.add(productImage);
			}
		result = productImageDao.insertProductListImg(productImageList);
		}
		*/ 
		return result;
		
	}



	/*
	@Override
	public int selectTownBoardPK() {
		return 0;
	}
	*/
	



	





	

	


	
	
	
	
	
	
	
	
	
	
	
}
