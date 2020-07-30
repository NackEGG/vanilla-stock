package com.vs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.FinanceCateDAO;

@Service
public class FinanceCateBIZImpl implements FinanceCateBIZ {
	@Autowired
	private FinanceCateDAO financeCateDAO;
}
