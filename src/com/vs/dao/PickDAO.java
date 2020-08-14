package com.vs.dao;

import java.util.List;

import com.vs.vo.CompanyVO;
import com.vs.vo.PickVO;

public interface PickDAO {
	public boolean insert(PickVO vo);
	public List<CompanyVO> popularComanylist();
}
