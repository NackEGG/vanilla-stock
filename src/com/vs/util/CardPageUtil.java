package com.vs.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.vs.vo.CardPageVO;
import com.vs.vo.CompanyVO;
import com.vs.vo.StockRecordsVO;

import javafx.util.Pair;

public class CardPageUtil {

	// 최근 days개의 평일 날짜 가져오기
	public static String[] getLastDate(int days) {
		Calendar cal = Calendar.getInstance();
		int dayofweek = 0;
		String format = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);

		String[] res = new String[days]; // 0:Start, 1:End

		// 마지막 날짜 구하기
		if (cal.get(cal.HOUR_OF_DAY) < 9) {
			cal.add(cal.DATE, -1);
		}
		
		// End Date = 오늘 기준으로...
		for(int i=0; i<days; i++) {			
			dayofweek = cal.get(cal.DAY_OF_WEEK);
			if (dayofweek == 1) {
				cal.add(cal.DATE, -2);
			} else if (dayofweek == 7) {
				cal.add(cal.DATE, -1);
			}
			res[days - i - 1] = sdf.format(cal.getTime());
			cal.add(cal.DATE, -1);
		}

		return res;
	}
	
	// cardDataMap을 출력하는 함수
	public static void printCardDataMap(Map<String, CardPageVO> cardDataMap
			, List<String> indNoList) {
		for (String indNo : indNoList) {
			try {
				CardPageVO curCVO = cardDataMap.get(indNo);
				int totalCnt = curCVO.getTotalCnt();
				int incCnt = curCVO.getIncCnt();
				int decCnt = curCVO.getDecCnt();
				int somthingleft = totalCnt - incCnt - decCnt;
				double CRate = curCVO.getChangeRate();
				
				/*
				 * System.out.println("["+curCVO.getIndustryName()+"] "+ totalCnt + " / " +
				 * incCnt + " / " + decCnt + " / " + somthingleft + " / " + CRate);
				 */
			} catch (Exception e) {
				System.out.println("[오류]");
			}

		} // for end
	}

	public static void makeCardDataMap(Map<String, CardPageVO> cardDataMap, List<Pair<StockRecordsVO, String>> rs,
			List<String> indNoList) {
		// ★ SELECT문에서 회사코드 -> 날짜(오름차순)로 정렬되어있는 상태여야 함
		// 산업군별 데이터VO에 데이터를 축적
		// - 회사 수
		// - 상승/하락/보합 상태인 회사들의 수
		// - 변동률 평균을 구하기 위한 각 회사 별 변동률 합계
		for (int i = 0; i < rs.size() - 1; i++) {
			// 첫번째 날짜
			StockRecordsVO svo1 = rs.get(i).getKey();
			String indNo1 = rs.get(i).getValue();
			String stockCode1 = svo1.getStockCode();

			// 두번째 날짜
			StockRecordsVO svo2 = rs.get(i + 1).getKey();
			String indNo2 = rs.get(i + 1).getValue();
			String stockCode2 = svo2.getStockCode();

			// 같은 회사임?
			if (!indNo1.equals(indNo2) || !stockCode1.equals(stockCode2)) {
				System.out.println(indNo1 + "vs" + indNo2 + indNo1.equals(indNo2) + "  " + stockCode1 + "vs"
						+ stockCode2 + stockCode1.equals(stockCode2));

				continue;// 데이터 누락시 이전데이터 버림
			}

			/* System.out.printf(">" + indNo1 + " / " + stockCode1 + " -- "); */
			// 같은 회사임!
			// 변동률 구하기
			double close1 = svo1.getClose(); // 어제 종가
			double close2 = svo2.getClose(); // 오늘 종가
			double changeRate = (close2 - close1) / close1 * 100;
			cardDataMap.get(indNo1).addCRateSum(changeRate);
			/* System.out.printf(changeRate + " ... "); */

			// 개수 세기
			cardDataMap.get(indNo1).increaseTotalCnt();
			if (changeRate > 0) {
				cardDataMap.get(indNo1).increaseIncCnt();
				/* System.out.printf("▲\n"); */
			} else if (changeRate < 0) {
				cardDataMap.get(indNo1).increaseDecCnt();
				/* System.out.printf("▼\n"); */
			} else {
				/* System.out.printf("-\n"); */
			}

			i++;
		}

		// 산업군의 변동률 계산
		for (String indNo : indNoList) {
			double cRateSum = 0;
			int totalCnt = 0;
			try {
				cRateSum = cardDataMap.get(indNo).getCRateSum();
				totalCnt = cardDataMap.get(indNo).getTotalCnt();

			} catch (Exception e) {
				System.out.println("[ ERROR indNo  " + indNo + " ]");
			}

			cardDataMap.get(indNo).setChangeRate(cRateSum / totalCnt);
		}
		
	}
	
	public static CardPageVO getIndustryTableData(List<Pair<StockRecordsVO, String>> rs) {
		CardPageVO retVO = new CardPageVO();
		
		for (int i = 0; i < rs.size() - 1; i++) {
			// 첫번째 날짜
			StockRecordsVO svo1 = rs.get(i).getKey();
			String indNo1 = rs.get(i).getValue();
			String stockCode1 = svo1.getStockCode();

			// 두번째 날짜
			StockRecordsVO svo2 = rs.get(i + 1).getKey();
			String indNo2 = rs.get(i + 1).getValue();
			String stockCode2 = svo2.getStockCode();

			// 같은 회사임?
			if (!indNo1.equals(indNo2) || !stockCode1.equals(stockCode2)) {
				System.out.println(indNo1 + "vs" + indNo2 + indNo1.equals(indNo2) + "  " + stockCode1 + "vs"
						+ stockCode2 + stockCode1.equals(stockCode2));

				continue;// 데이터 누락시 이전데이터 버림
			}

			/* System.out.printf(">" + indNo1 + " / " + stockCode1 + " -- "); */
			// 같은 회사임!
			// 변동률 구하기
			double close1 = svo1.getClose(); // 어제 종가
			double close2 = svo2.getClose(); // 오늘 종가
			double changeRate = (close2 - close1) / close1 * 100;
			retVO.addCRateSum(changeRate);
			/* System.out.printf(changeRate + " ... "); */

			// 개수 세기
			retVO.increaseTotalCnt();
			if (changeRate > 0) {
				retVO.increaseIncCnt();
				/* System.out.printf("▲\n"); */
			} else if (changeRate < 0) {
				retVO.increaseDecCnt();
				/* System.out.printf("▼\n"); */
			} else {
				/* System.out.printf("-\n"); */
			}

			i++;
		}

		// 산업군의 변동률 계산
		double cRateSum = 0;
		int totalCnt = 0;
		try {
			cRateSum = retVO.getCRateSum();
			totalCnt = retVO.getTotalCnt();

		} catch (Exception e) {
			System.out.println("[ ERROR indNo  " + retVO.getIndustryNo() + " ]");
		}
		retVO.setChangeRate(cRateSum / totalCnt);
		
		return retVO;
	}
	
	public static Map<String, List<Double>> getCompanyCRateMap(List<Pair<StockRecordsVO, String>> rs, List<CompanyVO> comlist) {
		// 변수 선언
		Map<String, List<Double>> retMap = new HashMap<String, List<Double>>();	
		
		// Map에 각 회사 key 추가해주기
		for(CompanyVO curVO : comlist) {					
			List<Double> tempList = new ArrayList<Double>();
			retMap.put(curVO.getStockCode(), tempList);
		}
		
		int curCnt = 0;
		for (int i = 0; i < rs.size() - 1; i++) {
			// 첫번째 날짜
			StockRecordsVO svo1 = rs.get(i).getKey();
			String stockCode1 = svo1.getStockCode();

			// 두번째 날짜
			StockRecordsVO svo2 = rs.get(i + 1).getKey();
			String stockCode2 = svo2.getStockCode();

			// 같은 회사임?
			if (!stockCode1.equals(stockCode2)) {
				continue;// 데이터 누락시 이전데이터 버림
			}

			/* System.out.printf(">" + indNo1 + " / " + stockCode1 + " -- "); */
			// 같은 회사임!
			// 변동률 구하기
			double close1 = svo1.getClose(); // 어제 종가
			double close2 = svo2.getClose(); // 오늘 종가
			double changeRate = Math.round((close2 - close1) / close1 * 10000) / 100.0;
			// Map의 List에 넣기
			retMap.get(stockCode1).add(changeRate);
			curCnt++;
			
			/* System.out.printf(changeRate + "\n"); */
			if(curCnt >= 7) {
				i++;
				curCnt = 0;
			}
		}
		
		return retMap;
	}

	public static Map<String, List<Double>> changeKeySCtoCN(Map<String, List<Double>> comCRateMapForSC,
			List<CompanyVO> comlist) {
		Map<String, List<Double>> retMap = new HashMap<String, List<Double>>();	
		
		// Map에 각 회사 key 추가해주기
		for(CompanyVO curVO : comlist) {			
			List<Double> tempList = comCRateMapForSC.get(curVO.getStockCode());
			retMap.put(curVO.getCompany(), tempList);
		}
		
		return retMap;
	}
}
