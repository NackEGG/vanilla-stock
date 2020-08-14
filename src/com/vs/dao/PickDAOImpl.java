package com.vs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.vs.vo.CompanyVO;
import com.vs.vo.PickVO;

@Repository
public class PickDAOImpl implements PickDAO{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public SimpleJdbcCall getSimpleJdbcCall() {
		return new SimpleJdbcCall(jdbcTemplate);
	}

	@Override
	public boolean insert(PickVO vo) {
		
		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall();

		try {
			
			simpleJdbcCall
			.withProcedureName("USP_ADD_PICK");
			
			SqlParameterSource in = new MapSqlParameterSource()
					.addValue("PI_OPINION", vo.getOpinion())
					.addValue("PI_MEMBER_NO", vo.getMemberNo())
					.addValue("PI_ARTICLE_NO", vo.getArticleNo());
			
			simpleJdbcCall.execute(in);
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<CompanyVO> popularComanylist() {
		String sql = "select company.company from company inner join article on article.stock_code=company.stock_code where article.no = (select article_no from pick where rownum<=3 group by article_no)";
		RowMapper<CompanyVO> rowmapper = new RowMapper<CompanyVO>(){
			
			@Override
			public CompanyVO mapRow(ResultSet rs, int rowNum) throws SQLException{
				CompanyVO vo = new CompanyVO();
				vo.setCompany(rs.getString("COMPANY"));
				
				return vo;
			}
		};
		
		
		return jdbcTemplate.query(sql, rowmapper);
	}
	
	
	
}
