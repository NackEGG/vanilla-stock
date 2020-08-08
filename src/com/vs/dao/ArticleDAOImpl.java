package com.vs.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.vs.vo.ArticleVO;

@Repository
public class ArticleDAOImpl implements ArticleDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private SimpleJdbcCall simpleJdbcCall;
	
	@Override
	public boolean insert(ArticleVO articleVO) {
		simpleJdbcCall
		.withProcedureName("USP_ADD_ARTICLE");
		
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("PI_TITLE", articleVO.getTitle())
				.addValue("PI_STOCK_CODE", articleVO.getStockCode())
				.addValue("PI_MEMBER_NO", articleVO.getMemberNo());
		
		simpleJdbcCall.execute(in);
		
		return false;
	}
}
