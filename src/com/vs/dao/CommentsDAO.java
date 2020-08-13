package com.vs.dao;

import java.util.List;
import java.util.Map;

import com.vs.vo.CommentsVO;

public interface CommentsDAO {
	public boolean insert(CommentsVO vo);
	public boolean insertPickComments(CommentsVO commentsVO);
	public Map<String, List<CommentsVO>> getCommentsByOpinion(int articleNo, int start, int end);
	public int[] getTotalCountCommentsByOpinion(int articleNo);
}
