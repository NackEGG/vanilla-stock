package com.vs.dao;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.vs.vo.IndustryVO;

@Repository
public class IndustryDAOImpl implements IndustryDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public SimpleJdbcCall getSimpleJdbcCall(JdbcTemplate jdbcTemplate) {
		return new SimpleJdbcCall(jdbcTemplate);
	}
	
	@Override
	public IndustryVO get(String stockCode) {
		
		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall(jdbcTemplate);
		
		simpleJdbcCall
		.withProcedureName("USP_GET_INDUSTRY");
		
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("PI_STOCK_CODE", stockCode);
		
		Map out = simpleJdbcCall.execute(in);
		IndustryVO industryVO = new IndustryVO();
		industryVO.setNo(((BigDecimal) out.get("PO_NO")).intValue());
		industryVO.setName((String) out.get("PO_NAME"));
		industryVO.setRegdate((Timestamp) out.get("PO_REGDATE"));
		
		return industryVO;
	}
	
	@Override
	public int insert(IndustryVO data) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update("insert into industry(no, name, regdate) values(?, ?, systimestamp)", 
				new Object[] {data.getNo(), data.getName()});
	}
	
	@Override
	public List<IndustryVO> selectList() {
		RowMapper<IndustryVO> rowMapper = new RowMapper<IndustryVO>() {
			
			@Override
			public IndustryVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				IndustryVO industry = new IndustryVO();
				industry.setName(rs.getString("name"));
				industry.setNo(rs.getInt("no"));
				industry.setRegdate(rs.getTimestamp("regdate"));
				
				return industry;
			}
		};
		return jdbcTemplate.query("select * from industry", rowMapper);
	}
	
	public List<String> getIndName(int indNo) {
		RowMapper<String> rowMapper = new RowMapper<String>() {
			
			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				String res = rs.getString("name");
				return res;
			}
		};
		return jdbcTemplate.query("select name from industry where no=?", rowMapper, new Object[] {indNo});
	}

}
