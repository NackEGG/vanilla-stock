package com.vs.vo;

//카드페이지를 위한 산업군별 데이터
public class CardPageVO {
	private int industryNo;
	private String industryName;
	
	private int totalCnt;
	private int incCnt;
	private int decCnt;
	
	private double CRateSum;
	private double ChangeRate;

	public double getCRateSum() {
		return CRateSum;
	}

	public void setCRateSum(double cRateSum) {
		CRateSum = cRateSum;
	}
	
	public void addCRateSum(double cRateSum) {
		CRateSum += cRateSum;
	}
	
	public int getIndustryNo() {
		return industryNo;
	}

	public void setIndustryNo(int industryNo) {
		this.industryNo = industryNo;
	}

	public String getIndustryName() {
		return industryName;
	}

	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	
	public void increaseTotalCnt() {
		this.totalCnt++;
	}

	public int getIncCnt() {
		return incCnt;
	}

	public void setIncCnt(int incCnt) {
		this.incCnt = incCnt;
	}

	public void increaseIncCnt() {
		this.incCnt++;
	}
	
	public int getDecCnt() {
		return decCnt;
	}

	public void setDecCnt(int decCnt) {
		this.decCnt = decCnt;
	}
	
	public void increaseDecCnt() {
		this.decCnt++;
	}
	
	public double getChangeRate() {
		return ChangeRate;
	}

	public void setChangeRate(double changeRate) {
		ChangeRate = changeRate;
	}
	
	
}
