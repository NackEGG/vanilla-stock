package com.vs.vo;

import java.sql.Timestamp;

public class CompanyVO {
	private String stockCode;
	private String company;
	private int industryNo;
	private int stockListed;
	private int capital;
	private int facevalue;
	private String currency;
	private String tel;
	private String address;
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

	@Override
	public String toString() {
		return "CompanyVO [ company=" + company + "]";
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

	public int getStockListed() {
		return stockListed;
	}

	public void setStockListed(int stockListed) {
		this.stockListed = stockListed;
	}

	public int getCapital() {
		return capital;
	}

	public void setCapital(int capital) {
		this.capital = capital;
	}

	public int getFacevalue() {
		return facevalue;
	}

	public void setFacevalue(int facevalue) {
		this.facevalue = facevalue;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
