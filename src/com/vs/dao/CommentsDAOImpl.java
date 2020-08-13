package com.vs.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.vs.vo.CommentsVO;
import com.vs.vo.CompanyVO;

@Repository
public class CommentsDAOImpl implements CommentsDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public SimpleJdbcCall getSimpleJdbcCall() {
		return new SimpleJdbcCall(jdbcTemplate);
	}
	
	@Override
	public boolean insert(CommentsVO vo) {
		
		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall();
		
		try {
			
			simpleJdbcCall
			.withProcedureName("USP_ADD_COMMENTS");
			
			SqlParameterSource in = new MapSqlParameterSource()
					.addValue("PI_MEMBER_NO", vo.getMemberNo())
					.addValue("PI_ARTICLE_NO", vo.getArticleNo())
					.addValue("PI_CONTENT", vo.getContent());
			
			simpleJdbcCall.execute(in);
			
			return true;
		
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}		
}
