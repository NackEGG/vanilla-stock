package com.vs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.LikesDAO;

@Service
public class LikesBIZImpl implements LikesBIZ {
	@Autowired
	private LikesDAO likesDAO;
	
}
