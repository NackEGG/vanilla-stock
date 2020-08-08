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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vs.biz.CompanyBIZ;
import com.vs.biz.IndustryBIZ;
import com.vs.biz.StockRecordsBIZ;
import com.vs.vo.IndustryVO;
import com.vs.vo.StockRecordsVO;

import javafx.util.Pair;

import com.vs.vo.CardPageVO;
import com.vs.vo.CompanyVO;
import com.vs.util.CardPageUtil;

@Controller
@RequestMapping("/cardpage")
public class CardPageController {
	@Autowired
	private StockRecordsBIZ stockRecordsBIZ;
	@Autowired
	private IndustryBIZ industryBIZ ;
	@Autowired
	private CompanyBIZ companyBIZ ;

	@RequestMapping("/init")
	public String initCardPage(HttpServletRequest request, HttpServletResponse response, Model model) {	
		String[] Date = CardPageUtil.getStartEndDate();		// 0:Start, 1:End(오늘)
		
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
		//List<Pair<StockRecordsVO, String>> rs = stockRecordsBIZ.selectStockWithCompany(Date[0], Date[1]);
		List<Pair<StockRecordsVO, String>> rs = stockRecordsBIZ.selectStockWithCompany("2020-07-28", "2020-07-29");
				
		CardPageUtil.makeCardDataMap(cardDataMap, rs, indNoList);
		cardDataMap.remove("9999");//"없음"로우 삭제		
		//CardPageUtil.printCardDataMap(cardDataMap, indNoList);
		
		model.addAttribute("cardDataMap", cardDataMap);		
		return "industryCardPage";
	}///
	
	
	@RequestMapping(value="/init/{indNo}", method=RequestMethod.GET)
	public String detailCard(@PathVariable int indNo,Model model) {
		List<CompanyVO> comlist = companyBIZ.selectCompany(indNo);
		model.addAttribute("comlist",comlist);
		
		Map<String, CardPageVO> cardDataMap = new HashMap<String, CardPageVO>();
		List<String> indNoList = new ArrayList<String>();
		
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
		cardDataMap.remove("9999");//"없음"로우 삭제		
				
		model.addAttribute("cardDataMap", cardDataMap);	
		
		return "industryDetailPage";
	}
}