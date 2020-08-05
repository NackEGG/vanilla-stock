package com.vs.dao;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.vs.vo.CompanyVO;

@Repository
public class CompanyDAOImpl implements CompanyDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SimpleJdbcCall simpleJdbcCall;
	
	@Override
	public CompanyVO select(String keyword) {
		// TODO Auto-generated method stub
		simpleJdbcCall
		.withProcedureName("USP_GET_COMPANY");
		
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("PI_KEYWORD", keyword);
		
		Map out = simpleJdbcCall.execute(in);
		CompanyVO companyVO = new CompanyVO();
		companyVO.setStockCode((String) out.get("PO_STOCK_CODE"));
		companyVO.setCompany((String) out.get("PO_COMPANY"));
		companyVO.setIndustryNo(((BigDecimal) out.get("PO_INDUSTRY_NO")).intValue());
		companyVO.setStockListed(((BigDecimal) out.get("PO_STOCK_LISTED")).intValue());
		companyVO.setCapital(((BigDecimal) out.get("PO_CAPITAL")).intValue());
		companyVO.setFacevalue(((BigDecimal) out.get("PO_FACEVALUE")).intValue());
		companyVO.setCurrency((String) out.get("PO_CURRENCY"));
		companyVO.setTel((String) out.get("PO_TEL"));
		companyVO.setAddress((String) out.get("PO_ADDRESS"));
		companyVO.setRegdate((Timestamp) out.get("PO_REGDATE"));
		
		return companyVO;
		
	}
	
	@Override
	public int insertIntoAPI(CompanyVO data) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update("update company set industry_no = ? where stock_code = ? ",
				new Object[] {data.getIndustryNo(),data.getStockCode()});
	}

	public class CompanyRowMapper implements RowMapper<CompanyVO>{

		@Override
		public CompanyVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			CompanyVO vo = new CompanyVO();
			vo.setStockCode(rs.getString("STOCK_CODE"));
			vo.setCompany(rs.getString("COMPANY"));
			vo.setIndustryNo(rs.getInt("INDUSTRY_NO"));
			vo.setStockListed(rs.getInt("STOCK_LISTED"));
			vo.setCapital(rs.getInt("CAPITAL"));
			vo.setFacevalue(rs.getInt("FACEVALUE"));
			vo.setCurrency(rs.getString("CURRENCY"));
			vo.setTel(rs.getString("TEL"));
			vo.setAddress(rs.getString("ADDRESS"));
			vo.setRegdate(rs.getTimestamp("REGDATE"));
			return vo;
		}
		
	}
}
