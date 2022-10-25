package com.itwill.brown_carrot_market.dao;

import java.util.List;
import java.util.Map;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Product;

public interface ProductDao {
	
	//비회원 상품 전체보기
	//List<Product> selectProductAll() throws Exception;
	List<Product> selectProductAll(int pageStart, int pageEnd) throws Exception;
	
	int selectListNotLoginCount()throws Exception;
	
	//비회원 카테고리별 상품 리스트 불러오기
	public List<Product> selectAllByCtgr(int p_ctgr_no,int pageStart, int pageEnd) throws Exception;
	
	public int selectNonMemberCountCtgrProduct(int p_ctgr_no)throws Exception;
	
	//회원의 좌표값을 기준으로 범위 안의 모든 상품 불러오기
	List<Product> selectListByRange(Address address,int pageStart,int pageEnd)throws Exception;
	
	public int selectListLoginCount(Address address)throws Exception;
	
	//회원의 좌표값을 기준으로 범위와 선택한 카테고리 안의 모든 상품 불러오기
	public List<Product> selectListByRangeCtgr(Map map,int p_ctgr_no,int pageStart, int pageEnd)throws Exception;

	public int selectMemberCtgrCountProduct(Map map,int p_ctgr_no)throws Exception;
	
	//회원이 올린 게시글 리스트 불러오기
	List<Product> selectByUserId(String user_id)throws Exception;
	
	//회원이 올린 게시글 리스트 +p_sell
	public List<Product> selectByUserIdPSell(String user_id, int p_sell)throws Exception;
	
	//선택한 상품 하나 불러오기
	Product selectByOne(int p_no)throws Exception;
	
	//선택한 상품 삭제
	int  deleteByPNo(int p_no)throws Exception;
	
	//선택한 상품 업데이트
	int updateProduct(Map map)throws Exception;
	
	//상품 조회수 증가
	int updateProductCount(int p_no)throws Exception;
	
	//상품 판매상태 수정
	int updateProductSell(int p_sell, int p_no)throws Exception;
	
	//관심갯수 증가
	int updateProductWishCount(int p_no)throws Exception; 
	
	Map selectProductAddress(String user_id,int address_no);
	
	//상품 등록
	int insertProduct(Map map)throws Exception;
	public int selectProductPK()throws Exception;
	
}
