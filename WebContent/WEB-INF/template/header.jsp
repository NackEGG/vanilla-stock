<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					<li class="nav ${param.type=='C'?'on':''}"><a href="">종목</a></li>
					<li class="nav ${param.type=='A'?'on':''}"><a href="">투기장</a></li>
					<li class="nav ${param.type=='R'?'on':''}"><a href="">랭킹</a></li>
				</ul>
			
			</div><!--//#gnb -->

			<div id="searchBox">
				<label class="screen_out">찾을 회사 입력</label>
						<input class="inp_txt" type="text" placeholder="회사명을 입력해주세요" />
						 <span class="btn_search"> <i class="fa fa-search"></i></span>
			</div><!--//#searchBox -->

		</div><!--//.aux -->

		
		<div id="loginBox">
		
			<div id="loginBtn" class="${loginMember eq null ? ' ' : 'hidden' }">
			로그인
			</div><!--//loginBtn -->
			<div id="profileBox" class="${loginMember eq null ? 'hidden' : ' ' }">
				<h2 class="screen_out">유저정보</h2>
				<img src="../profile/profile.png"
				class="profile_on"  width="60" height="60"
				alt="테스터"
				title="테스터"/>
				<div id="profilePopup" class="profile_on">
					<ul id="profileList">
						<li class="profile"><a href="/user.jsp?no=3"><span class="open_door" >문</span> 
						<!--관리자는 관리자 페이지로 바꾸기 -->	
						관리페이지</a></li><!--//.profile -->
						<li class="profile"><a href="/logout.do"><span class="close_door" >문</span> 로그아웃</a></li><!--//.profile -->
					</ul><!--//profileList -->
				</div><!--//#profilePopup -->
			</div><!--#profileBox -->
		</div><!--//#loginBox -->
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

	</div><!--//#header -->