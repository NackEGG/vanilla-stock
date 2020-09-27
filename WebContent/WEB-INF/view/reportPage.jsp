<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="com.vs.util.StockApiUtil"%>
<%@ page import="com.vs.vo.CommentsVO"%>
<%@ page import="com.vs.vo.CompanyVO"%>
<%@ page import="com.vs.vo.IndustryVO"%>

<%
	Map<String,Object> summary = (Map<String, Object>)request.getAttribute("summary");
CompanyVO companyVO = (CompanyVO)summary.get("companyVO");
IndustryVO industryVO = (IndustryVO)summary.get("industryVO");
String[] arrStockInfo = (String[])summary.get("arrStockInfo");
String[][] arrDailyStock = (String[][]) summary.get("arrDailyStock");
String[][] arrTimeConclude = (String[][]) summary.get("arrTimeConclude");
int prevMonthClose = (int) summary.get("prevMonthClose");
Map<String, Long> financeMap = (Map<String, Long>) summary.get("financeMap");
Map<String, Long> industryFinanceMap = (Map<String, Long>) summary.get("industryFinanceMap");
List<CommentsVO> commentsList = (List<CommentsVO>) summary.get("commentsList");
int[] opinion = (int[]) summary.get("opinion");

String today = arrStockInfo[18].substring(0, 11);

DecimalFormat formatter = new DecimalFormat("###,###");
int monthDevi = Integer.parseInt(arrStockInfo[1].replaceAll(",", "")) - prevMonthClose;
Float monthDeviPercent = monthDevi / Float.parseFloat(arrStockInfo[1].replaceAll(",", "")) * 100;
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="/vanilla-stock/css/reportpage.css" />
<link rel="stylesheet" href="/vanilla-stock/css/reset.css" />
<link rel="stylesheet" href="/vanilla-stock/css/kakao.font.css" />
<link rel="stylesheet" href="/vanilla-stock/css/default.css" />
<link rel="stylesheet" href="/vanilla-stock/css/login.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<script src="/vanilla-stock/js/jquery.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>

<script>
	$(function() {
		 $('#container').highcharts({
							chart : { 
								width : 420,
								height : 300,
								type : 'spline',
								animation : Highcharts.svg, // don't animate in old IE
								marginRight : 10,
								events : {
									load : function() {
										// set up the updating of the chart each second
										var series = this.series[0];
										var sc = $("#companyCode").text();
										setInterval(
												function() {
													const sc = $("#companyCode").text();
													var ret = 0;
													$.ajax({
														url : "/vanilla-stock/ajax/reportPage/rtprice/",
														data : { no : sc },
														dataType : "json",
														type : "POST",
														error : function() { console.log(sc) },
														success : function(json) {
															var x = (new Date()).getTime();
															var y = json.result;
															series.addPoint([x, y], true, true);
															}
														});
												}, 10000);
									}
								}
							},
							time : {
								useUTC : false
							},

							title : {
								text : '실시간 주가 상황판'
							},
							accessibility : {
								announceNewData : {
									enabled : true,
									minAnnounceInterval : 15000,
									announcementFormatter : function(allSeries,
											newSeries, newPoint) {
										if (newPoint) {
											return 'New point added. Value: '
													+ newPoint.y;
										}
										return false;
									}
								}
							},
							xAxis : {
								type : 'datetime',
								tickPixelInterval : 150
							},

							yAxis : {
								title : {
									text : '주가'
								},
								plotLines : [ {
									value : 0,
									width : 1,
									color : '#808080'
								} ]
							},

							tooltip : {
								headerFormat : '<b>{series.name}</b><br/>',
								pointFormat : '{point.x:%Y-%m-%d %H:%M:%S}<br/>{point.y:.2f}'
							},

							legend : {
								enabled : false
							},

							exporting : {
								enabled : false
							},
							series : [ {
								name : 'Random data',
								data : (function() {
									var time = (new Date()).getTime();
									var data = [
											{
												x : time - 90000,
												y :
<%=Integer.parseInt(arrTimeConclude[9][1].replaceAll(",", ""))%>
	},
											{
												x : time - 80000,
												y :
<%=Integer.parseInt(arrTimeConclude[8][1].replaceAll(",", ""))%>
	},
											{
												x : time - 70000,
												y :
<%=Integer.parseInt(arrTimeConclude[7][1].replaceAll(",", ""))%>
	},
											{
												x : time - 60000,
												y :
<%=Integer.parseInt(arrTimeConclude[6][1].replaceAll(",", ""))%>
	},
											{
												x : time - 50000,
												y :
<%=Integer.parseInt(arrTimeConclude[5][1].replaceAll(",", ""))%>
	},
											{
												x : time - 40000,
												y :
<%=Integer.parseInt(arrTimeConclude[4][1].replaceAll(",", ""))%>
	},
											{
												x : time - 30000,
												y :
<%=Integer.parseInt(arrTimeConclude[3][1].replaceAll(",", ""))%>
	},
											{
												x : time - 20000,
												y :
<%=Integer.parseInt(arrTimeConclude[2][1].replaceAll(",", ""))%>
	},
											{
												x : time - 10000,
												y :
<%=Integer.parseInt(arrTimeConclude[1][1].replaceAll(",", ""))%>
	},
											{
												x : time,
												y :
<%=Integer.parseInt(arrTimeConclude[0][1].replaceAll(",", ""))%>
	} ];

									return data;
								}())
							} ]
						});
	});
</script>
<!--// chart스크립트-->
</head>
<body>
	<div id="header">
		<div id="logoBox">
			<h1>
				<a href="${pageContext.request.contextPath}" title="vanilla stock">
					<img src="${pageContext.request.contextPath}/img/vs-logo2.PNG"
					alt="vanilla stock" />
				</a>
			</h1>

		</div>
		<!--//#logoBox -->
		<div class="aux">
			<div id="gnb">
				<h2 class="screen_out">주요 서비스</h2>
				<ul>
					<li class="nav"><a
						href="${pageContext.request.contextPath}/cardpage/init"> 종목</a></li>
					<li class="nav"><a
						href="${pageContext.request.contextPath}/articlePage"> 투기장 </a></li>
					<li class="nav"><a href="">랭킹</a></li>
				</ul>
			</div>
			<!--//#gnb -->

			<div id="searchBox">
				<label class="screen_out">찾을 회사 입력</label> <input class="inp_txt"
					type="text" placeholder="회사명을 입력해주세요" /> <span class="btn_search">
					<i class="fa fa-search"></i>
				</span>
			</div>
			<!--//#searchBox -->

		</div>
		<!--//.aux -->
		<div id="loginBox">
			<div id="loginBtn" class="btn ${loginMember eq null? '':'hidden'}"
				onclick="modalpopup('loginForm')">로그인</div>
			<!--//.aux -->
			<!-- Hidden된 로그인창-->
			<div id="loginForm" style="visibility: hidden;">
				<div class="form">
					<div class="formContents"></div>
					<form class="login-form" action="/vanilla-stock/login"
						method="post">
						<input type="text" name="email" class="email" placeholder="email" />
						<input type="password" name="password" class="password"
							placeholder="password" />
						<button class="login">login</button>
						<p class="message">
							회원이 아니시라면? <a href="${pageContext.request.contextPath}/join">회원가입</a>
						</p>
						<p class="close" onclick="popupclose('loginForm')">닫기</p>
					</form>
				</div>
			</div>
			<!-- Hidden된 로그인창띄우는 JS-->
			<script>
				function modalpopup(i) {
					document.getElementById(i).style.visibility = "visible";
				}

				function popupclose(i) {
					document.getElementById(i).style.visibility = "hidden";
				}

				$(document).ready(function(e) {
					$('#login').click(function() {
						// 입력 값 체크
						if ($.trim($('#email').val()) == '') {
							alert("아이디를 입력해 주세요.");
							$('#email').focus();
							return;
						} else if ($.trim($('#passwd').val()) == '') {
							alert("패스워드를 입력해 주세요.");
							$('#password').focus();
							return;
						}

						//전송
						$('#login-form').submit();
					});

				});
			</script>
			<!--//loginBtn -->
			<div id="profileBox" class="${loginMember eq null ? 'hidden' : ''}">

				<img src="${pageContext.request.contextPath}/profile/default.png"
					class="profile_on" width="60" height="60" alt="테스터" title="테스터" />
				<div id="profilePopup" class="profile_on">
					<ul id="profileList">
						<li class="profile"><a href="/user.jsp?no=3"><span
								class="open_door">문</span> <!--관리자는 관리자 페이지로 바꾸기 --> 마이페이지</a></li>
						<!--//.profile -->
						<li class="profile"><a
							href="${pageContext.request.contextPath}/logout"><span
								class="close_door">문</span> 로그아웃</a></li>
						<!--//.profile -->
					</ul>
					<!--//profileList -->
				</div>
				<!--//#profilePopup -->
			</div>
			<!--#profileBox -->
			<script>
				const $profile = $("#profileBox img");
				const $profileTarget = $("#profilePopup");
				$profile.click(function() {
					$profileTarget.toggle();
				}); // profileBox click end
				$("html").click(function(e) {
					if (!$(e.target).hasClass("profile_on")) {
						$profileTarget.hide();
					}
				}); //
			</script>
		</div>
	</div>
	<!--//#header -->
	<div id="content">
		<div class="aux">
			<div id="upperContent">
				<div id="summaryBox">
					<div id="descBox">
						<div id="upperDescBox">
							<div id="companyName"><%=companyVO.getCompany() %></div>
							<div id="companyCode"><%=companyVO.getStockCode() %></div>
						</div>
						<!--//#upperDescBox-->
						<hr>
						<div id="lowerDescBox">
							<div id="industyBox">
								<div id="industryLogo">
									<img src="/vanilla-stock/icon/<%=industryVO.getNo()%>.png">
								</div>
								<!--//#industryLogo -->
								<div id="industyName"><%=industryVO.getName()%></div>
								<!--//#industryName -->
								<div id="industryAverageBox">
									<div id="industryAverage">0.45%+</div>
								</div>
								<!--//#presentPriceBox -->
							</div>
							<!--//#industryBox -->
							<div id="deviBox">
								<div class="stockPriceBox">
									<div class="stockPriceName">현재가</div>
									<div class="stockPrice">
										&#8361;<%=arrStockInfo[1].trim()%></div>
								</div>
								<hr>
								<div class="percentInfo">
									<div class="percentBox">
										<div class="LdaydeviName">전일대비</div>
										<div class="LdeviPercent"><%=arrStockInfo[17]%>%
											<%
												if (arrStockInfo[2].equals("1") || arrStockInfo[2].equals("2")) {
											%>
											▲
											<%
												} else if (arrStockInfo[2].equals("4") || arrStockInfo[2].equals("5")) {
											%>
											▼
											<%
												} else {
											%>
											─
											<%
												}
											%>
										</div>
										<div class="daydeviName">전월대비</div>
										<div class="deviPercent"><%=String.format("%.2f", monthDeviPercent)%>%
											<%
												if (monthDevi > 0) {
											%>
											▲
											<%
												} else if (monthDevi < 0) {
											%>
											▼
											<%
												} else {
											%>
											─
											<%
												}
											%>
										</div>
									</div>

									<div class="percentBox">
										<div class="LdaydeviName">거래량</div>
										<div class="LdeviPercent"><%=arrStockInfo[5]%></div>
										<div class="daydeviNameAmount">거래금액</div>
										<div class="deviPercent"><%=arrStockInfo[6]%></div>
									</div>
									<div class="percentBox">
										<div class="LdaydeviName">고가</div>
										<div class="LdeviPercent"><%=arrStockInfo[8]%></div>
										<div class="daydeviName">저가</div>
										<div class="deviPercent"><%=arrStockInfo[9]%></div>
									</div>
									<div class="percentBox">
										<div class="LdaydeviName">52주최고가</div>
										<div class="LdeviPercent"><%=arrStockInfo[10]%></div>
										<div class="daydeviName">52주최저가</div>
										<div class="deviPercent"><%=arrStockInfo[11]%></div>
									</div>

								</div>
								<!--//#deviBox -->
							</div>
							<!--//#lowerDescBox -->
						</div>
						<!--//#descBox -->
					</div>
					<!-- percentInfo -->
					<div id="chartBox">
						<figure class="highcharts-figure">
							<div id="container"></div>
						</figure>
					</div>
					<!--//#chartBox -->
				</div>
				<!--//#summaryBox -->
			</div>
			<!--//#upperContent -->
			<div id="lowerContent">
				<div id="supportingBox">
					<div id="financeInfoBox">
						<figure class="highcharts-figure">
							<div id="container2"></div>
						</figure>
						<script type="text/javascript">
							$(function() {
								$('#container2')
										.highcharts(
												{

													chart : {
														width : 530,
														height : 300,
														type : 'column'
													},
													title : {
														text : '한눈에 보는 재무정보'
													},
													xAxis : {
														categories : [ '자산규모',
																'당기순이익',
																'유동자산', '매출액',
																'영업이익', '현금자산' ]
													},
													credits : {
														enabled : false
													},
													series : [
															{
																name : '<%=companyVO.getCompany()%>',
																data : [
						<%=financeMap.get("자본과부채총계")%>
							,
						<%=financeMap.get("당기순이익(손실)")%>
							,
						<%=financeMap.get("유동자산")%>
							,
						<%=financeMap.get("수익(매출액)")%>
							,
						<%=financeMap.get("영업이익(손실)")%>
							,
						<%=financeMap.get("현금및현금성자산")%>
							]
															},
															{
																name : '동종업계 평균',
																data : [
						<%=industryFinanceMap.get("자본과부채총계")%>
							,
						<%=industryFinanceMap.get("당기순이익(손실)")%>
							,
						<%=industryFinanceMap.get("유동자산")%>
							,
						<%=industryFinanceMap.get("수익(매출액)")%>
							,
						<%=industryFinanceMap.get("영업이익(손실)")%>
							,
						<%=industryFinanceMap.get("현금및현금성자산")%>
							]
															} ]
												})
							});
						</script>
					</div>
					<!--//#financeInfoBox -->
					<div id="articleBox">
						<div class="upperTitle">
							<span class="title">오늘의 투기장</span> <span class="moreTitle">+더보기</span>
						</div>
						<!--//.upperTitle -->
						<div class="articleRatio">
							<div class="articleRatio_fill"
								style="width: <%=opinion[0] / (double) (opinion[0] + opinion[1]) * 100%>%">
							</div>
							<!-- //.articleRatio_fill -->
							<div class="ratioInfo">
								<%
									if (opinion[0] + opinion[1] != 0) {
								%>
								<span><%=opinion[0]%></span> <span><%=opinion[1]%></span>
							</div>
							<!-- //.ratioInfo -->
						</div>
						<!--//.articleRatio -->

						<div class="commentTitle">
							<span class="title">매수의견과 댓글</span>
						</div>
						<!--//#commentTitle -->


						<%
							for (int i = 0; i < commentsList.size(); i++) {
						%>
						<div id="commentList">
							<span class="commentBuy"><%=commentsList.get(i).getOpinion()%></span>
							<span class="commentContents"><%=commentsList.get(i).getContent()%></span>
						</div>
						<%
							}
						} else {
						%>
						<div id="commentList">
							<span>데이터 없음</span>
						</div>
						<!-- //.ratioInfo -->
					</div>
					<!--//.articleRatio -->

					<div class="commentTitle">
						<span class="title">댓글 없음</span>
					</div>
					<!--//#commentTitle -->
					<%
						}
					%>
				</div>
				<!--//#ArticleBox -->
			</div>
			<!--//#supprotingBox -->
		</div>
		<!--//#lowerContent -->
	</div>
	<!--//.aux -->
	</div>
	<!--//#content -->
	<div id="footer">
		<div id="policy">
			<h4 class="screen_out">정책 및 약관</h4>
			<ul>
				<li><a href="">회사소개</a></li>
				<!--
	 -->
				<li><a href="">광고</a></li>
				<!--
	 -->
				<li><a href="">검색등록</a></li>
				<!--
	 -->
				<li><a href="">제휴제안</a></li>
				<!--
	 -->
				<li><a href="">이용약관</a></li>
				<!--
	 -->
				<li><a href=""><strong>개인정보이용약관</strong></a></li>
				<!--
	 -->
				<li><a href="">청소년보호정책</a></li>
				<!--
	-->
				<li><a href="">고객센터</a></li>
			</ul>
		</div>
		<!--//policy -->
		<address>
			&copy; 2020 <a href="">NackEGG.com</a>
		</address>

	</div>
	<!--//#footer -->
	<script src="${pageContext.request.contextPath}/js/fix-footer.js"></script>
</body>
</html>