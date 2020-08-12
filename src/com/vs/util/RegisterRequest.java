package com.vs.util;

public class RegisterRequest {
    private String agree;
    private String email;
    private String nickname;
    private String pw;
    private String checkPw;
    private String BDYear, BDMon, BDDay;
    private String gender;

    
    public String getAgree() {
		return agree;
	}

	public void setAgree(String agree) {
		this.agree = agree;
	}

	//비밀번호 확인
    public boolean isPwEqualToCheckPw() {
        return pw.equals(checkPw);
    }
 
    public String getEmail() {
        return email;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }
  
    public String getNickname() {
        return nickname;
    }
 
    public void setNickname(String name) {
        this.nickname = name;
    }
 
    public String getPw() {
        return pw;
    }
 
    public void setPw(String pw) {
        this.pw = pw;
    }
 
    public String getCheckPw() {
        return checkPw;
    }
 
    public void setCheckPw(String checkPw) {
        this.checkPw = checkPw;
    }
 
    public String getBDYear() {
		return BDYear;
	}

	public void setBDYear(String bDYear) {
		BDYear = bDYear;
	}

	public String getBDMon() {
		return BDMon;
	}

	public void setBDMon(String bDMon) {
		BDMon = bDMon;
	}

	public String getBDDay() {
		return BDDay;
	}

	public void setBDDay(String bDDay) {
		BDDay = bDDay;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
}
