package com.vs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.MemberLogDAO;

@Service
public class MemberLogBIZImpl implements MemberLogBIZ {
	@Autowired
	private MemberLogDAO memberLogDAO;
}
