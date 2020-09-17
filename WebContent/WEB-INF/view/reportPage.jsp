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
								text : '�ǽð� �ְ� ��Ȳ��'
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
									text : '�ְ�'
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
<!--// chart��ũ��Ʈ-->
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
				<h2 class="screen_out">�ֿ� ����</h2>
				<ul>
					<li class="nav"><a
						href="${pageContext.request.contextPath}/cardpage/init"> ����</a></li>
					<li class="nav"><a
						href="${pageContext.request.contextPath}/articlePage"> ������ </a></li>
					<li class="nav"><a href="">��ŷ</a></li>
				</ul>
			</div>
			<!--//#gnb -->

			<div id="searchBox">
				<label class="screen_out">ã�� ȸ�� �Է�</label> <input class="inp_txt"
					type="text" placeholder="ȸ����� �Է����ּ���" /> <span class="btn_search">
					<i class="fa fa-search"></i>
				</span>
			</div>
			<!--//#searchBox -->

		</div>
		<!--//.aux -->
		<div id="loginBox">
			<div id="loginBtn" class="btn ${loginMember eq null? '':'hidden'}"
				onclick="modalpopup('loginForm')">�α���</div>
			<!--//.aux -->
			<!-- Hidden�� �α���â-->
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
							ȸ���� �ƴϽö��? <a href="${pageContext.request.contextPath}/join">ȸ������</a>
						</p>
						<p class="close" onclick="popupclose('loginForm')">�ݱ�</p>
					</form>
				</div>
			</div>
			<!-- Hidden�� �α���â���� JS-->
			<script>
				function modalpopup(i) {
					document.getElementById(i).style.visibility = "visible";
				}

				function popupclose(i) {
					document.getElementById(i).style.visibility = "hidden";
				}

				$(document).ready(function(e) {
					$('#login').click(function() {
						// �Է� �� üũ
						if ($.trim($('#email').val()) == '') {
							alert("���̵� �Է��� �ּ���.");
							$('#email').focus();
							return;
						} else if ($.trim($('#passwd').val()) == '') {
							alert("�н����带 �Է��� �ּ���.");
							$('#password').focus();
							return;
						}

						//����
						$('#login-form').submit();
					});

				});
			</script>
			<!--//loginBtn -->
			<div id="profileBox" class="${loginMember eq null ? 'hidden' : ''}">

				<img src="${pageContext.request.contextPath}/profile/default.png"
					class="profile_on" width="60" height="60" alt="�׽���" title="�׽���" />
				<div id="profilePopup" class="profile_on">
					<ul id="profileList">
						<li class="profile"><a href="/user.jsp?no=3"><span
								class="open_door">��</span> <!--�����ڴ� ������ �������� �ٲٱ� --> ����������</a></li>
						<!--//.profile -->
						<li class="profile"><a
							href="${pageContext.request.contextPath}/logout"><span
								class="close_door">��</span> �α׾ƿ�</a></li>
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
									<div class="stockPriceName">���簡</div>
									<div class="stockPrice">
										&#8361;<%=arrStockInfo[1].trim()%></div>
								</div>
								<hr>
								<div class="percentInfo">
									<div class="percentBox">
										<div class="LdaydeviName">���ϴ��</div>
										<div class="LdeviPercent"><%=arrStockInfo[17]%>%
											<%
												if (arrStockInfo[2].equals("1") || arrStockInfo[2].equals("2")) {
											%>
											��
											<%
												} else if (arrStockInfo[2].equals("4") || arrStockInfo[2].equals("5")) {
											%>
											��
											<%
												} else {
											%>
											��
											<%
												}
											%>
										</div>
										<div class="daydeviName">�������</div>
										<div class="deviPercent"><%=String.format("%.2f", monthDeviPercent)%>%
											<%
												if (monthDevi > 0) {
											%>
											��
											<%
												} else if (monthDevi < 0) {
											%>
											��
											<%
												} else {
											%>
											��
											<%
												}
											%>
										</div>
									</div>

									<div class="percentBox">
										<div class="LdaydeviName">�ŷ���</div>
										<div class="LdeviPercent"><%=arrStockInfo[5]%></div>
										<div class="daydeviNameAmount">�ŷ��ݾ�</div>
										<div class="deviPercent"><%=arrStockInfo[6]%></div>
									</div>
									<div class="percentBox">
										<div class="LdaydeviName">��</div>
										<div class="LdeviPercent"><%=arrStockInfo[8]%></div>
										<div class="daydeviName">����</div>
										<div class="deviPercent"><%=arrStockInfo[9]%></div>
									</div>
									<div class="percentBox">
										<div class="LdaydeviName">52���ְ�</div>
										<div class="LdeviPercent"><%=arrStockInfo[10]%></div>
										<div class="daydeviName">52��������</div>
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
														text : '�Ѵ��� ���� �繫����'
													},
													xAxis : {
														categories : [ '�ڻ�Ը�',
																'��������',
																'�����ڻ�', '�����',
																'��������', '�����ڻ�' ]
													},
													credits : {
														enabled : false
													},
													series : [
															{
																name : '<%=companyVO.getCompany()%>',
																data : [
						<%=financeMap.get("�ں�����ä�Ѱ�")%>
							,
						<%=financeMap.get("��������(�ս�)")%>
							,
						<%=financeMap.get("�����ڻ�")%>
							,
						<%=financeMap.get("����(�����)")%>
							,
						<%=financeMap.get("��������(�ս�)")%>
							,
						<%=financeMap.get("���ݹ����ݼ��ڻ�")%>
							]
															},
															{
																name : '�������� ���',
																data : [
						<%=industryFinanceMap.get("�ں�����ä�Ѱ�")%>
							,
						<%=industryFinanceMap.get("��������(�ս�)")%>
							,
						<%=industryFinanceMap.get("�����ڻ�")%>
							,
						<%=industryFinanceMap.get("����(�����)")%>
							,
						<%=industryFinanceMap.get("��������(�ս�)")%>
							,
						<%=industryFinanceMap.get("���ݹ����ݼ��ڻ�")%>
							]
															} ]
												})
							});
						</script>
					</div>
					<!--//#financeInfoBox -->
					<div id="articleBox">
						<div class="upperTitle">
							<span class="title">������ ������</span> <span class="moreTitle">+������</span>
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
							<span class="title">�ż��ǰ߰� ���</span>
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
							<span>������ ����</span>
						</div>
						<!-- //.ratioInfo -->
					</div>
					<!--//.articleRatio -->

					<div class="commentTitle">
						<span class="title">��� ����</span>
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
			<h4 class="screen_out">��å �� ���</h4>
			<ul>
				<li><a href="">ȸ��Ұ�</a></li>
				<!--
	 -->
				<li><a href="">����</a></li>
				<!--
	 -->
				<li><a href="">�˻����</a></li>
				<!--
	 -->
				<li><a href="">��������</a></li>
				<!--
	 -->
				<li><a href="">�̿���</a></li>
				<!--
	 -->
				<li><a href=""><strong>���������̿���</strong></a></li>
				<!--
	 -->
				<li><a href="">û�ҳ⺸ȣ��å</a></li>
				<!--
	-->
				<li><a href="">������</a></li>
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