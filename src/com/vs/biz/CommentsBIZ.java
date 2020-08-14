package com.vs.biz;

import java.util.List;
import java.util.Map;

import com.vs.vo.CommentsVO;

public interface CommentsBIZ {
	public boolean insert(CommentsVO vo);
	public boolean insertPickComments(CommentsVO commentsVO);
	public Map<String, Object> getCommentsByOpinion(int articleNo, int page);
	public int[] getTotalCountCommentsByOpinion(int articleNo);
	public List<CommentsVO> getRecentComments(String stockCode, int num);
}
