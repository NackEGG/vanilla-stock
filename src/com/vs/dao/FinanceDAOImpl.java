package com.vs.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FinanceDAOImpl implements FinanceDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
}
