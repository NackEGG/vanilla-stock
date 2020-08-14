package com.vs.vo;

import java.sql.Timestamp;

public class ArticleVO {
	private int total;
	private int no;
	private String title;
	private String stockCode;
	private int memberNo;
	private Timestamp regdate;
	private String company;
	private String industry;
	private String nickname;
	private int buyingCount;
	private int sellCount;
	private int commentsCount;
	private String companyName;
	private int countHit;
	private int countGood;
	private int countBad;
	private int countComments;
	
	public ArticleVO() {
		// TODO Auto-generated constructor stub
	}

	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	public String getCompany() {
		return company;
	}




	public void setCompany(String company) {
		this.company = company;
	}




	public String getIndustry() {
		return industry;
	}




	public void setIndustry(String industry) {
		this.industry = industry;
	}




	public String getNickname() {
		return nickname;
	}




	public void setNickname(String nickname) {
		this.nickname = nickname;
	}




	public int getBuyingCount() {
		return buyingCount;
	}




	public void setBuyingCount(int buyingCount) {
		this.buyingCount = buyingCount;
	}




	public int getSellCount() {
		return sellCount;
	}




	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}




	public int getCommentsCount() {
		return commentsCount;
	}




	public void setCommentsCount(int commentsCount) {
		this.commentsCount = commentsCount;
	}




	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStockCode() {
		return stockCode;
	}

	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public int getCountHit() {
		return countHit;
	}

	public void setCountHit(int countHit) {
		this.countHit = countHit;
	}

	public int getCountGood() {
		return countGood;
	}

	public void setCountGood(int countGood) {
		this.countGood = countGood;
	}

	public int getCountBad() {
		return countBad;
	}

	public void setCountBad(int countBad) {
		this.countBad = countBad;
	}

	public int getCountComments() {
		return countComments;
	}

	public void setCountComments(int countComments) {
		this.countComments = countComments;
	}
	
}
