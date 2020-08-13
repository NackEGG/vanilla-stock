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
		//System.out.println(searchWord);
		//System.out.println(searchType);
		//System.out.println(sortType);
		//System.out.println(startPage);
		//System.out.println(endPage);
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
}
