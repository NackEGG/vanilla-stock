<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
#divTEST {
	height: 1000px;
	background-color: lightcoral;
}
</style>
</head>
<body>
	<div id="header">
		<div id="logoBox">
			<h1>
				<a href="" title="vanilla stock"> <img src="../img/vs-logo2.PNG"
					alt="vanilla stock" />
				</a>
			</h1>
		</div>
		<!--//#logoBox -->
		<div class="aux">
			<div id="gnb">
				<h2 class="screen_out">주요 서비스</h2>
				<ul>
					<li class="nav"><a href=""> 종목</a></li>
					<li class="nav on"><a href=""> 투기장 </a></li>
					<li class="nav"><a href="">랭킹</a></li>
				</ul>
			</div>
			<!--//#gnb -->

			<div id="searchBox">
				<label class="screen_out">찾을 회사 입력</label> <input class="inp_txt"
					type="text" placeholder="회사명을 입력해주세요" /> <span
					class="btn_search"> <i class="fa fa-search"></i></span>
			</div>
			<!--//#searchBox -->
		</div>
		<!--//.aux -->
		<div id="loginBox">
			<div id="loginBtn" class="btn">로그인</div>
			<!--//loginBtn -->
			<div id="profileBox" class="hidden">
				<h2 class="screen_out">유저정보</h2>
				<img src="${pageContext.request.contextPath}/profile/profile.png"
					class="profile_on" width="60" height="60" alt="테스터" title="테스터" />
				<div id="profilePopup" class="profile_on">
					<ul id="profileList">
						<li class="profile"><a href="/user.jsp?no=3"><span
								class="open_door">문</span> <!--관리자는 관리자 페이지로 바꾸기 --> 마이페이지</a></li>
						<!--//.profile -->
						<li class="profile"><a href="/logout.do"><span
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
			<form:form role="form" modelAttribute="registerRequest"
				action="/vanilla-stock/join" method="post">
				<div id="signup">
					<%-- <form action="" id="joinForm"> --%>
					<ul class="join_box">
						<li class="checkBox check01"></li>
						<li class="checkBox check02">
						
						<textarea name="signupContents" id="signupContents">
이 사이트에 게재된 정보는 오직 정보 제공 목적입니다. 
vanilla-stock은 정확하고 시기 적절한 정보를 제공하고자 노력하지만, 의도하지 않은 기술적 또는 사실 관계의 부정확 및 오탈자가 있을 수 있습니다.
vanilla-stock은 이 웹사이트 상의 자료가 정확하거나 최신이거나 완벽하다고 보증하지 않으므로, 이 자료에 의존해서는 안 됩니다. 
vanilla-stock은 통보 없이 언제라도 변경, 삭제 및 수정할 수 있는 권리가 있습니다.
관련 법률에서 허용하는 최대한의 범위 내에서 vanilla-stock은 특정 목적을 위한 매매 가능성 및 적합성의 암시적 보증 등 모든 보증을 책임지지 않습니다. 
vanilla-stock은 이 사이트에 포함된 정보, 텍스트, 그래픽, 링크 또는 기타 항목의 정확성 또는 완결성을 명시적 또는 암시적으로 보증하지 않으며, 
본 자료의 오류 또는 누락, 또는 사이트에 포함된 정보의 제3자에 의한 이용 또는 해석에 대한 모든 책임을 명시적으로 부인합니다. 
vanilla-stock은 이 사이트를 통하여 이용자에게 제공된 정보를 제3자가 무단 사용함으로써 발생할 수 있는 손실 또는 손해를 책임지지 않습니다.
또한 이 사이트의 장애 또는 중단, 또는 사이트 또는 이 자료에 대한 이용자의 접근, 접근 불능 또는 이용과 관련한 사유로 인해 발생하는 어떠한 종류의 손실 또는 손해에도 책임을 지지 않습니다. 
이때, 그러한 사유를 제공한 환경이 vanilla-stock 또는 이 사이트를 위한 소프트웨어 또는 지원 서비스를 제공하는 벤더의 통제범위 내에 있었는지 여부는 무관합니다

동의하신다면 이용약관 동의에 체크해주세요.
           				</textarea>
							<ul class="clearfix" style=" margin-top: 10px">
								<li class="checkBtn">
									<!--  <input type="checkbox" name="agree" value="true" /> --> 
									<form:checkbox path="agree" value="true" />
								</li>
								<li>이용약관 동의(필수)</li>
							</ul>							
							<ul class="clearfix">
								<form:errors path="agree" name="agree" cssStyle="color: red;"/>
							</ul>
						</li>
					</ul>
				</div>
				
				<!-- // #signup -->

				<div class="signupForm">
					<div class="profileDefault">
						<img src="${pageContext.request.contextPath}/img/jicon.png"
							class="profiledefault" />
					</div>

					<div class="joinformContents">
						<div class="panel-body">
							<div class="row">

								<div class="input_group">
									<span class="join_subject">이메일</span><br>
									<form:input type="email" class="join_inputbox"
										placeholder="Email" name="email" path="email" />
									<form:errors path="email" name="email" cssStyle="color: red;"/>
								</div>
								<div class="input_group">
									<span class="join_subject">닉네임</span><br>
									<form:input type="text" class="join_inputbox"
										placeholder="Nickname" name="nickname" path="nickname" />
									<form:errors path="nickname" name="nickname" cssStyle="color: red;"/>
								</div>
								<div class="input_group">
									<span class="join_subject">비밀번호</span><br>
									<form:password class="join_inputbox" placeholder="Password"
										name="password" path="password" />
									<form:errors path="password" name="password" cssStyle="color: red;"/>
								</div>
								<div class="input_group">
									<span class="join_subject">비밀번호 확인</span><br>
									<form:password class="join_inputbox"
										placeholder="Password Check" name="checkPw" path="checkPw" />
									<form:errors path="checkPw" cssStyle="color: red;"/>
								</div>
								<div class="input_group">
									<span class="join_subject">생년월일</span><br>
									<form:select class="birthofdate" type="text"
										placeholder="BDYear" name="BDYear" path="BDYear">
										<%for(int i=2020; i>=1950; i--){%>
										<option value="<%out.print(String.format("%4d", i)); %>"
											<%if(i == 2020){%> selected>
											<%}else{ %> >
											<%}
				                                    out.print(String.format("%4d", i)); %>
										</option>
										<%} %>
									</form:select> 년
									<form:errors path="BDYear" name="BDYear" cssStyle="color: red;"/>

									<form:select class="birthofdate" type="text"
										placeholder="BDMon" name="BDMon" path="BDMon">
										<%for(int i=1; i<=12; i++){%>
										<option value="<%out.print(String.format("%02d", i)); %>"
											<%if(i == 1){%> selected>
											<%}else{ %> >
											<%}
				                                    out.print(String.format("%02d", i)); %>
										</option>
										<%} %>
									</form:select> 월
									<form:errors path="BDMon" name="BDMon" cssStyle="color: red;"/>

									<form:select class="birthofdate" type="text"
										placeholder="BDDay" name="BDDay" path="BDDay">
										<%for(int i=1; i<=31; i++){%>
										<option value="<%out.print(String.format("%02d", i)); %>"
											<%if(i == 1){%> selected>
											<%}else{ %> >
											<%}
				                                    out.print(String.format("%02d", i)); %>
										</option>
										<%} %>
									</form:select> 일
									<form:errors path="BDDay" name="BDDay" cssStyle="color: red;"/>
									
								</div>
								<div class="input_groupp">
									<span class="join_subject">성별</span><br>
									<form:radiobutton class="join_gender" value="M" label="남자"
										path="gender" name="gender"/>
									<form:radiobutton class="join_gender" value="F" label="여자"
										path="gender" name="gender"/>
									<br>
									<form:errors path="gender" name="gender" cssStyle="color: red; margin-left:20px;"/>
								</div>
								<button style="margin-left: 210px" type="submit"
									class="signupConfirmed">가입하기</button>
								<button type="reset" class="signupConfirmed">취소하기</button>

							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>

	<!--//#content -->

	<div id="footer">
		<div id="policy">
			<h4 class="screen_out">정책 및 약관</h4>
			<ul>
				<li><a href="">회사소개</a></li>
				<li><a href="">광고</a></li>
				<li><a href="">검색등록</a></li>
				<li><a href="">제휴제안</a></li>
				<li><a href="">이용약관</a></li>
				<li><a href=""><strong>개인정보이용약관</strong></a></li>
				<li><a href="">청소년보호정책</a></li>
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