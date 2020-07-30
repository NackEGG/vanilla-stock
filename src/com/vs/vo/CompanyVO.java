package com.vs.vo;

import java.sql.Timestamp;

public class CompanyVO {
	private String stockCode;
	private String company;
	private int industryNo;
	private Timestamp regdate;
	
	public CompanyVO() {
		// TODO Auto-generated constructor stub
	}

	public String getStockCode() {
		return stockCode;
	}

	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getIndustryNo() {
		return industryNo;
	}

	public void setIndustryNo(int industryNo) {
		this.industryNo = industryNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
