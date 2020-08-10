package com.vs.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface MemberMapper {

	@Select("select email, password from member where email = #{email} and password=#{password}")
	public String loginCheck(
			@Param("email") String email, @Param("password") String password);
}
