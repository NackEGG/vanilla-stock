package com.vs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.PickDAO;
import com.vs.vo.PickVO;

@Service
public class PickBIZImpl implements PickBIZ {
	
	@Autowired
	private PickDAO pickDAO;

	@Override
	public boolean insert(PickVO vo) {
		return pickDAO.insert(vo);
	}
}
