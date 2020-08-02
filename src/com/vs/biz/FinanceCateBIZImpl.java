package com.vs.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.FinanceCateDAO;
import com.vs.vo.FinanceCateVO;

@Service
public class FinanceCateBIZImpl implements FinanceCateBIZ {
	@Autowired
	private FinanceCateDAO financeCateDAO;
	
	@Override
	public boolean insertViaJSON(List<FinanceCateVO> list) {
		boolean check = false;
		
		for(FinanceCateVO financeCateVO : list) {
			
			try {
				if(financeCateDAO.insertViaJSON(financeCateVO)>0) {
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
