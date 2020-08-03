package com.vs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.vs.vo.IndustryVO;

public interface IndustryMapper {
	@Select("select * from INDUSTRY")
	public List<IndustryVO> selectIndustry(); 
	
	@Select("select * from INDUSTRY where NO=#{no}")
	public IndustryVO searchIndustry(String no);
}
