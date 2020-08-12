package com.vs.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.vs.vo.MemberVO;

@Mapper
public interface MemberMapper {

	@Select("select no, email, password, birthday, score, utl_raw.cast_to_varchar2(dbms_lob.substr(profile, dbms_lob.getlength(profile))) profile ,gender, nickname, regdate\n"
			+ "from MEMBER where email = #{email} and password=#{password}")
	public MemberVO loginCheck(MemberVO mem);
}
