package com.vs.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.vs.vo.MemberVO;

@Service("memeberValidator")
public class MemeberValidator implements Validator{
	
	private static final String emailRegExp =
            "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
            "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	private Pattern pattern;
	
	public MemeberValidator() {
		pattern= Pattern.compile(emailRegExp);
	}
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object object, Errors errors) {
		MemberVO member=(MemberVO) object;
		
		if(member.getEmail() == null || member.getEmail().trim().isEmpty()) {
			errors.rejectValue("email", "required", "필수정보 입니다.");
		}else {
			Matcher matcher = pattern.matcher(member.getEmail());
			if(!matcher.matches()) {
				errors.rejectValue("email", "bad","올바르지 않는 형식입니다.");
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nickname", "required", "필수 정보 입니다.");
		System.out.println(errors);
        ValidationUtils.rejectIfEmpty(errors, "password", "required", "필수 정보 입니다.");
        ValidationUtils.rejectIfEmpty(errors, "checkPw", "required", "필수 정보 입니다.");
        if(!member.getPassword().isEmpty()) {
            if(!member.isPwEqualToCheckPw()) {
                errors.rejectValue("checkPw", "nomatch", "비밀번호가 일치하지 않습니다.");
            }
        }
        ValidationUtils.rejectIfEmpty(errors, "gender", "required", "필수 정보 입니다.");
		
	}

}
