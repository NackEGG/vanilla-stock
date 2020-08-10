<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.Date" %>
<%@ page import ="com.vs.util.StockApiUtil" %>
<%
	String[] arrStockInfo = (String[])request.getAttribute("arrStockInfo");
	String[][] arrDailyStock = (String[][])request.getAttribute("arrDailyStock");
	String[][] arrTimeConclude = (String[][])request.getAttribute("arrTimeConclude");
	int prevMonthClose = (int)request.getAttribute("prevMonthClose");
	
	String today = arrStockInfo[18].substring(0,11);
%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/kakao.font.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reportPage.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
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
								console.log(sc);
								$.ajax({
									url:"/vanilla-stock/ajax/reportPage/rtprice/", 
									data : {no : sc},
									dataType : "json",
									type : "POST",
									error : function() {
										alert(sc)
									},
									success : function (json) {
										console.log(json.result);
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
		
		function getStockData() {
			const sc = $("#companyCode").text();
			var ret = 0;
			console.log(sc);
			$.ajax({
				url:"/vanilla-stock/ajax/reportPage/rtprice/", 
				data : {no : sc},
				dataType : "json",
				type : "POST",
				error : function() {
					alert(sc)
				},
				success : function (json) {
					console.log(json.result);
					//var x = (new Date()).getTime(), // current time
				 	$("#dataContainer").val(json.result);
					$("#dataContainer").val();
				}
			});
			//ajax end
		}
		
		
		
		
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
			<img src="${pageContext.request.contextPath}/profile/profile.png"
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
									<img src="${pageContext.request.contextPath}/icon/<c:out value="${industryVO.no}"/>.png">
								</div><!--//#industryLogo -->
								<div id="industyName">
									${industryVO.name} 
								</div><!--//#industryName -->
							</div><!--//#industryBox -->
							<div id="deviBox">
								<div id="prevDayDevi">
									전일대비 : <%=arrStockInfo[3] %> &nbsp;
									<% if(arrStockInfo[2].equals("1") || arrStockInfo[2].equals("2")){%>
										▲ <%}else if(arrStockInfo[2].equals("4") || arrStockInfo[2].equals("5")){ %>
										▼ <%}else{ %>
										─ <%} %>
								</div><!--//#prevDayDevi -->
								<div id="prevDayDeviPercent">
									<%= arrStockInfo[17]%>%
								</div><!--//#prevDayDeviPercent -->
								<div id="prevMonthDeviChai">
									<% int monthDevi = Integer.parseInt(arrStockInfo[1].replaceAll(",", "")) - prevMonthClose; %>
									전월대비 : <%= Math.abs(monthDevi) %> 
									<% if(monthDevi > 0){%>
										▲ <%}else if(monthDevi < 0){ %>
										▼ <%}else{ %>
										─ <%} %>
								</div><!--//#prevMonthDeviChai -->
								<div id="prevMonthDeviPercent">
									<% Float monthDeviPercent = monthDevi / Float.parseFloat(arrStockInfo[1].replaceAll(",", "")) * 100; %>
									<%= String.format("%.2f", monthDeviPercent)%>%
								</div><!--//#prevMonthDeviPercent -->
							</div><!--//#deviBox -->
							<div id ="presentPriceBox">
								<div id="presentPriceWord">현재가</div>
								<div id="presentPrice"><%=arrStockInfo[1] %></div>
								
							</div><!--//#presentPriceBox -->
						</div><!--//#lowerDescBox -->
					</div><!--//#descBox -->
					<div id="chartBox">
						<figure class="highcharts-figure">
						<div id="container"></div>
						<div id="dataContainer" value=""></div>
					</figure>
					</div><!--//#chartBox -->
				</div><!--//#summaryBox -->
			</div><!--//#upperContent -->
			<div id="lowerContent">
				<div id="supportingBox">
					<div id="financeInfoBox">
						<div class="upperTitle">
							<div class="title">
								기업재무정보
							</div><!--//.title -->
						</div><!--//.upperTitle -->
					</div><!--//#financeInfoBox -->
					<div id="sameIndustryBox">
						<div class="upperTitle">
							<div class="title">
								동일업종정보
							</div><!--//.title -->
						</div><!--//.upperTitle -->
					</div><!--//#sameIndustryBox -->
					<div id="articleBox">
						<div class="upperTitle">
							<div class="title">
								투기장
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