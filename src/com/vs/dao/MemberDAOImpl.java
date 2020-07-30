package com.vs.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	private static final String MAPPER = "com.vs.mapper.MemberMapper.";
}
