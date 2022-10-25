package com.itwill.brown_carrot_market.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.itwill.brown_carrot_market.dto.Transfer;

@Mapper
public interface TransferMapper {
	  
	@SelectKey(keyProperty = "transfer_no" , resultType = int.class , before = true ,statement = "select TRANSFER_TRANSFER_NO_SEQ.nextval from dual")
	@Insert("insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.currval, 0, (-1*(select p_price from product where p_no = #{product.p_no})), sysdate, (select user_id from orders where p_no =#{product.p_no}), (select orders_no from orders where p_no = #{product.p_no}), #{product.p_no},(select user_point from userinfo where user_id=(select user_id from orders where p_no = #{product.p_no}))-(select p_price from product where p_no = #{product.p_no}))")
	int insert_Transfer_Deposit(int p_no);
	
	@Insert("insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval, (select p_price from product where p_no = #{p_no}), 0, sysdate, (select user_id from product where p_no =#{p_no}), (select orders_no from orders where p_no = #{p_no}), #{p_no}, (select user_point from userinfo where user_id=(select user_id from product where p_no = #{p_no}))+(select p_price from product where p_no = #{p_no}))")
	int insert_Transfer_Withdraw(int p_no);
	
	@SelectKey(keyProperty = "transfer_no" , resultType = int.class , before = true ,statement = "select TRANSFER_TRANSFER_NO_SEQ.nextval from dual")
	@Insert("insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.currval, 0, (-1*(select p_price from product where p_no = #{product.p_no})), sysdate, (select user_id from orders where p_no = #{product.p_no}), (select orders_no from orders where p_no = #{product.p_no}),#{product.p_no},(select user_point from userinfo where user_id=(select user_id from orders where p_no = #{product.p_no}))-(select p_price from product where p_no = #{product.p_no}))")
	int insert_Transfer_Cancel_Withdraw(int p_no);

	@Insert("insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval, (select p_price from product where p_no = #{p_no}), 0, sysdate, (select user_id from product where p_no = #{p_no}), (select orders_no from orders where p_no = #{p_no}),#{p_no},(select user_point from userinfo where user_id=(select user_id from product where p_no = #{p_no}))+(select p_price from product where p_no = #{p_no})))")
	int insert_Transfer_Cancel_Deposit(int p_no);
	
	@SelectKey(keyProperty = "transfer_no" , resultType = int.class , before = true ,statement = "select TRANSFER_TRANSFER_NO_SEQ.nextval from dual")
	@Insert("insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.currval, #{payment_amount}, 0, sysdate, #{user_id}, null, null, ((select user_point from userinfo where user_id=#{user_id})+#{payment_amount}))")
	int insert_Point_Deposit(int payment_amount, String user_id);
	
	@Update("update userinfo set user_point = user_point + (select * from(select transfer_deposit from transfer where user_id=#{user_id} order by transfer_date desc) where rownum =1) where user_id = #{user_id}")
	int update_Point_By_Id_Deposit(String user_id);
	
	@SelectKey(keyProperty = "transfer_no" , resultType = int.class , before = true ,statement = "select TRANSFER_TRANSFER_NO_SEQ.nextval from dual")
	@Insert("insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.currval, 0, (-1*(#{amount})), sysdate, #{user_id}, null, null, ((select user_point from userinfo where user_id=#{user_id})-#{amount}))")
	int insert_Point_Withdraw(int amount, String user_id);
	
	@Update("update userinfo set user_point = user_point + (select * from(select transfer_withdraw from transfer where user_id=#{user_id} order by transfer_date desc) where rownum =1) where user_id = #{user_id}")
	int update_Point_By_Id_Withdraw(String user_id);
	
	@ResultMap(value = {"transferResultMap"})
	@Select("select s.user_id, s.transfer_no, s.transfer_deposit, s.transfer_withdraw, s.transfer_date, s.t_balance, s.orders_no from (select t.user_id, t.transfer_no, t.transfer_deposit, t.transfer_withdraw, t.transfer_date, t.t_balance, o.orders_no from transfer t left outer join orders o on t.p_no = o.p_no)s join userinfo u on s.user_id=u.user_id where s.user_id=#{user_id} order by s.transfer_date desc")
	List<Transfer> selectById(String user_id);
	
	@ResultMap(value = { "transferResultMap" })
	@Select("select p.p_no, p.p_title, p.p_price, p.user_id, o.orders_no\n"
			+ "        from orders o \n"
			+ "        join product p \n"
			+ "        on o.p_no=p.p_no where o.user_id=#{user_id}")
	List<Transfer> selectByP_Id(String user_id);
}