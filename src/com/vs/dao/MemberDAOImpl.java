package com.vs.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.vs.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	private static final String MAPPER = "com.vs.mapper.MemberMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(MemberVO vo){
		System.out.println("===>Mybatis로 로그인 check");
		String email = sqlSession.selectOne(MAPPER + ".loginCheck", vo);
		return (email == null) ? false : true ;
	}

	@Override
	public MemberVO viewMember(MemberVO vo) {
		
		return sqlSession.selectOne("member.viewMember", vo);
	}
}
