package com.vs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.CommentsDAO;

@Service
public class CommentsBIZImpl implements CommentsBIZ {
	@Autowired
	private CommentsDAO commentsDAO;
}
