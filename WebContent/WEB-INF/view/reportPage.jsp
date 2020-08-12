<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.Date" %>
<%@ page import ="com.vs.util.StockApiUtil" %>
<%@ page import ="java.text.DecimalFormat" %>
<%@ page import ="java.util.Map" %>
<%
	String[] arrStockInfo = (String[])request.getAttribute("arrStockInfo");
	String[][] arrDailyStock = (String[][])request.getAttribute("arrDailyStock");
	String[][] arrTimeConclude = (String[][])request.getAttribute("arrTimeConclude");
	int prevMonthClose = (int)request.getAttribute("prevMonthClose");
	Map<String,Long> financeMap = (Map<String,Long>)request.getAttribute("financeMap");
	Map<String,Long> industryFinanceMap = (Map<String,Long>)request.getAttribute("industryFinanceMap");
	
	String today = arrStockInfo[18].substring(0,11);
	
	DecimalFormat formatter = new DecimalFormat("###,###"); 
	int monthDevi = Integer.parseInt(arrStockInfo[1].replaceAll(",", "")) - prevMonthClose;
	Float monthDeviPercent = monthDevi / Float.parseFloat(arrStockInfo[1].replaceAll(",", "")) * 100;
	
%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" href="/vanilla-stock/css/reset.css" />
	<link rel="stylesheet" href="/vanilla-stock/css/kakao.font.css" />
	<link rel="stylesheet" href="/vanilla-stock/css/default.css" />
	<link rel="stylesheet" href="/vanilla-stock/css/reportPage.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<script src="js/jquery.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	<script src="https://code.highcharts.com/highcharts-more.js"></script>
	<style type="text/css">
		#content{
			padding: 20px 0 50px 0;
		}
		#content .aux{
			background-color: #EEEEEE;
			color: black;
		}
		#upperContent{
			background-color: yellowgreen;
		}
		#lowerContent{
			background-color: #6200EE;
		}
		#summaryBox{
			display: flex;
			background-color: yellow;
			margin: 10px 10px;
			height: 300px;
		}
		#supportingBox{
			display: flex;
			background-color: indianred;
			margin: 10px 10px;
			height: 300px;
		}
		#descBox{
			height: inherit;
			width: 540px;
			background-color: #F4FF81;
		}
		#upperDescBox{
			display: flex;

		}
		#lowerDescBox{
			display: flex;
			height: 50%;
		}
		#companyName{
			font-size: 40px;
			padding: 10px;
		}
		#companyCode {
			font-size: 18px;
			padding-top: 37px;
		}
		#chartBox {
			width: 50%;
			height: inherit;
		}
		#industyBox{
			padding-left: 10px;
			padding-top: 5px;
			width: 33%;
			height: 74px;
		}
		#industryLogo{
			text-align: center;
		}
		#industyBox img{
			width: 95%;
    		height: 134px;
		}
		#industyName{
			text-align: center;
    		font-size: 15px;
    		margin-top: 8px;	
		}
		#industryAverageBox{
			text-align: center;
    		margin-top: 12px;
    		font-size: 26px;
		}
		#deviBox{
			padding-left: 10px;
			padding-top: 5px;
			width: 61%;
			height: 74px;
		}
		.stockPriceBox{
			display: flex;
		}
		.stockPriceName{
			padding: 29px 12px 0px 21px;
    		width: 53px;
		}
		.stockPrice{
			height: 61px;
    		width: 275px;
    		text-align: right;
    		font-size: 31px;
			margin: 10px 10px -13px 10px;
		}
		#presentPriceBox{
			padding-left: 10px;
			padding-top: 5px;
			width: 33%;
			height: 74px;
		}
		
		#sameIndustryBox{
			width: 25%;
			background-color: #7986cb;
		}
		#financeInfoBox{
			width: 50%;
			background-color: #FF80AB;
		}
		#articleBox{
			width: 50%;
			background-color: springgreen;
		}
		.deviPercent{
			width: 109px;
			text-align: right;
		}
		.daydeviName{
			width: 130px;
		}
		.percentBox{
			display: flex;
			padding: 5px 0px 8px 0px;
		}
		.upperTitle{
			height: 14%;
			padding: 5px 5px 0 5px;
			background-color: #2D230D;
		}
		.upperTitle .title{
			padding: 6px;
			font-size: 21px;
			width: 35%;
		}
		.highcharts-figure, .highcharts-data-table table {
			min-width: 320px;
			max-width: 800px;
			margin: 1em auto;
		}

		#container {
			height: inherit;
		}
		#container2 {
			height: inherit;
		}
		.highcharts-figure{
			min-width: 280px;
			max-width: 800px;
			margin: 1em auto;
			height: 94%;
		}

		.highcharts-data-table table {
			font-family: Verdana, sans-serif;
			border-collapse: collapse;
			border: 1px solid #EBEBEB;
			margin: 10px auto;
			text-align: center;
			width: 100%;
			max-width: 500px;
		}
		.highcharts-data-table caption {
			padding: 1em 0;
			font-size: 1.2em;
			color: #555;
		}
		.highcharts-data-table th {
			font-weight: 600;
			padding: 0.5em;
		}
		.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
			padding: 0.5em;
		}
		.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
			background: #f8f8f8;
		}
		.highcharts-data-table tr:hover {
			background: #f1f7ff;
		}
	</style>
	<script>
		$(function (){
			$('#container').highcharts({
				chart: {
					type: 'spline',
					animation: Highcharts.svg, // don't animate in old IE
					marginRight: 10,
					events: {
						load: function () {
							// set up the updating of the chart each second
							var series = this.series[0];
							var sc = $("#companyCode").text();
							setInterval(function () {
								const sc = $("#companyCode").text();
								var ret = 0;
								$.ajax({
									url:"/vanilla-stock/ajax/reportPage/rtprice/", 
									data : {no : sc},
									dataType : "json",
									type : "POST",
									error : function() {
										console.log(sc)
									},
									success : function (json) {
										var x = (new Date()).getTime();
										var y = json.result;
										series.addPoint([x, y], true, true);
									}
								});
							}, 10000);
						}
					}
				},
				time: {
					useUTC: false
				},

				title: {
					text: '실시간 주가 상황판'
				},
				accessibility: {
					announceNewData: {
						enabled: true,
						minAnnounceInterval: 15000,
						announcementFormatter: function (allSeries, newSeries, newPoint) {
							if (newPoint) {
								return 'New point added. Value: ' + newPoint.y;
							}
							return false;
						}
					}
				},
				xAxis: {
					type: 'datetime',
					tickPixelInterval: 150
				},

				yAxis: {
					title: {
						text: '주가'
					},
					plotLines: [{
						value: 0,
						width: 1,
						color: '#808080'
					}]
				},

				tooltip: {
					headerFormat: '<b>{series.name}</b><br/>',
					pointFormat: '{point.x:%Y-%m-%d %H:%M:%S}<br/>{point.y:.2f}'
				},

				legend: {
					enabled: false
				},

				exporting: {
					enabled: false
				},
				series: [{
					name: 'Random data',
					data: (function () {
						var time = (new Date()).getTime();
						var data = [{x: time - 90000,y: <%=Integer.parseInt(arrTimeConclude[9][1].replaceAll(",", ""))%>},
							{x:   time - 80000 ,y: <%=Integer.parseInt(arrTimeConclude[8][1].replaceAll(",", ""))%>},
							{x:   time - 70000 ,y: <%=Integer.parseInt(arrTimeConclude[7][1].replaceAll(",", ""))%>},
							{x:   time - 60000 ,y: <%=Integer.parseInt(arrTimeConclude[6][1].replaceAll(",", ""))%>},
							{x:   time - 50000 ,y: <%=Integer.parseInt(arrTimeConclude[5][1].replaceAll(",", ""))%>},
							{x:   time - 40000 ,y: <%=Integer.parseInt(arrTimeConclude[4][1].replaceAll(",", ""))%>},
							{x:   time - 30000 ,y: <%=Integer.parseInt(arrTimeConclude[3][1].replaceAll(",", ""))%>},
							{x:   time - 20000 ,y: <%=Integer.parseInt(arrTimeConclude[2][1].replaceAll(",", ""))%>},
							{x:   time - 10000 ,y: <%=Integer.parseInt(arrTimeConclude[1][1].replaceAll(",", ""))%>},
							{x:   time ,y: <%=Integer.parseInt(arrTimeConclude[0][1].replaceAll(",", ""))%>}];
						
						return data;
					}())
				}]
			});
		});
		
	</script> <!--// chart스크립트-->
</head>
<body>
	<div id="header">
		<div id="logoBox">
			<h1>
				<a href="" title="vanilla stock">
				<img src="${pageContext.request.contextPath}/img/vs-logo2.PNG" alt="vanilla stock"/>
				</a>
			</h1>
			
		</div><!--//#logoBox -->
		<div class="aux">
			<div id="gnb">
				<h2 class="screen_out">주요 서비스</h2>
				<ul>
					<li class="nav"><a href=""> 종목</a> </li>
					<li class="nav on"><a href=""> 투기장 </a></li>
					<li class="nav"><a href="">랭킹</a> </li>
				</ul>
			
			</div><!--//#gnb -->

			<div id="searchBox">
				<label class="screen_out">찾을 회사 입력</label>
						<input class="inp_txt" type="text" placeholder="회사명을 입력해주세요" />
						 <span class="btn_search"> <i class="fa fa-search"></i></span>
			</div><!--//#searchBox -->

		</div><!--//.aux -->
	<div id="loginBox">
		<div id="loginBtn" class="btn hidden">
			로그인
		</div><!--//loginBtn -->
		<div id="profileBox" class="">
			<h2 class="screen_out">유저정보</h2>
			<img src="/vanilla-stock/profile/profile.png"
			class="profile_on"  width="60" height="60"
			alt="테스터"
			title="테스터"/>
			<div id="profilePopup" class="profile_on">
				<ul id="profileList">
					<li class="profile"><a href="/user.jsp?no=3"><span class="open_door" >문</span> 
					<!--관리자는 관리자 페이지로 바꾸기 -->	
					마이페이지</a></li><!--//.profile -->
					<li class="profile"><a href="/logout.do"><span class="close_door" >문</span> 로그아웃</a></li><!--//.profile -->
				</ul><!--//profileList -->
			</div><!--//#profilePopup -->
		</div><!--#profileBox -->
		<script>
			const $profile = $("#profileBox img");
			const $profileTarget = $("#profilePopup");

			$profile.click(function () {
				$profileTarget.toggle();
        });// profileBox click end

			$("html").click(function(e){
				if(!$(e.target).hasClass("profile_on")){
					$profileTarget.hide();
				}
        });//
    </script>

		</div>
			
	</div><!--//#header -->
	<div id="content">
		<div class="aux">
			<div id="upperContent">
				<div id ="summaryBox">
					<div id="descBox">
						<div id ="upperDescBox">
							<div id="companyName">${companyVO.company}</div>
							<div id="companyCode">${companyVO.stockCode}</div>
						</div><!--//#upperDescBox-->
						<hr style="margin: -7px 10px 10px 10px">
						<div id="lowerDescBox">
							<div id="industyBox">
								<div id ="industryLogo">
									<img src="/vanilla-stock/icon/${industryVO.no}.png">
								</div><!--//#industryLogo -->
								<div id="industyName">
									${industryVO.name} 
								</div><!--//#industryName -->
								<div id ="industryAverageBox">
									<div id="industryAverage">0.45%+</div>			
								</div><!--//#presentPriceBox -->
							</div><!--//#industryBox -->
							<div id="deviBox">
								<div class = "stockPriceBox">
									<div class = "stockPriceName">현재가</div>
									<div class = "stockPrice">&#8361;<%=arrStockInfo[1].trim()%></div>
								</div>
								<hr style="margin: -6px 0px 9px 0px;">
								<div class = "percentBox">
									<div class = "daydeviName">전일대비</div>
									<div class = "deviPercent"><%=arrStockInfo[17]%>%
									<% if(arrStockInfo[2].equals("1") || arrStockInfo[2].equals("2")){%>
										▲ <%}else if(arrStockInfo[2].equals("4") || arrStockInfo[2].equals("5")){ %>
										▼ <%}else{ %>
										─ <%} %>
									</div>
									<div class = "daydeviName">전월대비</div>
									<div class = "deviPercent"><%= String.format("%.2f", monthDeviPercent)%>%
									<% if(monthDevi > 0){%>
										▲ <%}else if(monthDevi < 0){ %>
										▼ <%}else{ %>
										─ <%} %>
									</div>																			
								</div>
								<div class = "percentBox">
									<div class = "daydeviName">거래량</div>
									<div class = "deviPercent"><%=arrStockInfo[5]%></div>
									<div class = "daydeviName">거래금액</div>
									<div class = "deviPercent"><%=arrStockInfo[6]%></div>																			
								</div>
								<div class = "percentBox">
									<div class = "daydeviName">고가</div>
									<div class = "deviPercent"><%=arrStockInfo[8]%></div>
									<div class = "daydeviName">저가</div>
									<div class = "deviPercent"><%=arrStockInfo[9]%></div>																			
								</div>
								<div class = "percentBox">
									<div class = "daydeviName">52주최고가</div>
									<div class = "deviPercent"><%=arrStockInfo[10]%></div>
									<div class = "daydeviName">52주최저가</div>
									<div class = "deviPercent"><%=arrStockInfo[11]%></div>																			
								</div>
							</div><!--//#deviBox -->
						</div><!--//#lowerDescBox -->
					</div><!--//#descBox -->
					<div id="chartBox">
						<figure class="highcharts-figure">
						<div id="container"></div>
					</figure>
					</div><!--//#chartBox -->
				</div><!--//#summaryBox -->
			</div><!--//#upperContent -->
			<div id="lowerContent">
				<div id="supportingBox">
					<div id="financeInfoBox">
						<figure class="highcharts-figure">
								<div id="container2"></div>
							</figure>
						<script type="text/javascript">
					$(function (){
						$('#container2').highcharts({
						chart: {
					    	type: 'column'
					  	},
					  	title: {
					    	text: '한눈에 보는 재무정보'
					  	},
					  	xAxis: {
					    	categories: ['자산규모', '당기순이익', '유동자산', '매출액', '영업이익','현금자산']
					  	},
					  	credits: {
					    	enabled: false
					  	},
					  	series: [{
					    	name: '${companyVO.company}',
					   		data: [<%=financeMap.get("자본과부채총계")%>,
				    		<%=financeMap.get("당기순이익(손실)")%>,
				    		<%=financeMap.get("유동자산")%>,
				    		<%=financeMap.get("수익(매출액)")%>,
				    		<%=financeMap.get("영업이익(손실)")%>,
				    		<%=financeMap.get("현금및현금성자산")%>]
					  		}, {
					    	name: '동종업계 평균',
					    	data: [<%=industryFinanceMap.get("자본과부채총계")%>,
				    		<%=industryFinanceMap.get("당기순이익(손실)")%>,
				    		<%=industryFinanceMap.get("유동자산")%>,
				    		<%=industryFinanceMap.get("수익(매출액)")%>,
				    		<%=industryFinanceMap.get("영업이익(손실)")%>,
				    		<%=industryFinanceMap.get("현금및현금성자산")%>]
					  		}]
					  		})
						});
				
					</script>
					</div><!--//#financeInfoBox -->		
					<div id="articleBox">
						<div class="upperTitle">
							<div class="title">
								오늘의 투기장
							</div><!--//.title -->
						</div><!--//.upperTitle -->
					</div><!--//#ArticleBox -->
				</div><!--//#supprotingBox -->
			</div><!--//#lowerContent -->
		</div><!--//.aux -->
	</div><!--//#content -->
	<div id="footer">
			<div id="policy">
		<h4 class="screen_out">정책 및 약관</h4>
		<ul>
		<li><a href="">회사소개</a></li><!--
	 --><li><a href="">광고</a></li><!--
	 --><li><a href="">검색등록</a></li><!--
	 --><li><a href="">제휴제안</a></li><!--
	 --><li><a href="">이용약관</a></li><!--
	 --><li><a href=""><strong>개인정보이용약관</strong></a></li><!--
	 --><li><a href="">청소년보호정책</a></li><!--
	--><li><a href="">고객센터</a></li>
</ul>
</div><!--//policy -->
<address>&copy; 2020 <a href="">NackEGG.com</a></address>

	</div><!--//#footer -->
	<script  src="${pageContext.request.contextPath}/js/fix-footer.js"></script>

</body>
</html>