package com.itwill.brown_carrot_market.dao;

import java.util.List;

import com.itwill.brown_carrot_market.dto.Transfer;

public interface TransferDao {
	int insert_Transfer_Deposit(int p_no) throws Exception;
	
	int insert_Transfer_Withdraw(int p_no) throws Exception;
	
	int insert_Transfer_Cancel_Deposit(int p_no) throws Exception;
	
	int insert_Transfer_Cancel_Withdraw(int p_no) throws Exception;
	
	int insert_Point_Deposit(int payment_amount, String user_id) throws Exception;

	int insert_Point_Withdraw(int amount, String user_id) throws Exception;
	
	int update_Point_By_Id_Deposit(String user_id) throws Exception;
	
	int update_Point_By_Id_Withdraw(String user_id) throws Exception;

	List<Transfer> selectById(String user_id) throws Exception;
	
	List<Transfer> selectByP_Id(String user_id) throws Exception;

}
