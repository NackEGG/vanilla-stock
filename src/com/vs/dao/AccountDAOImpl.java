package com.vs.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.vs.vo.AccountVO;

@Repository
public class AccountDAOImpl implements AccountDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int insertViaJSON(AccountVO account) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update("insert into account(sj_div, code, name, bsns_de, label_kor, label_eng) values(?, ?, ?, ?, ?, ?)",
				new Object[] {account.getSjDiv(), account.getAccountId(), account.getAccountNm() ,account.getBsnsDe(),account.getLabelKor(), account.getLabelEng()});
	}
}
