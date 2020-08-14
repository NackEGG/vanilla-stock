<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/kakao.font.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/signup.css" />

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous" />
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>

	<style type="text/css" media="screen">
		#divTEST{
			height: 1000px;
			background-color: red;

		}
	</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
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
			<div class="alert alert-success"  align="center">
				<img src="${pageContext.request.contextPath}/img/logotemp2.png"	width="600px">
		        <h1><i class="far fa-thumbs-up"></i>Welcome!</h1><br>
		         <h3>회원가입을 축하드립니다!</h3> 
		         <h3>우측 상단 로그인버튼을 통해 로그인해주세요</h3>
		         <br><br>
		    </div>
		    
		    <div align="center">
		    <form action="/vanilla-stock">
		    	<button type="submit" class="btn btn-primary btn-lg">홈으로 가기</button>
		    </form>
		    </div>				

		</div>		


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