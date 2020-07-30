package com.vs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.MemberDAO;

@Service
public class MemberBIZImpl implements MemberBIZ {
	@Autowired
	private MemberDAO memberDAO;
}
