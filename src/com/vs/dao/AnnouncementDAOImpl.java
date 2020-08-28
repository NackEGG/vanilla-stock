package com.vs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.vs.vo.AnnouncementVO;

@Repository
public class AnnouncementDAOImpl implements AnnouncementDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public AnnouncementVO recentAnnouncement() {
		String sql = "select * from (select*from announcement order by regdate desc) where rownum=1";
		AnnouncementVO vo = null;
		try {
		RowMapper<AnnouncementVO> rowmapper = new RowMapper<AnnouncementVO>() {

			@Override
			public AnnouncementVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				AnnouncementVO vo = new AnnouncementVO();
				vo.setNo(rs.getInt("NO"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setContent(rs.getBlob("CONTENT").toString());
				vo.setRegdate(rs.getTimestamp("REGDATE"));
				return vo;
			}
		};
		vo = jdbcTemplate.queryForObject(sql, rowmapper,new Object[] {});
		} catch (Exception e) {
			e.printStackTrace();
			vo = null;
		}
		
		System.out.println(vo);
		return vo;
	
		
	}
	
}
