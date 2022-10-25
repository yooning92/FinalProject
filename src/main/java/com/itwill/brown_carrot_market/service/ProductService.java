package com.itwill.brown_carrot_market.service;

import java.util.List;
import java.util.Map;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.ProductImage;
import com.itwill.brown_carrot_market.util.PageMakerDto;

public interface ProductService {
	
	//비회원 상품 전체보기
		//List<Product> selectProductAll() throws Exception;
	
		PageMakerDto<Product> selectProductAll(int currentPage) throws Exception;
		
		public int selectListNotLoginCount() throws Exception;
		
		//비회원 카테고리별 상품 리스트 불러오기
		PageMakerDto<Product> selectAllByCtgr(int p_ctgr_no,int currentPage) throws Exception;
		
		public int selectNonMemberCountCtgrProduct(int p_ctgr_no)throws Exception;

		//회원의 좌표값을 기준으로 범위 안의 모든 상품 불러오기
		//List<Product> selectListByRange(Address address)throws Exception;
		
		PageMakerDto<Product> selectListByRange(Address address,int currentPage)throws Exception;
		
		public int selectListLoginCount(Address address)throws Exception;
		
		//회원의 좌표값을 기준으로 범위와 선택한 카테고리 안의 모든 상품 불러오기
		PageMakerDto<Product> selectListByRangeCtgr(Map map, int p_ctgr_no,int currentPage)throws Exception;
		
		public int selectMemberCtgrCountProduct(Map map,int address_no)throws Exception;

		//회원이 올린 게시글 리스트 불러오기
		List<Product> selectByUserId(String user_id)throws Exception;
		
		public List<Product> selectByUserIdPSell(String user_id, int p_sell)throws Exception;
		
		//선택한 상품 하나 불러오기
		Product selectByOne(int p_no)throws Exception;
		
		//선택한 상품 삭제
		int  deleteByPNo(int p_no)throws Exception;
		
		//선택한 상품 업데이트
		int updateProduct(Map map)throws Exception;
		
		//상품 판매상태 수정
		int updateProductSell(int p_sell, int p_no)throws Exception;
		
		//상품 조회수 증가
		int updateProductCount(int p_no)throws Exception;
		
		int insertProduct(Map map)throws Exception;

		//채팅에서 사용 
		List<ProductImage> selectProductImgList(int p_no) throws Exception;
		
		int deleteProductImg(int p_no)throws Exception;
		
		/*
		 * insert랑 updateWishCount 추가하기
		 * update에서 사진 추가 삭제 기능 결합하기
		 * sell의 기본값 받아오기...?
		 */
	
}
