package com.vs.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vs.dao.AccountDAO;
import com.vs.vo.AccountVO;

@Service
public class AccountBIZImpl implements AccountBIZ {
	@Autowired
	private AccountDAO accountDAO;
	
	@Transactional
	@Override
	public boolean insertViaJSON(List<AccountVO> list) {
		boolean check = false;
		
		for(AccountVO financeCateVO : list) {
			
			try {
				if(accountDAO.insertViaJSON(financeCateVO)>0) {
					System.out.println("[ 넣는 중 ]");
					check = true;
				}
			} catch (Exception e) {
				//e.printStackTrace();
				continue;
			}
			
		}
		
		return check;
	}
}
