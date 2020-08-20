package com.vs.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vs.biz.AnnouncementBIZ;

import com.vs.biz.PickBIZ;

import com.vs.biz.CompanyBIZ;
import com.vs.biz.IndustryBIZ;
import com.vs.biz.StockRecordsBIZ;
import com.vs.util.CardPageUtil;
import com.vs.util.HtmlReaderUtil;
import com.vs.vo.AnnouncementVO;
import com.vs.vo.CardPageVO;
import com.vs.vo.CompanyVO;
import com.vs.vo.StockRecordsVO;

import javafx.util.Pair;


@Controller
public class MainPageController {
	@Autowired
	private StockRecordsBIZ stockRecordsBIZ;
	@Autowired
	private IndustryBIZ industryBIZ ;
	@Autowired
	private CompanyBIZ companyBIZ ;
	@Autowired
	AnnouncementBIZ announcementBIZ;
	
	@Autowired
	PickBIZ pickBIZ;
	

	@RequestMapping(path="/" , method=RequestMethod.GET)
	public String recentAnnouncement(Model model) {
		
		List<String> companyList = companyBIZ.selectAllCompanyName();
		String list = announcementBIZ.recentAnnouncement();
		System.out.println("공지사항!!!!!!!");
		model.addAttribute("announce",list);
		model.addAttribute("companyList", companyList);
		
		//예나 수정
		/*String[] Date = CardPageUtil.getLastDate(2);		// 0:Start, 1:End(오늘)
		//List<Pair<StockRecordsVO, String>> rs = stockRecordsBIZ.selectStockWithCompanyByIndustry(indNo, Date[0], Date[1]);
		List<Pair<StockRecordsVO, String>> rs = stockRecordsBIZ.selectStockWithCompany("2020-07-28", "2020-07-29");
		
		// DB 데이터
		//List<Pair<StockRecordsVO, String>> rs = stockRecordsBIZ.selectStockWithCompany("2020-07-28", "2020-07-29");
		
		
		// 실시간 데이터 가져오기
		//표 데이터
		List<CardPageVO> MainDataList = new ArrayList<CardPageVO>();
		List<CompanyVO> ComList = companyBIZ.getList();
	
        for(CompanyVO curCom : ComList) {
        	CardPageVO tmpVO = new CardPageVO();
            String comCode = curCom.getStockCode();
            
        	// 주가 정보 가져오기
	        String html = HtmlReaderUtil.getHtml("http://asp1.krx.co.kr/servlet/krx.asp.XMLSiseEng?code=" + comCode);
		    System.out.println(comCode);
	        
	        JSONObject json = XML.toJSONObject(html);
		    Map<String, Object> resultMap = HtmlReaderUtil.parseJsonToMap(json.toString());
		    
		    // 주가 정보 파싱
		    Map<String, Object> TBL_StockInfo = (Map<String, Object>) ((Map<String, Object>)(resultMap.get("stockprice"))).get("TBL_StockInfo");
		    String curJuka 	= TBL_StockInfo.get("CurJuka") + "";
		    String Debi 	= TBL_StockInfo.get("Debi") + "";
	
		    // List에 담기
		    double dJuka = Double.parseDouble(curJuka.replace(",", ""));
		    double dDebi = Double.parseDouble(Debi.replace(",", ""));
		    tmpVO.setJuka(Integer.parseInt(curJuka.replace(",", "")));
		    tmpVO.setDebi(Integer.parseInt(Debi.replace(",", "")));
		    tmpVO.setChangeRate(dDebi / dJuka * 100);
		    System.out.println(curJuka + "/"+Debi);
		    
		    MainDataList.add(tmpVO);
        }
        // 정렬
        Collections.sort(MainDataList);
        List<CardPageVO> revList = MainDataList;
        model.addAttribute("Bottom10List", revList);
        Collections.reverse(MainDataList);
        model.addAttribute("Top10List", MainDataList);
		*/
		List<CompanyVO> popularcompany = pickBIZ.popularComanylist();
		System.out.println("최근인기종목!!!!! " + popularcompany.get(0).getCompany());
		model.addAttribute("popular",popularcompany);
		System.out.println(model.toString());
		
		return "index";
		
	}
	
	@RequestMapping(path="/main1" , method=RequestMethod.GET)
	public String popularCompany(Model model) {
		
		List<CompanyVO> popularcompany = pickBIZ.popularComanylist();
		System.out.println("최근인기종목!!!!! " + popularcompany.get(0).getCompany());
		model.addAttribute("popular",popularcompany);
		System.out.println(model.toString());
		return "index";
	}
	
	
}
