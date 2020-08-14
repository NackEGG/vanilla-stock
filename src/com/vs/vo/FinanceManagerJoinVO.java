package com.vs.vo;

public class FinanceManagerJoinVO {
	private int total;
	private String name;// industry
	/*company*/
	private String company;
	private int stockListed;
	private int capital;
	private int facevalue;
	private String currency;
	private String stockCode;
	
	/*finance*/
	private int no;
	private int year;
	private int quarter;
	private String accountCode;
	private int accountValue;
	
	/*financeCate*/
	private String accountNm;
	private String labelKor;
	private String sjDiv;
	
	public FinanceManagerJoinVO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
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

	public String getStockCode() {
		return stockCode;
	}

	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getQuarter() {
		return quarter;
	}

	public void setQuarter(int quarter) {
		this.quarter = quarter;
	}

	public String getAccountCode() {
		return accountCode;
	}

	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode;
	}

	public int getAccountValue() {
		return accountValue;
	}

	public void setAccountValue(int accountValue) {
		this.accountValue = accountValue;
	}

	public String getAccountNm() {
		return accountNm;
	}

	public void setAccountNm(String accountNm) {
		this.accountNm = accountNm;
	}

	public String getLabelKor() {
		return labelKor;
	}

	public void setLabelKor(String labelKor) {
		this.labelKor = labelKor;
	}

	public String getSjDiv() {
		return sjDiv;
	}

	public void setSjDiv(String sjDiv) {
		this.sjDiv = sjDiv;
	}
	
	
	
	
	
	

}
