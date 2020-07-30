package com.vs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.HitDAO;

@Service
public class HitBIZImpl implements HitBIZ {
	@Autowired 
	private HitDAO hitDAO;
}
