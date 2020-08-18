package com.vs.biz;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.CommentsDAO;
import com.vs.util.PaginateUtil;
import com.vs.vo.ArticleVO;
import com.vs.vo.CommentsVO;
import com.vs.vo.PageVO;

@Service
public class CommentsBIZImpl implements CommentsBIZ {
	
	@Autowired
	private CommentsDAO commentsDAO;

	@Override
	public boolean insert(CommentsVO vo) {
		return commentsDAO.insert(vo);
	}

	@Override
	public boolean insertPickComments(CommentsVO commentsVO) {
		return commentsDAO.insertPickComments(commentsVO);
	}

	@Override
	public Map<String, Object> getCommentsByOpinion(int articleNo, int page) {
		
		int numPage = 5; // 각 인덱스당 출력되는 article 개수 
		int numBlock = 5; // 한 블록 내 인덱스 개수

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		PaginateUtil paginateUtil = new PaginateUtil();
		
		PageVO pageVO = new PageVO(page, numPage);
		int start = pageVO.getStart();
		int end = pageVO.getEnd();
		Map<String, List<CommentsVO>> pickComments = commentsDAO.getCommentsByOpinion(articleNo, start, end); 
		List<CommentsVO> goodCommentsList = pickComments.get("goodComments");
		List<CommentsVO> badCommentsList = pickComments.get("badComments");
		
		map.put("goodCommentsList", goodCommentsList);
		map.put("badCommentsList", badCommentsList);
		
		//총 게시물 수 
		int[] total = commentsDAO.getTotalCountCommentsByOpinion(articleNo);	
		map.put("paginateGood", paginateUtil.getPaginate(page, total[0], numPage, numBlock, "/vanilla-stock/ajax/articlePage/pickComments"));
		map.put("paginateBad", paginateUtil.getPaginate(page, total[1], numPage, numBlock, "/vanilla-stock/ajax/articlePage/pickComments"));
			
		return map;
	}

	@Override
	public List<CommentsVO> getRecentComments(String stockCode, int num) {
		return commentsDAO.getRecentComments(stockCode, num);
	}

	@Override
	public int[] getTotalCountCommentsByOpinion(int articleNo) {
		return commentsDAO.getTotalCountCommentsByOpinion(articleNo);
	}

	@Override
	public List<CommentsVO> getCommentsPage(int articleNo, int page) {
		
		int numPage = 10; // 더보기시 10개씩 추가
		
		PageVO pageVO = new PageVO(page, numPage);
		int start = pageVO.getStart();
		int end = pageVO.getEnd();
		
		List<CommentsVO> commentsList = commentsDAO.getCommentsPage(articleNo, start, end);
		
		return commentsList;
	}
}
