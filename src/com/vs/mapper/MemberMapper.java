package com.vs.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.vs.vo.MemberVO;

@Mapper
public interface MemberMapper {

	@Select("select no, email, password, birthday, score, utl_raw.cast_to_varchar2(dbms_lob.substr(profile, dbms_lob.getlength(profile))) profile ,gender, nickname, regdate\n"
			+ "from MEMBER where email = #{email} and password=#{password}")
	public MemberVO loginCheck(MemberVO mem);
	
	@Select("select email,nickname from member where email=#{email}")
	public MemberVO selectByEmail(MemberVO mem);
	
	@Insert("insert into member(no,email,password,birthday,gender,score,nickname,regdate) values(member_seq.nextval,#{email},#{password},#{birthday},#{gender},1500.0,#{nickname},sysdate)")
	public int join(MemberVO mem);
}
