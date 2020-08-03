package com.vs.vo;

//카드페이지를 위한 산업군별 데이터
public class CardPageVO {
	private int industryNo;
	private String industryName;
	
	private int totalCnt;
	private int incCnt;
	private int decCnt;
	
	private double prevData;
	private double prevAverge;	
	
	private double nextData;
	private double nextAverge;

	private double ChangeRate;

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

	public int getIncCnt() {
		return incCnt;
	}

	public void setIncCnt(int incCnt) {
		this.incCnt = incCnt;
	}

	public int getDecCnt() {
		return decCnt;
	}

	public void setDecCnt(int decCnt) {
		this.decCnt = decCnt;
	}

	public double getPrevData() {
		return prevData;
	}

	public void setPrevData(double prevData) {
		this.prevData = prevData;
	}

	public double getPrevAverge() {
		return prevAverge;
	}

	public void setPrevAverge(double prevAverge) {
		this.prevAverge = prevAverge;
	}

	public double getNextData() {
		return nextData;
	}

	public void setNextData(double nextData) {
		this.nextData = nextData;
	}

	public double getNextAverge() {
		return nextAverge;
	}

	public void setNextAverge(double nextAverge) {
		this.nextAverge = nextAverge;
	}

	public double getChangeRate() {
		return ChangeRate;
	}

	public void setChangeRate(double changeRate) {
		ChangeRate = changeRate;
	}
	
	
}
