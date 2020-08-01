package com.vs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.vs.vo.IndustryVO;

@Repository
public class IndustryDAOImpl implements IndustryDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int insert(IndustryVO data) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update("insert into industry(no, name, regdate) values(?, ?, systimestamp)", 
				new Object[] {data.getNo(), data.getName()});
	}
	
	@Override
	public List<IndustryVO> selectList() {
		RowMapper<IndustryVO> rowMapper = new RowMapper<IndustryVO>() {
			
			@Override
			public IndustryVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				IndustryVO industry = new IndustryVO();
				industry.setName(rs.getString("name"));
				industry.setNo(rs.getInt("no"));
				industry.setRegdate(rs.getTimestamp("regdate"));
				
				return industry;
			}
		};
		return jdbcTemplate.query("select * from industry", rowMapper);
	}
}
