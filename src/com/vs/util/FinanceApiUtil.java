package com.vs.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.DataNode;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Entities;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.vs.vo.CompanyVO;
import com.vs.vo.FinanceCateVO;
import com.vs.vo.IndustryVO;
import com.fasterxml.jackson.core.type.TypeReference;

@Component
public class FinanceApiUtil {
	
	
   public List<FinanceCateVO> getFinanceCateAPI(){
	   ObjectMapper om = new ObjectMapper();
		om.configure(Feature.ALLOW_UNQUOTED_CONTROL_CHARS, true);
		List<FinanceCateVO> allList = new ArrayList<>();
		String[] fileNameArr = {"BS1","CF3","CIS1","IS1"};
		for(String fileName : fileNameArr){
			
			try {
				// 본인의 finance_cate_api 폴더가 있는 경로를 작성 
				List<FinanceCateVO> cateList 
				= om.readValue(new File("c:/springwork/vanilla-stock/db/finance_cate_api/"+fileName+".txt"),
						new TypeReference<List<FinanceCateVO>>(){});
				allList.addAll(cateList);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	   
//		for(FinanceCateVO f : allList) { //test 2020.08.02 by kim-dabin
//			System.out.println(f.getAccountNm());
//		}
	   
	   return allList;
   }

	public List<CompanyVO> getCompanyCrawling(List<IndustryVO> industryList) {
		List<CompanyVO> companyList = null;
		int i = 0;
		try {
			companyList = new ArrayList<CompanyVO>();
			for (IndustryVO industry : industryList) {
				String url = "https://finance.naver.com/sise/sise_group_detail.nhn?type=upjong&no=" + industry.getNo();
				Document doc = Jsoup.connect(url).get();//jsoup 으로 html 갖고 오기
				Elements elements = doc.select("table.type_5");//업종별 시세 리스트 테이블만 갖고 오기 
				//System.out.print((++i)+" ) ");
				for(Element e : elements) {
					/*
					 *    <td class="name">
    						<div class="name_area">
     							<a href="/item/main.nhn?code=024910">경창산업</a> <span class="dot">*</span>
    						</div></td> 
					 * 
					 * */
					Elements nameAreas = e.getElementsByClass("name_area");
					
					for(Element nameArea : nameAreas) {
						CompanyVO company = new CompanyVO();
						Element companyNode = nameArea.child(0);
						String[] stockCodes = companyNode.attr("href").split("=");
						//System.out.println("[ "+stockCodes[1]+" : "+companyNode.text()+" ]"); //test 2020.08.01 by kim-dabin 
						company.setCompany(companyNode.text());
						company.setStockCode(stockCodes[1]);
						company.setIndustryNo(industry.getNo());
						companyList.add(company);
					}//for end 
				
				}//for end 
//				System.out.println();
//				System.out.println();

			} // for end
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //

		return companyList;
	}

	public List<IndustryVO> getIndustryCrawling(HttpServletRequest request, HttpServletResponse response) {
		List<IndustryVO> industryList = null;
		try {
			industryList = new ArrayList<IndustryVO>();
			request.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			String url = "https://finance.naver.com/sise/sise_group.nhn?type=upjong";
			Document doc = Jsoup.connect(url).get();
			Elements elements = doc.select("table");
			Element element = elements.get(0);
			Elements tableElements = element.getAllElements();
			for (Element e : tableElements) {
				if (e.tagName().equals("a")) {
					// 여기에 저장
					IndustryVO industry = new IndustryVO();
					String[] arr = e.attr("href").split("=");
					industry.setName(e.text()); // 회사 종목
					industry.setNo(Integer.valueOf(arr[arr.length - 1])); // 회사 종목 고유 아이디
					industryList.add(industry);
				} // if end
			} // for end

			System.out.println("[ " + industryList.toString() + " ]");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return industryList;
	}// getCrawling() end

}
