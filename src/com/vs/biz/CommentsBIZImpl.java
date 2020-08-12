package com.vs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.CommentsDAO;
import com.vs.vo.CommentsVO;

@Service
public class CommentsBIZImpl implements CommentsBIZ {
	
	@Autowired
	private CommentsDAO commentsDAO;

	@Override
	public boolean insert(CommentsVO vo) {
		return commentsDAO.insert(vo);
	}
}
