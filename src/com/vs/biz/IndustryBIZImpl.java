package com.vs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.IndustryDAO;

@Service
public class IndustryBIZImpl implements IndustryBIZ{
	@Autowired
	private IndustryDAO industryDAO;
}
