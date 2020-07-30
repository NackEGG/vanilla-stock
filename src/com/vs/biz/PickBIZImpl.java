package com.vs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.PickDAO;

@Service
public class PickBIZImpl implements PickBIZ {
	@Autowired
	private PickDAO pickDAO;
}
