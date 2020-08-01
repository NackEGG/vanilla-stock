package com.vs.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.vs.vo.CompanyVO;

@Repository
public class CommentsDAOImpl implements CommentsDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
}
