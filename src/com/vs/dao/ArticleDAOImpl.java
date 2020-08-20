package com.vs.dao;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.vs.vo.ArticleVO;
import com.vs.vo.FinanceManagerJoinVO;
import com.vs.vo.PageVO;

@Repository
public class ArticleDAOImpl implements ArticleDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;


	public SimpleJdbcCall getSimpleJdbcCall(JdbcTemplate jdbcTemplate) {
		return new SimpleJdbcCall(jdbcTemplate);
	}
	
	@Override
	public List<ArticleVO> selectJoinList(String tab, String searchWord, int startYear, int startQuarter, int endYear,
			int endQuarter, int startPage, int endPage, String sortType) {
		SimpleJdbcCall procedureSelectContents = new SimpleJdbcCall(jdbcTemplate);
		System.out.println(procedureSelectContents.toString());
		procedureSelectContents.withProcedureName("select_contents").returningResultSet("CON_CURSOR",new RowMapper<ArticleVO>() {
			@Override
			public ArticleVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ArticleVO vo = new ArticleVO();
				vo.setNo(rs.getInt("no"));
				vo.setCompany(rs.getString("company"));
				vo.setIndustry(rs.getString("industry"));
				vo.setNickname(rs.getString("nickname"));
				vo.setMemberNo(rs.getInt("memberNo"));
				vo.setTitle(rs.getString("title"));
				vo.setStockCode(rs.getString("stockCode"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setBuyingCount(rs.getInt("buyingCount"));
				vo.setSellCount(rs.getInt("sellCount"));
				vo.setCommentsCount(rs.getInt("commentsCount"));
				vo.setTotal(rs.getInt("total"));
				return vo;
			}
			
		});//
		
		System.out.println(tab+" "+searchWord+" "+startYear+" "+startQuarter+" "+endYear+" "+endQuarter+" "+startPage+" "+endPage+" "+sortType);
		
		SqlParameterSource in = new MapSqlParameterSource().addValue("tab", tab)
				.addValue("search_word", searchWord).addValue("start_year", startYear)
				.addValue("start_quarter", startQuarter).addValue("end_year", endYear)
				.addValue("end_quarter", endQuarter).addValue("start_page", startPage)
				.addValue("end_page", endPage).addValue("sort_type",sortType);
		
		Map<String, Object> out = procedureSelectContents.execute(in);
		
		for(String key : out.keySet()) {
			System.out.println(key+" : "+out.get(key));
		}
		
		@SuppressWarnings("unchecked")
		List<ArticleVO>  voList = (List<ArticleVO>) out.get("CON_CURSOR");
		
		//System.out.println(voList.get(0).getCompany());
		
		return voList;
	}
	// 페이지 게시물 선택 조회
	@Override
	public ArticleVO select(int no) {
		
		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall(jdbcTemplate);
		
		simpleJdbcCall
		.withProcedureName("USP_GET_ARTICLE");
		
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("PI_NO", no);

		Map out = simpleJdbcCall.execute(in);
		
		ArticleVO vo = new ArticleVO();
		vo.setNo(no);
		vo.setTitle((String) out.get("PO_TITLE"));
		vo.setStockCode((String) out.get("PO_STOCK_CODE"));
		vo.setMemberNo(((BigDecimal) out.get("PO_MEMBER_NO")).intValue());
		vo.setRegdate((Timestamp) out.get("PO_REGDATE"));
		vo.setCompanyName((String) out.get("PO_COMPANY_NAME"));
		vo.setCountHit(((BigDecimal) out.get("PO_COUNT_HIT")).intValue());
		vo.setCountGood(((BigDecimal) out.get("PO_COUNT_GOOD")).intValue());
		vo.setCountBad(((BigDecimal) out.get("PO_COUNT_BAD")).intValue());
		vo.setCountComments(((BigDecimal) out.get("PO_COUNT_COMMENTS")).intValue());
		return vo;
	}
	
	// 해당 페이지 정보에 속하는 ArticleVO를 List로
	@Override
	public List<ArticleVO> getPageList(String searchWord, String searchType, String sortType, int startPage, int endPage) {
		
		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall(jdbcTemplate);
		
		simpleJdbcCall
		.withProcedureName("USP_GET_PAGE_ARTICLE")
		.returningResultSet("PO_CURSOR", new ArticleRowMapper());
		
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("PI_SEARCH_WORD", searchWord)
				.addValue("PI_SEARCH_TYPE", searchType)
				.addValue("PI_SORT_TYPE", sortType)
				.addValue("PI_START", startPage)
				.addValue("PI_END", endPage);
		
		Map out = simpleJdbcCall.execute(in);
		
		return (List<ArticleVO>) out.get("PO_CURSOR");
		
	}
	
	@Override
	public boolean insert(ArticleVO articleVO) {
		
		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall(jdbcTemplate);
		
		try {
			simpleJdbcCall
			.withProcedureName("USP_ADD_ARTICLE");
			
			SqlParameterSource in = new MapSqlParameterSource()
					.addValue("PI_TITLE", articleVO.getTitle())
					.addValue("PI_COMPANY_NAME", articleVO.getCompanyName())
					.addValue("PI_MEMBER_NO", articleVO.getMemberNo());
			
			Map<String, Object> out = simpleJdbcCall.execute(in);
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public int getTotal(String searchWord, String searchType) {
		
		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall(jdbcTemplate);
		
		simpleJdbcCall
		.withProcedureName("USP_TOTAL_COUNT_ARTICLE");
		
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("PI_SEARCH_WORD", searchWord)
				.addValue("PI_SEARCH_TYPE", searchType);

		Map out = simpleJdbcCall.execute(in);
		
		int ret = ((BigDecimal) out.get("PO_ARTICLE_COUNT")).intValue();
		
		return ret;
		
	}
	
	public class ArticleRowMapper implements RowMapper<ArticleVO>{

		@Override
		public ArticleVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ArticleVO vo = new ArticleVO();
			vo.setNo(rs.getInt("NO"));
			vo.setTitle(rs.getString("TITLE"));
			vo.setStockCode(rs.getString("STOCK_CODE"));
			vo.setMemberNo(rs.getInt("MEMBER_NO"));
			vo.setRegdate(rs.getTimestamp("REGDATE"));
			vo.setCompanyName(rs.getString("COMPANY_NAME"));
			vo.setCountHit(rs.getInt("COUNT_HIT"));
			vo.setCountGood(rs.getInt("COUNT_GOOD"));
			vo.setCountBad(rs.getInt("COUNT_BAD"));
			return vo;
		}
	}

}
