package com.vs.dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.vs.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
  
  @Autowired
	private JdbcTemplate jdbcTemplate;
  
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	private static final String MAPPER = "com.vs.mapper.MemberMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectTotal(String searchWord) {
		SimpleJdbcCall funcTotalMemberCount = new SimpleJdbcCall(jdbcTemplate);
		funcTotalMemberCount.withFunctionName("total_member");
		SqlParameterSource in = new MapSqlParameterSource().addValue("search_word", searchWord);
		double count = funcTotalMemberCount.executeFunction(BigDecimal.class, in).doubleValue();
		Integer c = (int) count;
		return c;
	}
	
	@Override
	public List<MemberVO> selectList(String searchWord, String sortType, int startPage, int endPage) {
		SimpleJdbcCall procedureSelectMember = new SimpleJdbcCall(jdbcTemplate)
				.withProcedureName("select_member").returningResultSet("memberVO", new RowMapper<MemberVO>() {
					
					@Override
					public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
						MemberVO memberVO = new MemberVO();
						memberVO.setBirthday(rs.getDate("birthday"));
						memberVO.setEmail(rs.getString("email"));
						memberVO.setGender(rs.getString("gender"));
						memberVO.setNickname(rs.getString("nickname"));
						memberVO.setNo(rs.getInt("no"));
						memberVO.setPassword(rs.getString("password"));
						memberVO.setProfile(rs.getString("profile"));
						memberVO.setRegdate(rs.getTimestamp("regdate"));
						memberVO.setScore(rs.getDouble("score"));
						memberVO.setCountArticles(rs.getInt("countArticles"));
						memberVO.setCountComments(rs.getInt("countComments"));
						memberVO.setCountVisits(rs.getInt("countVisits"));
						return memberVO;
					}
				});
		
		SqlParameterSource in = new MapSqlParameterSource().addValue("search_word", searchWord)
				.addValue("sort_type", sortType)
				.addValue("start_page", startPage)
				.addValue("end_page", endPage);
		Map<String, Object> out = procedureSelectMember.execute(in);
		System.out.println(out);
		List<MemberVO> memberVOList = (List<MemberVO>)out.get("OUT_CURSOR");
		
		return memberVOList;
	}
    
    @Override
	public MemberVO loginCheck(MemberVO vo){
    	
    	MemberVO mem = null;
    	
    	try(SqlSession session = sqlSessionFactory.openSession()){
    		mem = session.selectOne(MAPPER+"loginCheck", vo);
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	
		System.out.println("===>Mybatis로 로그인 check "+ vo.getEmail());
		return mem;
		
	}

	@Override
	public void logout(HttpSession session) {
		System.out.println("로그아웃!!!!!!");
		session.invalidate();
		
	}
 
//    @Override
//	public MemberVO viewMember(MemberVO vo) {
//		return sqlSession.selectOne("member.viewMember", vo);
//	}
}
