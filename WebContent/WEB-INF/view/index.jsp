<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/kakao.font.css" />
    <link rel="stylesheet" href="css/default.css" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/login.css" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
      integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
      crossorigin="anonymous"
    />
    <script src="js/jquery.js"></script>
    <style type="text/css" media="screen">
      #divTEST {
        height: 1000px;
        background-color: lightgrey;
      }
 .box{
 position: absolute;
 transform: translate(-50%, -50%);
 top: 10%;
 left: 50%;
 margin-top: 17%;
	}
.container-1 input#search{
  width: 300px;
  height: 50px;
  background: #2b303b;
  border: none;
  font-size: 10pt;
  float: left;
  color: #63717f;
  padding-left: 45px;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
}
.container-1 input#search::-webkit-input-placeholder {
   color: #65737e;
}
.container-1 input#search:-moz-placeholder { /* Firefox 18- */
   color: #65737e;  
}
.container-1 input#search::-moz-placeholder {  /* Firefox 19+ */
   color: #65737e;  
}
.container-1 input#search:-ms-input-placeholder {  
   color: #65737e;  
}
.container-1 .icon{
  position: absolute;
  top: 35%;
  margin-left: 17px;
 /*  margin-top: 17px; */
  z-index: 1;
  color: #4f5b66;
}
.container-1 input#search:hover, .container-1 input#search:focus, .container-1 input#search:active{
    outline:none;
    background: #ffffff;
 }
    </style>
  </head>
  <body>
    <div id="header">
      <div id="logoBox">
        <h1>
          <a href="" title="vanilla stock">
            <img src="img/vs-logo2.PNG" alt="vanilla stock" />
          </a>
        </h1>
      </div>
      <!--//#logoBox -->
      <div class="aux">
        <div id="gnb">
          <h2 class="screen_out">주요 서비스</h2>
          <ul>
            <li class="nav"><a href="${pageContext.request.contextPath}/cardpage/init"> 종목</a></li>
            <li class="nav"><a href="${pageContext.request.contextPath}/articlePage"> 투기장 </a></li>
            <li class="nav"><a href="">랭킹</a></li>
          </ul>
        </div>
        <!--//#gnb -->
       </div>
      <div id="loginBox">
        <div id="loginBtn" class="btn ${loginMember eq null? '':'hidden'}" onclick="modalpopup('loginForm')">
          로그인
        </div>
         <!--//.aux -->
        <!-- Hidden된 로그인창-->
        <div id="loginForm" style="visibility: hidden;" >
          <div class="form">
            <div class="formContents"></div>
            <form class="login-form" action ="/vanilla-stock/login" method="post">
              <input type="text" name="email" class="email" placeholder="email" />
              <input type="password" name="password" class="password" placeholder="password" />
              <button class="login">login</button>
              <p class="message">
                	회원이 아니시라면?
                <a
                  href="${pageContext.request.contextPath}/join"
                  >회원가입</a
                >
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
          
       
      	$(document).ready(function(e){
      		$('#login').click(function(){
      			// 입력 값 체크
      			if($.trim($('#email').val()) == ''){
      				alert("아이디를 입력해 주세요.");
      				$('#email').focus();
      				return;
      			}else if($.trim($('#passwd').val()) == ''){
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

          <img
            src="profile/profile.png"
            class="profile_on"
            width="60"
            height="60"
            alt="테스터"
            title="테스터"
          />
          <div id="profilePopup" class="profile_on">
            <ul id="profileList">
              <li class="profile">
                <a href="/user.jsp?no=3"
                  ><span class="open_door">문</span>
                  <!--관리자는 관리자 페이지로 바꾸기 -->
                  마이페이지</a
                >
              </li>
              <!--//.profile -->
              <li class="profile">
                <a href="${pageContext.request.contextPath}/logout"
                  ><span class="close_door">문</span> 로그아웃</a
                >
              </li>
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
          $profile.click(function () {
            $profileTarget.toggle();
          }); // profileBox click end
          $("html").click(function (e) {
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
        <div id="divTEST">
		<div>
			<div style="position: absolute;">
				<div style="margin-left:240px; margin-top:30px; top: 120px;  ">
					<img src="${pageContext.request.contextPath}/img/logosh.png" width="600px" ></img>
				</div>
			</div>
			<img src="${pageContext.request.contextPath}/img/mainback.png" width="1080px"></img>
		</div>
          <!--Main 검색창 -->
          <div class="box">
			  <div class="container-1">
			      <span class="icon"><i class="fa fa-search"></i></span>
			      <input type="search" id="search" placeholder="Search..." />
			  </div>
		  </div>
          <div class="financeInfo">
            <div class="financeContents">
              <div class="financeHighLow">
                <span class="high_btn" style="width:100%; text-align:center; padding-top:5px; background-color:#FFE0B2 " onclick="financeHigh('high')">매수추천</span>
                <span class="low_btn" style="width:100%; text-align:center; padding-top:5px; background-color:#FF907C" onclick="financeLow('low')">매도추천</span>
              </div>
              <div id="high">
                <div class="highList">
                	<table>
	              		<tr>
	              			<td>카카오</td>
	              			<td>18,750</td>
			                <td style="color: red">▲4300</td>
			                <td>+29.76%</td>
	              		</tr>
	              		<tr>
	              			<td>삼성전자</td>
	              			<td>355,750</td>
			                <td style="color: red">▲400</td>
			                <td>+29.76%</td>
	              		</tr>
	              		<tr>
	              			<td>엑세스바이오</td>
	              			<td>29,500</td>
			                <td style="color: red">▲6,800</td>
			                <td>+29.96%</td>
	              		</tr>
	              		<tr>
	              			<td>신풍제약</td>
	              			<td>75,400</td>
			                <td style="color: red">▲300</td>
			                <td>+0.40%</td>
	              		</tr>
	              		<tr>
	              			<td>KNN</td>
	              			<td>2,180</td>
			                <td style="color: red">▲415</td>
			                <td>+23.51%</td>
	              		</tr>
	              		<tr>
	              			<td>두산중공업</td>
	              			<td>9,650</td>
			                <td style="color: red">▲640</td>
			                <td>+7.10%</td>
	              		</tr>
	              		<tr>
	              			<td>한국전력</td>
	              			<td>21,950</td>
			                <td style="color: red">▲400</td>
			                <td>+1.86%</td>
	              		</tr>
              		</table>
                </div>
              </div>
            </div>
            <!-- hidden된 하한가 DIV-->
            <div id="low" style="visibility: hidden;">
              <div class="lowList">
              	<table>
              		<tr>
              			<td>씨젠</td>
              			<td>221,500</td>
		                <td style="color: blue">▼52,200</td>
		                <td>-19.07%</td>
              		</tr>
              		<tr>
              			<td>현대차</td>
              			<td>168,000</td>
		                <td style="color: blue">▼2,000</td>
		                <td>-1.18%</td>
              		</tr>
              		<tr>
              			<td>LG화학</td>
              			<td>703,000</td>
		                <td style="color: blue">▼34,000</td>
		                <td>-4.61%</td>
              		</tr>
              		<tr>
              			<td>알루코</td>
              			<td>4,600</td>
		                <td style="color: blue">▼16,200</td>
		                <td>-21.64%</td>
              		</tr>
              		<tr>
              			<td>셀트리온</td>
              			<td>305,000</td>
		                <td style="color: blue">▼3,500</td>
		                <td>-1.13%</td>
              		</tr>
              		
              	</table>
                
              </div>
            </div>
            <!-- hidden된 하한가 DIV 보여주는 JS-->
            <script>
              function financeLow() {
                document.getElementById("low").style.visibility = "visible";
                document.getElementById("high").style.visibility = "hidden";
              }
              function financeHigh() {
                document.getElementById("low").style.visibility = "hidden";
                document.getElementById("high").style.visibility = "visible";
              }
            </script>
          </div>
          <div class="recentSearch">

		      <span class="subject" style="margin-left:5px;margin-bottom:10px; font-size:20px; padding-top:5px;">최근인기종목</span>
		      <c:forEach var="pop" items="${popular}">
		      	<span style="margin-left:5px; margin-bottom:5px; font-size:15px; ">${pop.company}</span>
		      </c:forEach>
      </div>
           <div class="announcement">
            <span>NEW 공지사항</span>
            <span>${announce}</span>
          </div>
        </div>
      </div>
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
          <li>
            <a href=""><strong>개인정보이용약관</strong></a>
          </li>
          <!--
	 -->
          <li><a href="">청소년보호정책</a></li>
          <!--
	-->
          <li><a href="">고객센터</a></li>
        </ul>
      </div>
      <!--//policy -->
      <address>&copy; 2020 <a href="">NackEGG.com</a></address>
    </div>
    <!--//#footer -->
    <script src="js/fix-footer.js"></script>
  </body>
</html>
