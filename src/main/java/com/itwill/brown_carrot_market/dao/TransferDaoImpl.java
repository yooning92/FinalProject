package com.itwill.brown_carrot_market.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.brown_carrot_market.dto.Transfer;
import com.itwill.brown_carrot_market.mapper.TransferMapper;

@Repository(value = "transferDaoImpl")
public class TransferDaoImpl implements TransferDao{
	@Autowired(required = true)
	private TransferMapper transferMapper;
	
	public TransferDaoImpl() {
		System.out.println("#### TransferDaoImplMyBatisMapperInterface() : 디폴트생성자 호출  ");

	}

	public TransferMapper getTransferMapper() {
		return transferMapper;
	}

	public void setTransferMapper(TransferMapper transferMapper) {
		this.transferMapper = transferMapper;
	}

	@Override
	public int insert_Transfer_Deposit(int p_no) throws Exception {
		System.out.println("#### TransferDaoImpl : insertTransfer_Deposit(int p_no) 호출  ");
		return transferMapper.insert_Transfer_Deposit(p_no);
	}

	@Override
	public int insert_Transfer_Withdraw(int p_no) throws Exception {
		System.out.println("#### TransferDaoImpl : insertTransfer_Withdraw(int p_no) 호출  ");
		return transferMapper.insert_Transfer_Withdraw(p_no);
	}

	@Override
	public int insert_Transfer_Cancel_Deposit(int p_no) throws Exception {
		System.out.println("#### TransferDaoImpl : insertTransfer_Cancel_Deposit(int p_no) 호출  ");
		return transferMapper.insert_Transfer_Cancel_Deposit(p_no);
	}


	@Override
	public int insert_Transfer_Cancel_Withdraw(int p_no) throws Exception {
		System.out.println("#### TransferDaoImpl : insertTransfer_Cancel_Withdraw(int p_no) 호출  ");
		return transferMapper.insert_Transfer_Cancel_Withdraw(p_no);
	}

	@Override
	public int insert_Point_Deposit(int payment_amount, String user_id) throws Exception {
		return transferMapper.insert_Point_Deposit(payment_amount, user_id);
	}

	@Override
	public int insert_Point_Withdraw(int amount, String user_id) throws Exception {
		return transferMapper.insert_Point_Withdraw(amount, user_id);
	}
	
	@Override
	public List<Transfer> selectById(String user_id) throws Exception {
		System.out.println("#### TransferDaoImpl : selectById(String user_id) 호출  ");
		return transferMapper.selectById(user_id);
	}

	@Override
	public List<Transfer> selectByP_Id(String user_id) throws Exception {
		return transferMapper.selectByP_Id(user_id);
	}

	@Override
	public int update_Point_By_Id_Deposit(String user_id) throws Exception{
		return transferMapper.update_Point_By_Id_Deposit(user_id);
	}

	@Override
	public int update_Point_By_Id_Withdraw(String user_id) throws Exception{
		return transferMapper.update_Point_By_Id_Withdraw(user_id);
	}


	
}
