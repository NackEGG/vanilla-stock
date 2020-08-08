package com.vs.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vs.dao.IndustryDAO;
import com.vs.vo.IndustryVO;

@Service
public class IndustryBIZImpl implements IndustryBIZ{
	@Autowired
	private IndustryDAO industryDAO;
	
	@Override
	public List<IndustryVO> getList() {
		// TODO Auto-generated method stub
		return industryDAO.selectList();
	}
	
	@Transactional
	@Override
	public boolean insert(List<IndustryVO> data) {
		boolean check = false;
		
		if(data.size()!= industryDAO.selectList().size()) { // 이미 들어가 있으면 안됨! 
			for(IndustryVO industry : data) {
				if(industryDAO.insert(industry)>0)	check = true;
				else {
					check = false;
					break;
				}//else end 
			}//for end 
		}//if end
		return check;
	}

	@Override
	public List<String> getIndName(int indNo) {
		return industryDAO.getIndName(indNo);
	}
}
