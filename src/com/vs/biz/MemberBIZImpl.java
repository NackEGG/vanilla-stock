package com.vs.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.vs.dao.MemberDAO;
import com.vs.util.PaginateUtil;
import com.vs.vo.MemberVO;
import com.vs.vo.PageVO;

@Service
public class MemberBIZImpl implements MemberBIZ {
	@Autowired
	
	private MemberDAO memberDAO;
	
	@Override
	public Map<String, Object> selectList(String searchWord, String sortType, int page) {
		// TODO Auto-generated method stub
		int numPage = 50; //각 인덱스당 출력되는 유저 수 
		int numBlock = 5; //출력될 페이지 인덱스 개수 
		if(searchWord.isEmpty()||searchWord.length()<1)	searchWord = null;
		Map<String, Object> viewMap = new ConcurrentHashMap<String, Object>();
		List<MemberVO> memberList = new ArrayList<MemberVO>();
		PaginateUtil paginateUtil = new PaginateUtil();
		PageVO pageVO = new PageVO(page, numPage);
		int startPage = pageVO.getStart();
		int endPage = pageVO.getEnd();
		memberList = memberDAO.selectList(searchWord, sortType, startPage, endPage);
		//멤버 리스트 
		viewMap.put("memberList", memberList);
		
		//총 멤버수 
		int total = memberDAO.selectTotal(searchWord);
		viewMap.put("paginate",paginateUtil.getPaginate(page, total, numPage, numBlock, "/manager/member"));
		
		 return viewMap;
	}
  @Override
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		boolean result = memberDAO.loginCheck(vo);
		if(result) { // true일 경우 세
		System.out.println("true");
		session.setAttribute("email", vo.getEmail()); //세션 변수 등록 
		}
			
		return result;
	}

	@Override
	public MemberVO viewMember(MemberVO vo) {
		
		return memberDAO.viewMember(vo);
	}
}
