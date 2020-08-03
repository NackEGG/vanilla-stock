package com.vs.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class FinanceCateVO {
	@JsonProperty("sj_div")
	private String sjDiv;
	@JsonProperty("account_id")
	private String accountId;
	@JsonProperty("account_nm")
	private String accountNm;
	@JsonProperty("bsns_de")
	private String bsnsDe;
	@JsonProperty("label_kor")
	private String labelKor;
	@JsonProperty("label_eng")
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

	public String getBsnsDe() {
		return bsnsDe;
	}
	public void setBsnsDe(String bsnsDe) {
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
