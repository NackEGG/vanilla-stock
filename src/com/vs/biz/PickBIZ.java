package com.vs.biz;

import java.util.List;

import com.vs.vo.CompanyVO;
import com.vs.vo.PickVO;

public interface PickBIZ {
	public boolean insert(PickVO vo);
	public List<CompanyVO> popularComanylist();
}
