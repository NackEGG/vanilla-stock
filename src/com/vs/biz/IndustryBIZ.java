package com.vs.biz;

import java.util.List;

import com.vs.vo.IndustryVO;

public interface IndustryBIZ {
	public IndustryVO get(String stockCode);
	public boolean insert(List<IndustryVO> data);
	public List<IndustryVO> getList();
	public List<String> getIndName(int indNo);
}
