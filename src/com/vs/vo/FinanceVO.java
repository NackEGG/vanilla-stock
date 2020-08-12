package com.vs.vo;

import java.sql.Timestamp;

public class FinanceVO {
	private int no;
	private int year;
	private int quarter;
	private String stockCode;
	private String accountCode;
	private long accountValue;
	private Timestamp regdate;
	private String labelKor;
	
	public FinanceVO() {
		// TODO Auto-generated constructor stub
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

	public String getStockCode() {
		return stockCode;
	}

	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}

	public String getAccountCode() {
		return accountCode;
	}

	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode;
	}

	public long getAccountValue() {
		return accountValue;
	}

	public void setAccountValue(long accountValue) {
		this.accountValue = accountValue;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getLabelKor() {
		return labelKor;
	}

	public void setLabelKor(String labelKor) {
		this.labelKor = labelKor;
	}
	
}
