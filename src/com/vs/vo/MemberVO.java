package com.vs.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberVO {
	private int no;
	private String email;
	private String password;
	private Date birthday;
	private double score;
	private String gender;
	private String nickname;
	private String profile;
	private int countVisits;
	private int countComments;
	private int countArticles;
	private Timestamp regdate;
	
	//회원가입을 위한 VO
	private String agree;
    private String checkPw;
    private String BDYear, BDMon, BDDay;
	
    //비밀번호 확인
    public boolean isPwEqualToCheckPw() {
        return password.equals(checkPw);
    }
 
    public MemberVO() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberVO(String email, String password, Date birthday, String gender, String nickname) {
		super();
		this.email = email;
		this.password = password;
		this.birthday = birthday;
		this.gender = gender;
		this.nickname = nickname;
	}
	
	
	public String getAgree() {
		return agree;
	}

	public void setAgree(String agree) {
		this.agree = agree;
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

	public int getCountArticles() {
		return countArticles;
	}
	public int getCountComments() {
		return countComments;
	}
	public int getCountVisits() {
		return countVisits;
	}
	public void setCountArticles(int countArticles) {
		this.countArticles = countArticles;
	}
	
	public void setCountComments(int countComments) {
		this.countComments = countComments;
	}
	public void setCountVisits(int countVisits) {
		this.countVisits = countVisits;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
}
