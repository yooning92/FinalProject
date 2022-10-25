package com.itwill.brown_carrot_market.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Product;

@Mapper
public interface ProductMapper {
	//public List<Product> selectProductAll();
	public List<Product> selectProductAll(int pageStart,int pageEnd);
	
	public int selectListNotLoginCount();
	
	public List<Product> selectListByRange(Address address,int pageStart,int pageEnd);
	
	public int selectListLoginCount(Address address);
	
	//카테고리 조건 추가
	
	public List<Product> selectAllByCtgr(int p_ctgr_no,int pageStart, int pageEnd);
	
	public int selectNonMemberCountCtgrProduct(int p_ctgr_no);
	
	public List<Product> selectListByRangeCtgr(int p_ctgr_no, String user_id, int address_no,int pageStart, int pageEnd);
	
	public int selectMemberCtgrCountProduct(int p_ctgr_no,String user_id,int address_no);
	
	
	public List<Product> selectByUserId(String user_id);
	
	public List<Product> selectByUserIdPSell(String user_id, int p_sell);
	
	public Product selectByOne(int p_no);
	public int selectProductPK();
	
	
	public int deleteByPNo(int p_no);
	
	public int updateProductCount(int p_no);

	public int updateProduct(Map map);
	
	public int updateProductSell(int p_sell, int p_no);

	public int updateProductWishCount(int p_no); 
	
	public Map selectProductAddress(Map map);
	
	public int insertProduct(Map map);
	
	
}
