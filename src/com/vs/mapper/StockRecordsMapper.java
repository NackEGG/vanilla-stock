package com.vs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.vs.vo.StockRecordsVO;


public interface StockRecordsMapper {
	@Select("select * from STOCK_RECORDS")
	public List<StockRecordsVO> selectStock(); 

	@Select("select open,close,sr.stock_code,t_date,industry_no"
			+ "from STOCK_RECORDS AS SR,COMPANY AS COM "
			+ "WHERE SR.STOCK_CODE = COM.STOCK_CODE "
			+ "AND SR.T_DATE >= #{startDate} "
			+ "AND SR.T_DATE <= #{endDate}")
	public List<StockRecordsVO> selectStockWithCompany(String startDate, String endDate);
	
	@Select("select * from STOCK_RECORDS where stock_code=#{stock_code}")
	public StockRecordsVO searchStock(String stock_code);
}
