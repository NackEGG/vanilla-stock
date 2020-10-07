package com.vs.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.vs.vo.FinanceCateVO;

@Repository
public class FinanceCateDAOImpl implements FinanceCateDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int insertViaJSON(FinanceCateVO financeCate) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update("insert into account(sj_div, code, name, bsns_de, label_kor, label_eng) values(?, ?, ?, ?, ?, ?)",
				new Object[] {financeCate.getSjDiv(), financeCate.getAccountId(), financeCate.getAccountNm() ,financeCate.getBsnsDe(),financeCate.getLabelKor(), financeCate.getLabelEng()});
	}
}
