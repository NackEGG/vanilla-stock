<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>industry</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/kakao.font.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<style type="text/css" media="screen">

.aux{
			/*background-color: pink;*/
		}
		/*여기서부터 ul,li태그에 적용*/
		.title {
			height: 50px;
			line-height: 50px;
			font-weight: bold;
			/*border-bottom:solid 1px gray;*/
			margin-left: 10px;
		}
		.t_line {border-right:solid 1px gray;}
		.lt_line {border-bottom:solid 1px gray;}
		.list {
			height: 40px;
			line-height: 30px;
			margin-left: 10px;
			/*background: #f3f3f3;*/
		}
		.w60 {width:60px; }
		.w160 {width:160px; }

		#industrycard_content {
			display: block;
			width: 760px; /*725*/
			min-height: 600px;
			/*padding: 20px;*/
			margin-bottom: 20px;
			/*border: 1px solid #bcbcbc;*/
			/*background-color: #ff0000;*/


		}
		#industrycard_content ul{

			/*background-color: yellow;*/
			min-height: 260px;
			width: 725px;
			overflow: hidden;
		}

		#industrycard_sidebar{
			width: 500px;
			min-height: 100px;
			position: absolute;
			right: 0;
			top: 0;
			/*background-color: blue;*/
		}

		#industrycard_sidebar ul {
			overflow: hidden;
		}
		#industrycard_sidebar ul li {
			float: left;
			/*outline: 1px solid #666666;*/
			/*margin-left: 3px;*/
		}
		#industrycard_sidebar {
			width: 300px;
			padding: 20px;
			margin-bottom: 20px;
			float: right;
			border: 1px solid #bcbcbc;

		}
		/*카드를 위한 css*/
		*{
			box-sizing:border-box;
		}
		#industrycard_content li.card{
			height:135px;
			/*width:135px;*/
			margin-left:10px;
			margin-bottom: 20px;
			float: left;

		}
		div.cardContainer{
			display: block;
			height:135px;
			width:170px;
		}

		li.card div.cardContainer div{
			height:inherit;
			width:inherit;
			/*color:#FFF;*/
			/*font-size:24px;!*수정필요*!*/
			backface-visibility:hidden;
			-webkit-backface-visibility:hidden;
			transition:all 1.5s;
			-webkit-transition:all 1.5s;
			-moz-transition:all 1.5s;
			-o-transition:all 1.5s;
			/*text-align:center;*/
			border-radius: 6px;
			box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
		}
		.front {
			background-color: #FFFBEF;
			width: 100%;
			text-align: center;
			vertical-align: center;

		}
		.back {
			background-color: #FFFBEF;
			font-size: large;
		}
		.card_table{
			border: 1px solid gray;
			height: 40px;
			width: 150px;
			/*background-color: pink;*/
			margin-top: 10px;
			margin-left: 10px;
		}
		.card_table tr td{
			border: 1px solid gray;
			vertical-align: middle;
			font-size: medium;
			text-align: center;
		}
		div.cardContainer div:last-child{
			position:relative;
			top:-135px;
			transform:rotateY(180deg);
			-webkit-transform:rotateY(180deg);
			-ms-transform:rotateY(180deg);
			-moz-transform:rotateY(180deg);
			-o-transform:rotateY(180deg);
		}
		div.cardContainer:hover div:first-child{
			transform:rotateY(-180deg);
			-webkit-transform:rotateY(-180deg);
			-ms-transform:rotateY(-180deg);
			-moz-transform:rotateY(-180deg);
			-o-transform:rotateY(-180deg);
		}
		div.cardContainer:hover div:last-child{
			transform:rotateY(0deg);
			-webkit-transform:rotateY(0deg);
			-ms-transform:rotateY(0deg);
			-moz-transform:rotateY(0deg);
			-o-transform:rotateY(0deg);
		}

		.industry_table {
			border-collapse: collapse;
			font-size: smaller;
		}
		.industry_table  th {
			padding: 10px;
			color: #168;
			border-bottom: 3px solid #168;
			text-align: left;
		}
		.industry_table  td {
			color: #669;
			padding: 10px;
			border-bottom: 1px solid #ddd;
		}
		.industry_table  tr:hover td {
			color: #004;
		}
		/*#footer{
           position: relative;
        }*/
	</style>
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
					<li class="nav on"><a href=""> 종목</a> </li>
					<li class="nav"><a href=""> 투기장 </a></li>
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
			<div id="industrycard_content">
				<ul>
				<c:forEach var="cardData" items="${cardDataMap }">
					<li class="card">
						<div class="cardContainer">
							<div class="front">
								<img style="width: 70%; max-width: 600px; height: 70%; vertical-align: middle; margin-top: 10px" 
										src="${pageContext.request.contextPath}/icon/<c:out value="${cardData.key}"/>.png">
								<br><h1><c:out value="${cardData.value.getIndustryName()}"/></h1>
							</div>
							<div class="back">
								<br><span style="margin-left: 10px">전일대비 : <c:out value="${String.format('%.02f', cardData.value.getChangeRate()) }"/> %</span>
								<br><!--<span style="margin-left: 10px">전체회사: 8</span>-->
								<table class="card_table">
									<tr>
										<td>상승</td>
										<td>보합</td>
										<td>하락</td>
									</tr>
									<tr>
										<td><c:out value="${cardData.value.incCnt}"/></td>
										<td><c:out value="${cardData.value.totalCnt-cardData.value.incCnt-cardData.value.decCnt}"/></td>
										<td><c:out value="${cardData.value.decCnt}"/></td>
									</tr>
								</table>
								<br><span style="margin-left: 50%"><a href="${pageContext.request.contextPath}/cardpage/init/<c:out value="${cardData.value.getIndustryNo()}"/>"> 자세히보기 </a></span>
							</div>
						</div>
					</li>
				</c:forEach>
				</ul>
			</div><!--//#industrycard_content -->

			<div id="industrycard_sidebar">
				<table class="title">
					<tr>
						<td class="title w160">업종명</td>
						<td class="w60 title ">전일대비</td>
					</tr>
				</table>
				<hr>
				<table class="industry_table">				
					<c:forEach var="cardData" items="${cardDataMap }">					
						<tr>
							<td>
								<a href=""><c:out value="${cardData.value.getIndustryName() }"/></a>
							</td>
							<td style="color : <c:choose>
								<c:when test="${cardData.value.getChangeRate() < 0}">blue</c:when>
								<c:when test="${cardData.value.getChangeRate() > 0}">red</c:when>
								<c:otherwise>#669</c:otherwise>
								</c:choose>">
								<c:out value="${String.format('%.02f', cardData.value.getChangeRate()) }"/>%
							</td>
						</tr>
					</c:forEach>
				</table>
			</div><!--industrycard_sidebar-->
		</div><!--//.aux-->
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