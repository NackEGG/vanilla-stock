package com.vs.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class PickDAOImpl implements PickDAO{
	@Autowired
	private JdbcTemplate jdbcTemplate;
}
