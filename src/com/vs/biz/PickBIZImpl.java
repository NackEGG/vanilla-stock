package com.vs.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.CompanyDAO;
import com.vs.dao.PickDAO;
import com.vs.vo.CompanyVO;
import com.vs.vo.PickVO;

@Service
public class PickBIZImpl implements PickBIZ {
	
	@Autowired
	private PickDAO pickDAO;
	

	@Override
	public boolean insert(PickVO vo) {
		return pickDAO.insert(vo);
	}

	@Override
	public List<CompanyVO> popularComanylist() {
		List<CompanyVO> list = pickDAO.popularComanylist();
		System.out.println("1111" + list.get(0).getCompany());
		return list;
	}
}
