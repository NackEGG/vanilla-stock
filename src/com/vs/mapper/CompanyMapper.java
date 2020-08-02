package com.vs.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Select;
import com.vs.vo.CompanyVO;

public interface CompanyMapper {
	@Select("select * from COMPANY")
	public List<CompanyVO> selectCompany(); 
	
	@Select("select * from COMPANY where stock_code=#{stock_code}")
	public CompanyVO searchCompany(String stock_code);
	
}
