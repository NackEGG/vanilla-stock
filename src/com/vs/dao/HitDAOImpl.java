package com.vs.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HitDAOImpl implements HitDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
}
