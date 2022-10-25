package com.itwill.brown_carrot_market.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.brown_carrot_market.dto.Promise;
import com.itwill.brown_carrot_market.mapper.PromiseMapper;
@Repository
public class PromiseDaoImpl implements PromiseDao {
	@Autowired
	private PromiseMapper promiseMapper;

	@Override
	public Promise promiseSelect(int c_room_no) {
		// TODO Auto-generated method stub
		return promiseMapper.promiseSelect(c_room_no);
	}

	@Override
	public int promiseInsert(Promise promise) {
		// TODO Auto-generated method stub
		return promiseMapper.promiseInsert(promise);
	}

	@Override
	public int promiseDelete(int c_room_no) {
		// TODO Auto-generated method stub
		return promiseMapper.promiseDelete(c_room_no);
	}

	@Override
	public int promiseUpdate(Promise promise) {
		// TODO Auto-generated method stub
		return promiseMapper.promiseUpdate(promise);
	}

	@Override
	public int promiseExist(int c_room_no) {
		// TODO Auto-generated method stub
		return promiseMapper.promiseExist(c_room_no);
	}

	@Override
	public List<Promise> promiseAlert(String user_id) {
		// TODO Auto-generated method stub
		return promiseMapper.promiseAlert(user_id);
	}

}
