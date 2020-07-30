package com.vs.vo;

import java.sql.Date;

public class FinanceCateVO {
	private String sjDiv;
	private String accountId;
	private String accountNm;
	private Date bsnsDe;
	private String labelKor;
	private String labelEng;
	
	public FinanceCateVO() {
		// TODO Auto-generated constructor stub
	}

	public String getSjDiv() {
		return sjDiv;
	}

	public void setSjDiv(String sjDiv) {
		this.sjDiv = sjDiv;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getAccountNm() {
		return accountNm;
	}

	public void setAccountNm(String accountNm) {
		this.accountNm = accountNm;
	}

	public Date getBsnsDe() {
		return bsnsDe;
	}

	public void setBsnsDe(Date bsnsDe) {
		this.bsnsDe = bsnsDe;
	}

	public String getLabelKor() {
		return labelKor;
	}

	public void setLabelKor(String labelKor) {
		this.labelKor = labelKor;
	}

	public String getLabelEng() {
		return labelEng;
	}

	public void setLabelEng(String labelEng) {
		this.labelEng = labelEng;
	}
	
	
}
