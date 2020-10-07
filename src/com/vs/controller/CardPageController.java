package com.vs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vs.biz.CompanyBIZ;
import com.vs.biz.IndustryBIZ;
import com.vs.biz.StockRecordsBIZ;
import com.vs.vo.IndustryVO;
import com.vs.vo.StockRecordsVO;

import javafx.util.Pair;

import com.vs.vo.CardPageVO;
import com.vs.vo.CompanyVO;
import com.vs.util.CardPageUtil;
import com.vs.util.HtmlReaderUtil;
import com.vs.vo.StringPairVO;

@Controller
@RequestMapping("/cardpage")
public class CardPageController {
	@Autowired
	private StockRecordsBIZ stockRecordsBIZ;
	@Autowired
	private IndustryBIZ industryBIZ ;
	@Autowired
	private CompanyBIZ companyBIZ ;
	
	public Map<String, List<Double>> comCRateMapForCN;
	public List<CompanyVO> comlist;
	
	
	
	@RequestMapping("/industry")
	public String getCardPage() {
		
		
		
		return "industryCardPage";
	}
	

	@RequestMapping("/init")
	public String initCardPage(HttpServletRequest request, HttpServletResponse response, Model model) {	
		String[] selectDate = CardPageUtil.getLastDate(2);		// 0:Start, 1:End(오늘)
		
		// 기존 데이터 삭제
		Map<String, CardPageVO> cardDataMap = new HashMap<String, CardPageVO>();
		List<String> indNoList = new ArrayList<String>();
		
		// INDUSTRY / Map 생성
		List<IndustryVO> indList = industryBIZ.getList();
		for(IndustryVO curInd : indList) {
			CardPageVO tempCVO = new CardPageVO();
			tempCVO.setIndustryNo(curInd.getNo());
			tempCVO.setIndustryName(curInd.getName());
			tempCVO.setTotalCnt(0);
			tempCVO.setIncCnt(0);
			tempCVO.setDecCnt(0);
			tempCVO.setCRateSum(0);
		
			cardDataMap.put(curInd.getNo() + "", tempCVO);
			indNoList.add(tempCVO.getIndustryNo()+"");
		}

		// STOCK_RECOREDS & COMPANY 데이터 Join해서 가져오기
		//List<Pair<StockRecordsVO, String>> rs = stockRecordsBIZ.selectStockWithCompany(selectDate[0], selectDate[1]);
		List<Pair<StockRecordsVO, String>> rs = stockRecordsBIZ.selectStockWithCompany("2020-07-28", "2020-07-29");
				
		CardPageUtil.makeCardDataMap(cardDataMap, rs, indNoList);
		cardDataMap.remove("9999");//"없음"로우 삭제		
		//CardPageUtil.printCardDataMap(cardDataMap, indNoList);
		
		model.addAttribute("cardDataMap", cardDataMap);	

		System.out.println("card page / cardDataMap 있음? : " + model.containsAttribute("cardDataMap"));
		return "industryCardPage";
	}///
	
	
	@RequestMapping(value="/init/{indNo}", method=RequestMethod.GET)
	public String detailCard(@PathVariable int indNo,Model model) {
		// 산업 기본 데이터 가져오기
		String indName = industryBIZ.getIndName(indNo).get(0);		
		model.addAttribute("detailIndName", indName);		
		model.addAttribute("detailIndNo", indNo + "");
		
		// 산업에 속한 회사 리스트 가져오기 --> comlist
		comlist = companyBIZ.selectCompany(indNo);
		model.addAttribute("comlist",comlist);

		// 산업 표 데이터 생성
		String[] Date = CardPageUtil.getLastDate(2);		// 0:Start, 1:End(오늘)
		//List<Pair<StockRecordsVO, String>> rs = stockRecordsBIZ.selectStockWithCompanyByIndustry(indNo, Date[0], Date[1]);
		List<Pair<StockRecordsVO, String>> rs = stockRecordsBIZ.selectStockWithCompanyByIndustry(indNo, "2020-07-28", "2020-07-29");
		
		CardPageVO cardDetailData = CardPageUtil.getIndustryTableData(rs);
		cardDetailData.setIndustryName(indName);
		cardDetailData.setIndustryNo(indNo);
		model.addAttribute("cardDetail", cardDetailData);
		
		// 회사 별 등락률 7개 계산 & Map 생성
		String selectDate[] = CardPageUtil.getLastDate(8);
		List<String> plotDate = new ArrayList<String>();
		
		for(String tmpDate : selectDate) {
			plotDate.add("'" + tmpDate + "'");
			
		}
		//List<Pair<StockRecordsVO, String>> rs2= stockRecordsBIZ.selectStockWithCompanyByIndustry(indNo, selectDate[0], selectDate[7]);
		List<Pair<StockRecordsVO, String>> rs2= stockRecordsBIZ.selectStockWithCompanyByIndustry(indNo, "2020-07-20", "2020-07-29");
		Map<String, List<Double>> comCRateMapForSC = CardPageUtil.getCompanyCRateMap(rs2, comlist);
		comCRateMapForCN = CardPageUtil.changeKeySCtoCN(comCRateMapForSC, comlist);
				
		model.addAttribute("plotDateList", plotDate);
		model.addAttribute("comCRateMapForSC", comCRateMapForSC);
		model.addAttribute("comCRateMapForCN", comCRateMapForCN);
		
		return "industryDetailPage";
	}
	
	@RequestMapping(value="/restController", method=RequestMethod.POST)
	@ResponseBody
    public Object restController(@RequestBody StringPairVO jamong, Model model) {
		String[] comName = new String[2];
		String[] comCode = new String[2];
		
		comName[0] = jamong.getStr1()+"";		
		comName[1] = jamong.getStr2()+"";
        System.out.println(comName[0] + "\n"+comName[1]);
        
        for(CompanyVO curVo : comlist) {
        	if(comName[0].equals(curVo.getCompany())) {
        		comCode[0] = curVo.getStockCode();
        	}else if(comName[1].equals(curVo.getCompany())) {
        		comCode[1] = curVo.getStockCode();
        	}
        }
        
        //CRate
        ArrayList<List<String>> arrList = new ArrayList<List<String>>();
        for(int i=0; i<2; i++) {
            List<String> tmpList = new ArrayList<String>();
            
            for(Double dData : comCRateMapForCN.get(comName[i])) {
            	tmpList.add(dData + "");
            }
            arrList.add(tmpList);            
        }
        
        //표 데이터
        for(String curCode : comCode) {
        	List<String> tmpList = new ArrayList<String>();
             
        	// 주가 정보 가져오기
	        String html = HtmlReaderUtil.getHtml("http://asp1.krx.co.kr/servlet/krx.asp.XMLSiseEng?code=" + curCode);
		    System.out.println(curCode);
	        
	        JSONObject json = XML.toJSONObject(html);
		    Map<String, Object> resultMap = HtmlReaderUtil.parseJsonToMap(json.toString());
		    
		    System.out.println(resultMap);
		    
		    // 주가 정보 파싱
		    Map<String, Object> TBL_StockInfo = (Map<String, Object>) ((Map<String, Object>)(resultMap.get("stockprice"))).get("TBL_StockInfo");
		    String curJuka 	= TBL_StockInfo.get("CurJuka") + "";
		    String Debi 	= TBL_StockInfo.get("Debi") + "";
		    String Volume 	= TBL_StockInfo.get("Volume") + "";
		    String PER 		= TBL_StockInfo.get("Per") + "";
		    String HighJuka = TBL_StockInfo.get("HighJuka") + "";
		    String LowJuka 	= TBL_StockInfo.get("LowJuka") + "";
	
		    // List에 담기
		    tmpList.add(curJuka);
		    tmpList.add(Debi);
		    tmpList.add(Volume);
		    tmpList.add(PER);
		    tmpList.add(HighJuka);
		    tmpList.add(LowJuka);
		    System.out.println(curJuka + "/"+Debi + "/"+Volume + "/"+PER + "/"+HighJuka + "/"+LowJuka);
		    
		    arrList.add(tmpList);
        }
        
	    return arrList;
    }
	//참고 페이지
	@RequestMapping(value = "/krx")
	public String krx(Model model) {
	     String html = HtmlReaderUtil.getHtml("http://asp1.krx.co.kr/servlet/krx.asp.XMLSiseEng?code=003620");
	     JSONObject json = XML.toJSONObject(html);
	     Map<String, Object> resultMap = HtmlReaderUtil.parseJsonToMap(json.toString());
	     model.addAttribute("map", resultMap);
	     
	     Map<String, Object> TBL_StockInfo = (Map<String, Object>) ((Map<String, Object>)(resultMap.get("stockprice"))).get("TBL_StockInfo");
	     String curJuka 	= TBL_StockInfo.get("CurJuka") + "";
	     String Debi 		= TBL_StockInfo.get("Debi") + "";
	     String Volume 		= TBL_StockInfo.get("Volume") + "";
	     String PER 		= TBL_StockInfo.get("Per") + "";
	     String HighJuka 	= TBL_StockInfo.get("HighJuka") + "";
	     String LowJuka 	= TBL_StockInfo.get("LowJuka") + "";

	     System.out.println(curJuka + "/"+Debi + "/"+Volume + "/"+PER + "/"+HighJuka + "/"+LowJuka);
	     
	     return "krx";
	 }
	
}