package com.vs.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.text.DecimalFormat;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class StockApiUtil {

	String geturl = "";
	String jongCd = "";
	String gettime = "";
	String janggubun = "";
	String DungRakrate_str = "";

	int timeconclude_length = 0;
	int dailystock_length = 0;
	int Askprice_length = 0;
	int Hoga_length = 0;

	int CurJuka = 0;
	int Debi = 0;
	float StandardPrice = 0;
	float DungRakrate = 0;

	String up = "▲";
	String down = "▼";
	String bohab = "─";
	String line = "";
	String xml = "";

	String Stockinfo[] = new String[21];
	String Timeconclude[][] = new String[10][7];
	String Dailystock[][] = new String[10][9];
	String Askprice[][] = new String[5][4];
	String Hoga[] = new String[22];

	Document doc = null;

	public StockApiUtil(String stockCode) {

		InputStream is = null;
		InputStreamReader isr = null;

		geturl = "http://asp1.krx.co.kr/servlet/krx.asp.XMLSiseEng?code=" + stockCode;
		jongCd = stockCode;
		
		try {
			URL url = new URL(geturl);
			URLConnection conn = url.openConnection();
			HttpURLConnection httpConnection = (HttpURLConnection) conn;

			is = new URL(geturl).openStream();
			isr = new InputStreamReader(is, "UTF-8");

			BufferedReader rd = new BufferedReader(isr, 400);

			StringBuffer strbuf = new StringBuffer();

			// xml line1 공백제거
			while ((line = rd.readLine()) != null) {
				strbuf.append(line);
			}

			// System.out.println("주가정보");
			// System.out.println(strbuf.toString()); //xml파싱확인

			DocumentBuilderFactory docFact = DocumentBuilderFactory.newInstance();
			docFact.setNamespaceAware(true);
			DocumentBuilder docBuild = docFact.newDocumentBuilder();

			doc = docBuild.parse(new InputSource(new StringReader(strbuf.toString())));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String[] getStockInfoAPI() {

		/* 주가정보 */
		NodeList stockInfo = doc.getElementsByTagName("stockInfo");

		NamedNodeMap stockinfo = stockInfo.item(0).getAttributes();
		gettime = stockinfo.getNamedItem("myNowTime").getNodeValue();
		janggubun = stockinfo.getNamedItem("myJangGubun").getNodeValue();
		

		NodeList TBL_StockInfo = doc.getElementsByTagName("TBL_StockInfo");
		NamedNodeMap StockInfo = TBL_StockInfo.item(0).getAttributes();

		Stockinfo[0] = StockInfo.getNamedItem("JongName").getNodeValue(); // 종목명
		Stockinfo[1] = StockInfo.getNamedItem("CurJuka").getNodeValue(); // 현재가
		Stockinfo[2] = StockInfo.getNamedItem("DungRak").getNodeValue(); // 전일대비코드
		Stockinfo[3] = StockInfo.getNamedItem("Debi").getNodeValue(); // 전일대비
		Stockinfo[4] = StockInfo.getNamedItem("PrevJuka").getNodeValue(); // 전일종가
		Stockinfo[5] = StockInfo.getNamedItem("Volume").getNodeValue(); // 거래량
		Stockinfo[6] = StockInfo.getNamedItem("Money").getNodeValue(); // 거래대금
		Stockinfo[7] = StockInfo.getNamedItem("StartJuka").getNodeValue(); // 시가
		Stockinfo[8] = StockInfo.getNamedItem("HighJuka").getNodeValue(); // 고가
		Stockinfo[9] = StockInfo.getNamedItem("LowJuka").getNodeValue(); // 저가
		Stockinfo[10] = StockInfo.getNamedItem("High52").getNodeValue(); // 52주 최고
		Stockinfo[11] = StockInfo.getNamedItem("Low52").getNodeValue(); // 52주 최저
		Stockinfo[12] = StockInfo.getNamedItem("UpJuka").getNodeValue(); // 상한가
		Stockinfo[13] = StockInfo.getNamedItem("DownJuka").getNodeValue(); // 하한가
		Stockinfo[14] = StockInfo.getNamedItem("Per").getNodeValue(); // PER
		Stockinfo[15] = StockInfo.getNamedItem("Amount").getNodeValue(); // 상장주식수
		Stockinfo[16] = StockInfo.getNamedItem("FaceJuka").getNodeValue(); // 액면가
		
		// 등락율 계산
		CurJuka = Integer.parseInt(Stockinfo[1].replaceAll(",", ""));
		Debi = Integer.parseInt(Stockinfo[3].replaceAll(",", ""));

		/* 등락구분코드 */
		// 1 - 상한, 2 - 상승, 3 - 보합, 4 - 하한, 5 - 하락

		if (Stockinfo[2].equals("1") || Stockinfo[2].equals("2") || Stockinfo[2].equals("3")) {
			StandardPrice = CurJuka - Debi;
		} else if (Stockinfo[2].equals("4") || Stockinfo[2].equals("5")) {
			StandardPrice = CurJuka + Debi;
		}

		// 등락률 = (당일종가 - 기준가) / 기준가 * 100
		// 기준가 = 당일종가(현재가) - 전일대비
		DungRakrate = ((CurJuka - StandardPrice) / StandardPrice) * 100;
		DungRakrate_str = String.format("%.2f", DungRakrate);
		Stockinfo[17] = DungRakrate_str;
		
		// 조회시간 + 장구분 추가
		Stockinfo[18] = gettime;
		Stockinfo[19] = janggubun;
		Stockinfo[20] = jongCd;
			
		return Stockinfo;
	}

	public String[][] getDailyStockAPI(){
		
		/* 일자별시세 */
	
		NodeList TBL_Dailystock = doc.getElementsByTagName("DailyStock");

		dailystock_length = TBL_Dailystock.getLength();

		for (int j = 0; j < dailystock_length; j++) {

			NamedNodeMap DailyStock = TBL_Dailystock.item(j).getAttributes();

			Dailystock[j][0] = DailyStock.getNamedItem("day_Date").getNodeValue(); // 일자
			Dailystock[j][1] = DailyStock.getNamedItem("day_EndPrice").getNodeValue(); // 종가
			Dailystock[j][2] = DailyStock.getNamedItem("day_getDebi").getNodeValue(); // 전일대비
			Dailystock[j][3] = DailyStock.getNamedItem("day_Start").getNodeValue(); // 시가
			Dailystock[j][4] = DailyStock.getNamedItem("day_High").getNodeValue(); // 고가
			Dailystock[j][5] = DailyStock.getNamedItem("day_Low").getNodeValue(); // 저가
			Dailystock[j][6] = DailyStock.getNamedItem("day_Volume").getNodeValue(); // 거래량
			Dailystock[j][7] = DailyStock.getNamedItem("day_getAmount").getNodeValue(); // 거래대금
			Dailystock[j][8] = DailyStock.getNamedItem("day_Dungrak").getNodeValue(); // 전일대비코드

		}

		return Dailystock;
	}
		
	public String[][] getTimeConcludeAPI(){
		
		/* 시간대별 체결가 */

		NodeList TBL_TimeConclude = doc.getElementsByTagName("TBL_TimeConclude");

		timeconclude_length = TBL_TimeConclude.getLength() - 1;
		for (int i = 0; i < timeconclude_length; i++) {

			NamedNodeMap TimeConclude = TBL_TimeConclude.item(i + 1).getAttributes();

			Timeconclude[i][0] = TimeConclude.getNamedItem("time").getNodeValue(); // 시간
			Timeconclude[i][1] = TimeConclude.getNamedItem("negoprice").getNodeValue(); // 체결가
			Timeconclude[i][2] = TimeConclude.getNamedItem("Debi").getNodeValue(); // 전일대비
			Timeconclude[i][3] = TimeConclude.getNamedItem("sellprice").getNodeValue(); // 매도호가
			Timeconclude[i][4] = TimeConclude.getNamedItem("buyprice").getNodeValue(); // 매수호가
			Timeconclude[i][5] = TimeConclude.getNamedItem("amount").getNodeValue(); // 체결량
			Timeconclude[i][6] = TimeConclude.getNamedItem("Dungrak").getNodeValue(); // 전일대비코드
		}
		
		return Timeconclude;
	}
		
	public String[][] getAskPriceAPI(){
		
		/* 증권사별거래 */
		
		NodeList TBL_AskPrice = doc.getElementsByTagName("AskPrice");

		Askprice_length = TBL_AskPrice.getLength();
		for (int i = 0; i < Askprice_length; i++) {

			NamedNodeMap AskPrice = TBL_AskPrice.item(i).getAttributes();

			Askprice[i][0] = AskPrice.getNamedItem("member_memdoMem").getNodeValue(); // 매도증권사
			Askprice[i][1] = AskPrice.getNamedItem("member_memdoVol").getNodeValue(); // 매도거래량
			Askprice[i][2] = AskPrice.getNamedItem("member_memsoMem").getNodeValue(); // 매수증권사
			Askprice[i][3] = AskPrice.getNamedItem("member_mesuoVol").getNodeValue(); // 매수거래량
		}
		return Askprice;
	}
	
	public String[] getHogaAPI() {
		
		/* 호가 */

		NodeList TBL_Hoga = doc.getElementsByTagName("TBL_Hoga");

		Hoga_length = TBL_Hoga.getLength();

		NamedNodeMap hoga = TBL_Hoga.item(0).getAttributes();

		Hoga[0] = hoga.getNamedItem("mesuJan0").getNodeValue(); // 매수잔량
		Hoga[1] = hoga.getNamedItem("mesuHoka0").getNodeValue(); // 매수호가
		Hoga[2] = hoga.getNamedItem("mesuJan1").getNodeValue(); // 매수잔량
		Hoga[3] = hoga.getNamedItem("mesuHoka1").getNodeValue(); // 매수호가
		Hoga[4] = hoga.getNamedItem("mesuJan2").getNodeValue(); // 매수잔량
		Hoga[5] = hoga.getNamedItem("mesuHoka2").getNodeValue(); // 매수호가
		Hoga[6] = hoga.getNamedItem("mesuJan3").getNodeValue(); // 매수잔량
		Hoga[7] = hoga.getNamedItem("mesuHoka3").getNodeValue(); // 매수호가
		Hoga[8] = hoga.getNamedItem("mesuJan4").getNodeValue(); // 매수잔량
		Hoga[9] = hoga.getNamedItem("mesuHoka4").getNodeValue(); // 매수호가
		Hoga[10] = hoga.getNamedItem("medoHoka0").getNodeValue(); // 매도잔량
		Hoga[11] = hoga.getNamedItem("medoJan0").getNodeValue(); // 매도호가
		Hoga[12] = hoga.getNamedItem("medoHoka1").getNodeValue(); // 매도잔량
		Hoga[13] = hoga.getNamedItem("medoJan1").getNodeValue(); // 매도호가
		Hoga[14] = hoga.getNamedItem("medoHoka2").getNodeValue(); // 매도잔량
		Hoga[15] = hoga.getNamedItem("medoJan2").getNodeValue(); // 매도호가
		Hoga[16] = hoga.getNamedItem("medoHoka3").getNodeValue(); // 매도잔량
		Hoga[17] = hoga.getNamedItem("medoJan3").getNodeValue(); // 매도호가
		Hoga[18] = hoga.getNamedItem("medoHoka4").getNodeValue(); // 매도잔량
		Hoga[19] = hoga.getNamedItem("medoJan4").getNodeValue(); // 매도호가

		DecimalFormat formatter = new DecimalFormat("###,###,###");

		Hoga[20] = formatter.format(Integer.parseInt(Hoga[0].replace(",", ""))
				+ Integer.parseInt(Hoga[2].replace(",", "")) + Integer.parseInt(Hoga[4].replace(",", ""))
				+ Integer.parseInt(Hoga[6].replace(",", "")) + Integer.parseInt(Hoga[8].replace(",", "")));
		Hoga[21] = formatter.format(Integer.parseInt(Hoga[11].replace(",", ""))
				+ Integer.parseInt(Hoga[13].replace(",", "")) + Integer.parseInt(Hoga[15].replace(",", ""))
				+ Integer.parseInt(Hoga[17].replace(",", "")) + Integer.parseInt(Hoga[19].replace(",", "")));
		return Hoga;
		
		

	}
}
