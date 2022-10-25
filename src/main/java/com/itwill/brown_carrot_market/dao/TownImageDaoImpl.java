package com.itwill.brown_carrot_market.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.brown_carrot_market.dto.TownImage;
import com.itwill.brown_carrot_market.mapper.TownImageMapper;

@Repository(value = "townImageDaoImpl")
public class TownImageDaoImpl implements TownImageDao{
	@Autowired(required = true)
	private TownImageMapper townImageMapper;
	
	public TownImageDaoImpl() {
		System.out.println(">>> TownImageDaoImpl()호출");
	}
	public TownImageMapper getTownImageMapper() {
		return townImageMapper;
	}
	public void setTownImageMapper(TownImageMapper townImageMapper) {
		System.out.println(">>> townImageDaoImpl:setTownImageMapper()호출");
		this.townImageMapper = townImageMapper;
	}
	
	//해당 게시물의 사진 전체 삭제
	@Override
	public int deleteTownBoardImgAll(int t_no) throws Exception{
		System.out.println(">>> townImageDaoImpl:deleteTownBoardImgAll()호출");
		return townImageMapper.deleteTownBoardImgAll(t_no);
	}
	
	//해당 게시물의 사진 한개 삭제
	@Override
	public int deleteTownBoardImgOne(int t_img_no) throws Exception{
		System.out.println(">>> townImageDaoImpl:deleteTownBoardImgOne()호출");
		return townImageMapper.deleteTownBoardImgOne(t_img_no);
	}

	//사진 한장 삽입
	@Override
	public int insertTownBoardImg(TownImage townImage) throws Exception {
		System.out.println(">>> townImageDaoImpl:insertTownBoardImg()호출");
		return townImageMapper.insertTownBoardImg(townImage);
	}
	
	//사진 여러장 삽입
	@Override
	public int insertTownBoardListImg(List<TownImage> townBoardImageList) throws Exception {
		System.out.println(">>> townImageDaoImpl:insertTownBoardListImg(List<TownImage> townBoardImageList)호출");
		return townImageMapper.insertTownBoardListImg(townBoardImageList);
	}
	
	//t_no로 이미지 리스트 불러오기
	@Override
	public List<TownImage> selectTownBoardImgList(int t_no) throws Exception {
		System.out.println(">>> townImageDaoImpl:selectTownBoardImgList(int t_no)호출");
		return townImageMapper.selectTownBoardImgList(t_no);
	}
	
	//사진 한장 선택
	@Override
	public TownImage selectTownBoardImgOne(int t_img_no) throws Exception {
		System.out.println(">>> townImageDaoImpl:selectTownBoardImgOne(int t_img_no)호출");
		return townImageMapper.selectTownBoardImgOne(t_img_no);
	}
	
	
	
	
	
	
}
