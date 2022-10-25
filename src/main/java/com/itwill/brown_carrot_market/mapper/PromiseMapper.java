package com.itwill.brown_carrot_market.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.brown_carrot_market.dto.Promise;

@Mapper
public interface PromiseMapper {
	// 채팅방 약속 불러오기
	@Select("select * from promise where c_room_no=#{c_room_no}")
	public Promise promiseSelect(@Param("c_room_no") int c_room_no);
	
	// 채팅방 약속 잡기
	@Insert("insert into promise (c_room_no,c_app_lat,c_app_lng,c_app_date,c_app_spot) values (#{c_room_no},#{c_app_lat},#{c_app_lng},TO_DATE(#{c_app_date},'YYYY-MM-DD HH24:MI'),#{c_app_spot})")
	public int promiseInsert(Promise promise);

	// 채팅방 약속 삭제
	@Delete("delete promise where c_room_no=#{c_room_no}")
	public int promiseDelete(@Param("c_room_no")int c_room_no);

	// 채팅방 약속 수정
	@Update("update promise set c_app_lat=#{c_app_lat},c_app_lng=#{c_app_lng},c_app_date=To_DATE(#{c_app_date},'YYYY-MM-DD HH24:MI'),c_app_spot=#{c_app_spot} where c_room_no=#{c_room_no}")
	public int promiseUpdate(Promise promise);

	// 채팅방 약속 존재하는지 select
	@Select("select count(*) from promise where c_room_no=#{c_room_no}")
	public int promiseExist(@Param("c_room_no") int c_room_no);
	
	@Select("select p.c_room_no,c_app_spot,c_app_date,from_id,to_id from promise p join chat_room c on p.c_room_no =c.c_room_no where c.from_id=#{user_id} or c.to_id=#{user_id}")
	public List<Promise> promiseAlert(@Param("user_id") String user_id);
}
