<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/kakao.font.css" />
    <link rel="stylesheet" href="css/default.css" />
    <link rel="stylesheet" href="css/article.css" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
      integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
      crossorigin="anonymous"
    />
    <script src="../js/jquery.js"></script>
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
            <img src="../img/vs-logo2.PNG" alt="vanilla stock" />
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
            src="../profile/profile.png"
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
        <div id="divTop">
          <ul>
            <li class="article">투기장</li>
            <li class="article_recent">최신순</li>
            <li class="article_popular">인기순</li>
          </ul>
          <div class="article_open">
            <a
              href="/Users/IRENE/Downloads/폴더/vanilla-stock-front/jeongyeon/articleOpen.html"
              onclick="window.open(this.href, '_blank', 'width=800px,height=400px,toolbars=no,scrollbars=no, resizable=no, fullscreen=no'); return false;"
              >+OPEN
            </a>
          </div>
        </div>
        <!--//#main header -->
        <div id="divMiddle">
          <div class="article_list">
            <div class="companyList">
              <div class="articleCompany">
                <span class="companyName"
                  ><i class="fas fa-fire-alt"></i>삼성전자</span
                >
                <span class="articleTitle">삼성전자투기방이야~~~~</span>
              </div>
              <!--//#articleCompany -->

              <div class="articleRatio">
                <div
                  class="articleRatio_fill"
                  title="70승"
                  style="width: 10%;"
                ></div>
              </div>

              <!--//#articleChart -->
              <div class="articleOpinion">
                <div class="opHeader">
                  <span>풀매수</span>
                  <span>:</span>
                  <span>풀매도</span>
                </div>
                <div class="articleOpNum">
                  <span>500</span>
                  <span>400</span>
                </div>
              </div>
              <div class="viewTimestamp">
                <div class="articleView">
                  <span>조회수</span>
                  <span>12334</span>
                </div>
                <div class="articleTimestamp">
                  <span>3시간 전</span>
                </div>
              </div>
            </div>
            <!-- //#companylist-->

            <div class="companyList">
              <div class="articleCompany">
                <span class="companyName"
                  ><i class="fas fa-fire-alt"></i>카카오</span
                >
                <span class="articleTitle">팔아? 말아?</span>
              </div>
              <!--//#articleCompany -->

              <div class="articleRatio">
                <div
                  class="articleRatio_fill"
                  title="70승"
                  style="width: 60%;"
                ></div>
              </div>

              <!--//#articleChart -->
              <div class="articleOpinion">
                <div class="opHeader">
                  <span>풀매수</span>
                  <span>:</span>
                  <span>풀매도</span>
                </div>
                <div class="articleOpNum">
                  <span>500</span>
                  <span>400</span>
                </div>
              </div>
              <div class="viewTimestamp">
                <div class="articleView">
                  <span>조회수</span>
                  <span>12334</span>
                </div>
                <div class="articleTimestamp">
                  <span>3시간 전</span>
                </div>
              </div>
            </div>

            <div class="companyList">
              <div class="articleCompany">
                <span class="companyName"
                  ><i class="fas fa-fire-alt"></i>삼성전자</span
                >
                <span class="articleTitle">삼성전자투기방이야~~~~</span>
              </div>
              <!--//#articleCompany -->

              <div class="articleRatio">
                <div
                  class="articleRatio_fill"
                  title="70승"
                  style="width: 30%;"
                ></div>
              </div>

              <!--//#articleChart -->
              <div class="articleOpinion">
                <div class="opHeader">
                  <span>풀매수</span>
                  <span>:</span>
                  <span>풀매도</span>
                </div>
                <div class="articleOpNum">
                  <span>500</span>
                  <span>400</span>
                </div>
              </div>
              <div class="viewTimestamp">
                <div class="articleView">
                  <span>조회수</span>
                  <span>12334</span>
                </div>
                <div class="articleTimestamp">
                  <span>3시간 전</span>
                </div>
              </div>
            </div>

            <div class="companyList">
              <div class="articleCompany">
                <span class="companyName"
                  ><i class="fas fa-fire-alt"></i>하이닉스</span
                >
                <span class="articleTitle">하이닉스 투기방</span>
              </div>
              <!--//#articleCompany -->

              <div class="articleRatio">
                <div
                  class="articleRatio_fill"
                  title="70승"
                  style="width: 90%;"
                ></div>
              </div>

              <!--//#articleChart -->
              <div class="articleOpinion">
                <div class="opHeader">
                  <span>풀매수</span>
                  <span>:</span>
                  <span>풀매도</span>
                </div>
                <div class="articleOpNum">
                  <span>500</span>
                  <span>400</span>
                </div>
              </div>
              <div class="viewTimestamp">
                <div class="articleView">
                  <span>조회수</span>
                  <span>12334</span>
                </div>
                <div class="articleTimestamp">
                  <span>3시간 전</span>
                </div>
              </div>
            </div>

            <div class="companyList">
              <div class="articleCompany">
                <span class="companyName"
                  ><i class="fas fa-fire-alt"></i>네이버파이낸셜</span
                >
                <span class="articleTitle">네이버 네이버</span>
              </div>
              <!--//#articleCompany -->

              <div class="articleRatio">
                <div
                  class="articleRatio_fill"
                  title="70승"
                  style="width: 45%;"
                ></div>
              </div>

              <!--//#articleChart -->
              <div class="articleOpinion">
                <div class="opHeader">
                  <span>풀매수</span>
                  <span>:</span>
                  <span>풀매도</span>
                </div>
                <div class="articleOpNum">
                  <span>300</span>
                  <span>400</span>
                </div>
              </div>
              <div class="viewTimestamp">
                <div class="articleView">
                  <span>조회수</span>
                  <span>12334</span>
                </div>
                <div class="articleTimestamp">
                  <span>3시간 전</span>
                </div>
              </div>
            </div>

            <!--//#article_list -->
          </div>
        </div>
        <!--//#divMiddle -->
      </div>
    </div>
    <!--//#content -->
    <div class="paginate">
      <!--페이지 리스트 부분-->
      <!-- 이전 페이지 이동 :  비활성 -->
      <span title="이전 페이지 없음"><i class="fa fa-chevron-left"></i></span>
      <!-- 이전 페이지 이동 :  활성 -->
      <a href="" title="이전 페이지로"
        ><i class="fa fa-chevron-left"></i
        ><span class="screen_out">이전 페이지</span></a
      >
      <!-- 페이지들 -->
      <a href="" title="1">1</a>
      <a href="" title="2">2</a>
      <strong title="현재 3페이지">3</strong>
      <a href="" title="4">4</a>
      <a href="" title="5">5</a>
      <!-- 다음 페이지 이동 :  활성 -->
      <a href="" title="다음 페이지로"
        ><i class="fa fa-chevron-right"></i
        ><span class="screen_out">다음 페이지</span></a
      >
      <!-- 다음 페이지 이동 :  비활성 -->
      <span title="다음 페이지 없음"><i class="fa fa-chevron-right"></i></span>
    </div>
    <!--//paginate-->

    <div id="searchBox">
      <h2 class="screen_out">검색</h2>
      <form id="searchForm" action="">
        <fieldset class="fld_search">
          <legend class="screen_out">검색어 입력폼</legend>
          <div class="box_inp_search">
            <div class="select_title" data-title="제목">
              <span class="opt_seleted">
                제목+내용
              </span>

              <span class="ico_angle_down">
                <i class="fas fa-angle-down"></i>
              </span>
              <span class="ico_angle_up">
                <i class="fas fa-angle-up"></i>
              </span>
            </div>
            <!--//select_title -->

            <div class="select_option">
              <ul>
                <li>
                  <a class="opt_select" href="" data-search-key="subject"
                    >제목</a
                  >
                </li>
                <li>
                  <a
                    class="opt_select"
                    href=""
                    data-search-key="subjectNcontent"
                    >제목+내용</a
                  >
                </li>
                <li>
                  <a class="opt_select" href="" data-search-key="nickname"
                    >닉네임</a
                  >
                </li>
              </ul>
            </div>
            <!--//select_option -->
          </div>
          <!--//box_inp_search -->

          <script type="text/javascript">
            const $selectTitle = $(".select_title");
            const $searchBox = $("#searchBox");
            $selectTitle.on("click", function () {
              $searchBox.toggleClass("click");
            }); //on end
          </script>
          <div class="box_inp_txt">
            <label class="screen_out">검색어 입력</label>
            <input
              class="inp_txt"
              type="text"
              placeholder="검색어를 입력해주세요"
            />
          </div>
          <!--//box_inp_txt -->
        </fieldset>
      </form>
      <!--//searchForm -->
    </div>

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
    <script src="../js/fix-footer.js"></script>
  </body>
</html>

