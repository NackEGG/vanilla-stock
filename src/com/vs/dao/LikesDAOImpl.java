package com.vs.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.vs.vo.LikesVO;

@Repository
public class LikesDAOImpl implements LikesDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public SimpleJdbcCall getSimpleJdbcCall() {
		return new SimpleJdbcCall(jdbcTemplate);
	}

	@Override
	public boolean insertLikes(LikesVO vo) {

		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall();
		
		try {
			
			simpleJdbcCall
			.withProcedureName("USP_INSERT_LIKES");
			
			SqlParameterSource in = new MapSqlParameterSource()
					.addValue("PI_COMMENT_NO", vo.getCommentNo())
					.addValue("PI_MEMBER_NO", vo.getMemberNo());
			
			simpleJdbcCall.execute(in);
			
			return true;	
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
			
		}
		
	}

	@Override
	public boolean deleteLikes(LikesVO vo) {

		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall();
		
		try {
			
			simpleJdbcCall
			.withProcedureName("USP_DELETE_LIKES");
			
			SqlParameterSource in = new MapSqlParameterSource()
					.addValue("PI_COMMENT_NO", vo.getCommentNo())
					.addValue("PI_MEMBER_NO", vo.getMemberNo());
			
			simpleJdbcCall.execute(in);
			
			return true;	
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
			
		}
	}
}
