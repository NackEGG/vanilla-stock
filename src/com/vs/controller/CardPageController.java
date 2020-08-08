package com.vs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		List<CompanyVO> comlist = companyBIZ.selectCompany(indNo);
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
    public Object restController(@RequestBody StringPairVO jamong) {
        System.out.println(jamong.getStr1()+"");
        System.out.println(jamong.getStr2()+"");
        
        ArrayList<List<Double>> arrList = new ArrayList<List<Double>>();
        List<Double> tmpList1 = comCRateMapForCN.get(jamong.getStr1()+"");
        List<Double> tmpList2 = comCRateMapForCN.get(jamong.getStr2()+"");
        arrList.add(tmpList1);
        arrList.add(tmpList2);
        
        return arrList;
    }
}