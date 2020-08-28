package com.vs.dao;

import com.vs.vo.LikesVO;

public interface LikesDAO {
	public boolean insertLikes(LikesVO vo);
	public boolean deleteLikes(LikesVO vo);
}
