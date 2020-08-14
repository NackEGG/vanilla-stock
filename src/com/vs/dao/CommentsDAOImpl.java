package com.vs.dao;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.vs.vo.CommentsVO;
import com.vs.vo.CompanyVO;

@Repository
public class CommentsDAOImpl implements CommentsDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public SimpleJdbcCall getSimpleJdbcCall() {
		return new SimpleJdbcCall(jdbcTemplate);
	}
	
	@Override
	public boolean insert(CommentsVO vo) {
		
		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall();
		
		try {
			
			simpleJdbcCall
			.withProcedureName("USP_ADD_COMMENTS");
			
			SqlParameterSource in = new MapSqlParameterSource()
					.addValue("PI_MEMBER_NO", vo.getMemberNo())
					.addValue("PI_ARTICLE_NO", vo.getArticleNo())
					.addValue("PI_CONTENT", vo.getContent());
			
			simpleJdbcCall.execute(in);
			
			return true;
		
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean insertPickComments(CommentsVO commentsVO) {
		
		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall();
		
		try {
			
			simpleJdbcCall
			.withProcedureName("USP_ADD_PICK_AND_COMMENTS");
			
			SqlParameterSource in = new MapSqlParameterSource()
					.addValue("PI_MEMBER_NO", commentsVO.getMemberNo())
					.addValue("PI_ARTICLE_NO", commentsVO.getArticleNo())
					.addValue("PI_CONTENT", commentsVO.getContent())
					.addValue("PI_OPINION", commentsVO.getOpinion());
			
			simpleJdbcCall.execute(in);
			
			return true;
		
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Map<String, List<CommentsVO>> getCommentsByOpinion(int articleNo, int start, int end) {

		Map<String,List<CommentsVO>> result = new ConcurrentHashMap<String, List<CommentsVO>>();
		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall();
		
		CommentsRowMapper rowMapper = new CommentsRowMapper();
		
		class CommentsRowMapper implements RowMapper<CommentsVO>{

			@Override
			public CommentsVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				CommentsVO vo = new CommentsVO();
				vo.setNo(rs.getInt("no"));
				vo.setMemberNo(rs.getInt("member_no"));
				vo.setArticleNo(rs.getInt("article_no"));
				vo.setContent(rs.getString("content"));
				vo.setOpinion(rs.getString("opinion"));
				vo.setNickname(rs.getString("nickname"));
				return vo;
			}	
		}
		
		simpleJdbcCall
		.withProcedureName("USP_GET_PICK_AND_COMMENTS")
		.returningResultSet("PO_GOOD_CURSOR", rowMapper)
		.returningResultSet("PO_BAD_CURSOR", rowMapper);
		
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("PI_ARTICLE_NO", articleNo)
				.addValue("PI_START", start)
				.addValue("PI_END", end);
		
		Map out = simpleJdbcCall.execute(in);
		
		result.put("goodComments", (List<CommentsVO>) out.get("PO_GOOD_CURSOR"));
		result.put("badComments", (List<CommentsVO>) out.get("PO_BAD_CURSOR"));
		
		return result;
	}		
	
	@Override
	public int[] getTotalCountCommentsByOpinion(int articleNo) {
		
		int[] result = new int[] {0,0};
		
		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall();
		
		simpleJdbcCall
		.withProcedureName("USP_TOTAL_COUNT_COMMENTS");
		
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("PI_ARTICLE_NO", articleNo);
		
		Map out = simpleJdbcCall.execute(in);
		
		if(out.get("PO_GOOD_COUNT") != null) {
			result[0] = ((BigDecimal) out.get("PO_GOOD_COUNT")).intValue();
		}
		
		if(out.get("PO_BAD_COUNT") != null) {
			result[1] = ((BigDecimal) out.get("PO_BAD_COUNT")).intValue();
		}
		
		return result;	
	}

	@Override
	public List<CommentsVO> getRecentComments(String stockCode, int num) {
		
		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall();
		
		CommentsRowMapper rowMapper = new CommentsRowMapper();
		
		simpleJdbcCall
		.withProcedureName("USP_GET_RECENT_COMMENTS")
		.returningResultSet("PO_CURSOR", new RowMapper<CommentsVO>() {

			@Override
			public CommentsVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				CommentsVO vo = new CommentsVO();
				vo.setNo(rs.getInt("no"));
				vo.setMemberNo(rs.getInt("member_no"));
				vo.setArticleNo(rs.getInt("article_no"));
				vo.setContent(rs.getString("content"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setOpinion(rs.getString("opinion"));
				return vo;
			}
		});
		
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("PI_STOCK_CODE", stockCode)
				.addValue("PI_NUM", num);

		Map out = simpleJdbcCall.execute(in);
		
		return (List<CommentsVO>) out.get("PO_CURSOR");
	}
	
	public class CommentsRowMapper implements RowMapper<CommentsVO>{

		@Override
		public CommentsVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			CommentsVO vo = new CommentsVO();
			vo.setNo(rs.getInt("no"));
			vo.setMemberNo(rs.getInt("member_no"));
			vo.setArticleNo(rs.getInt("article_no"));
			vo.setContent(rs.getString("content"));
			vo.setOpinion(rs.getString("opinion"));
			vo.setNickname(rs.getString("nickname"));
			return vo;
		}	
	}
	
}
