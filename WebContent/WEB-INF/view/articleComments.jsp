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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/articleComments.css" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
      integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
      crossorigin="anonymous"
    />
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <style type="text/css" media="screen">
      #divTEST {
        height: 1000px;
        background-color: red;
      }
    </style>
  </head>
  <body>
    <div id="header">
      <div id="logoBox">
        <h1>
          <a href="" title="vanilla stock">
            <img src="${pageContext.request.contextPath}/img/vs-logo2.PNG" alt="vanilla stock" />
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
          <label class="screen_out">찾을 회사 입력</label>
          <input
            class="inp_txt"
            type="text"
            placeholder="회사명을 입력해주세요"
          />
          <span class="btn_search"> <i class="fa fa-search"></i></span>
        </div>
        <!--//#searchBox -->
      </div>
      <!--//.aux -->
      <div id="loginBox">
        <div id="loginBtn" class="btn">
          로그인
        </div>
        <!--//loginBtn -->
        <div id="profileBox" class="hidden">
          <h2 class="screen_out">유저정보</h2>
          <img
            src="${pageContext.request.contextPath}/profile/profile.png"
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
                <a href="/logout.do"
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
        <div class="subject">
          <span class="articleHeader">${articleVO.title}</span>
          <span class="articleDate">${articleVO.regdate}</span>
        </div>
        <div class="viewComment">
          <div>
            <span class="articleInfo">조회수</span>
            <span class="articleInfo">${articleVO.countHit}</span>
          </div>
          <div>
            <span class="articleInfo">댓글수</span>
            <span class="articleInfo">${articleVO.countComments}</span>
          </div>
        </div>

        <div class="articleChart">
          <div class="articleRatio">
            <div
              class="articleRatio_fill"
              title="80승"
              style="width: 70%;"
            ></div>
          </div>
          <div class="articleBuy">
            <span>${articleVO.countGood}</span>
            <span>${articleVO.countBad}</span>
          </div>

          <div class="articleFullbuy">
            <span>풀매수</span>
          </div>
          <div class="articleFullsell">
            <span>풀매도</span>
          </div>
          <script type="text/javascript">
         	const $selectTitle = $(".select_title");
          	const $searchBox = $("#searchBox");
          	$selectTitle.on("click", function () {
              $searchBox.toggleClass("click");
            });
          	$().function(){
          		$(".opinion_btn")
          	}		
          
          </script>
        </div>

        <div class="articleComment">
          <span class="articleTitle">댓글 입력</span>
          <input
            type="text"
            placeholder="댓글을 입력하세요."
            name="comment"
            class="commentWrite"
          />
          <input type="button" value="등록" class="commentEnter" />
        </div>
        <div class="commentBox">
          <div class="articleCommentListYes">
            <div class="commentList">
              <span class="commentWriter">흑우짱짱맨</span>
              <span class="commentDate">2020-07-29</span>
              <div class="articleLikes">
                <span class="commentLike"
                  ><i class="far fa-thumbs-up"></i> 좋아요</span
                >
              </div>

              <div class="commentContents">
                <span>이거 안사면 걍 흑우....음머</span>
              </div>
            </div>
          </div>
          <div class="articleCommentListNO">
            <div class="commentList">
              <span class="commentWriter">예나</span>
              <span class="commentDate">2020-07-29</span>
              <div class="articleLikes">
                <span class="commentLike"
                  ><i class="far fa-thumbs-up"></i> 좋아요</span
                >
              </div>

              <div class="commentContents">
                <span>그냥 안사고 집에갈래.....</span>
              </div>
            </div>
            <div class="commentList">
              <span class="commentWriter">석채</span>
              <span class="commentDate">2020-07-29</span>
              <div class="articleLikes">
                <span class="commentLike"
                  ><i class="far fa-thumbs-up"></i> 좋아요</span
                >
              </div>

              <div class="commentContents">
                <span>그냥 강가네빈대떡이나 먹자.....</span>
              </div>
            </div>
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
    <script src="${pageContext.request.contextPath}/js/fix-footer.js"></script>
  </body>
</html>
