package com.vs.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

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
}
