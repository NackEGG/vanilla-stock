<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" href="../css/reset.css" />
	<link rel="stylesheet" href="../css/kakao.font.css" />
	<link rel="stylesheet" href="../css/default.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<script src="../js/jquery.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	<style type="text/css" media="screen">
		#content{
			padding: 20px 0 50px 0;
		}
		#content .aux{
			background-color: #EEEEEE;
			color: #FFE0B2;
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
			background-color: black;
		}
		#upperDescBox{
			display: flex;

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
			width: 98px;
			height: 74px;
		}
		#industyBox img{
			width: 100%;
			height: 50px;
		}
		#industyName{
			text-align: center;
		}
		#sameIndustryBox{
			width: 33.3%;
			background-color: #7986cb;
		}
		#financeInfoBox{
			width: 33.3%;
			background-color: #FF80AB;
		}
		#articleBox{
			width: 33.3%;
			background-color: springgreen;
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

	</style>
	<style type="text/css">
		.highcharts-figure, .highcharts-data-table table {
			min-width: 320px;
			max-width: 800px;
			margin: 1em auto;
		}

		#container {
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
							setInterval(function () {
								var x = (new Date()).getTime(), // current time
										y = Math.random();
								series.addPoint([x, y], true, true);
							}, 1000);
						}
					}
				},
				time: {
					useUTC: false
				},

				title: {
					text: 'Live random data'
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
						text: 'Value'
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
						// generate an array of random data
						var data = [],
								time = (new Date()).getTime(),
								i;

						for (i = -19; i <= 0; i += 1) {
							data.push({
								x: time + i * 1000,
								y: Math.random()
							});
						}
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
				<img src="../img/vs-logo2.PNG" alt="vanilla stock"/>
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
			<img src="../profile/profile.png"
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
									<img src="../img/logo-name.JPG">
								</div><!--//#industryLogo -->
								<div id="industyName">
									${industryVO.name}
								</div><!--//#industryName -->
							</div><!--//#industryBox -->
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
	<script  src="../js/fix-footer.js"></script>

</body>
</html>