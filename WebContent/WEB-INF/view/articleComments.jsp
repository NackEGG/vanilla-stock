<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title></title>
    <c:import url="/WEB-INF/template/link.jsp" />
    <link rel="stylesheet" href="/vanilla-stock/css/reset.css" />
    <link rel="stylesheet" href="/vanilla-stock/css/kakao.font.css" />
    <link rel="stylesheet" href="/vanilla-stock/css/default.css" />
    <link rel="stylesheet" href="/vanilla-stock/css/articleComments.css" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
      integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
      crossorigin="anonymous"
    />
    <script src="/vanilla-stock/js/jquery.js"></script>
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
            <img src="/vanilla-stock/img/vs-logo2.PNG" alt="vanilla stock" />
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
            src="/vanilla-stock/profile/profile.png"
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
          <input id="articleNo" type="hidden" value="${articleVO.no}" form="pickCommentsForm"/>
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
        <form id="pickCommentsForm" action="">
        <div class="articleChart">
          <div class="articleRatio">
            <div
              class="articleRatio_fill"
            ></div>
          </div>
          <div class="articleBuy">
            <span id = "articleBuy_Good"></span>
            <span id = "articleBuy_Bad"></span>
          </div>
          
          <div class="articleButton">

          <label><input class="pickRadio" type="radio" name="opinion" value="Y" form="pickCommentsForm"> 풀매수</label>
          <label><input class="pickRadio" type="radio" name="opinion" value="N" form="pickCommentsForm"> 풀매도</label>
           </div>
          <script type="text/javascript">
         	const $selectTitle = $(".select_title");
          	const $searchBox = $("#searchBox");
          	$selectTitle.on("click", function () {
              $searchBox.toggleClass("click");
            });
          </script>
        </div>
        <div class="articleComment">
          <span class="articleTitle">댓글 입력</span>
          <input
            type="text"
            placeholder="댓글을 입력하세요."
            name="content"
            class="commentWrite"
            form="pickCommentsForm"
          />
          <input type="button" value="등록" class="commentEnter" />
        </div>
        </form>
        <div class="commentBox">
        	
        </div>
        <a id="more_btn" href="" data-no=2>더보기</a>
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
    <script src="/vanilla-stock/js/fix-footer.js"></script>
    <script type="text/template" id="commentsTmp">
	<div class="articleCommentList">
	<@ if(commentsList != null && commentsList.length > 0) { @>
	<@ _.each(commentsList, function(comt){ @>
            <div class="commentList">
		<@ if(comt.opinion == 'Y'){ @>
			  <span class="commentGoodOpinion">매수</span>
		<@ } else { @>
			  <span class="commentBadOpinion">매도</span>
		<@ } @>
              <span class="commentWriter"><@=comt.nickname@></span>
              <span class="commentDate"><@=moment(comt.regdate).fromNow()@></span>
              <div class="articleLikes">
                <span class="commentLike"
                  ><i class="far fa-thumbs-up"></i> 좋아요</span
                >
              </div>
              <div class="commentContents">
                <span><@=comt.content@></span>
              </div>
            </div>   
		<@ }) } @>
		</div>
	</script>
	<script type="text/javascript">
			
		// 게이지 바 채우기
		var good = 0;
		var bad = 0;
		if((${articleVO.countGood} + ${articleVO.countBad}) != 0){
			good = ${articleVO.countGood}/(${articleVO.countGood} + ${articleVO.countBad}) * 100;
			bad = ${articleVO.countBad}/(${articleVO.countGood} + ${articleVO.countBad}) * 100;
		}
		$(".articleRatio_fill").attr({"style": "width:"+good+"%;"
						,"title" : good.toFixed(0)+":"+bad.toFixed(0)})
		
		// init
		const commentsTmp = _.template($("#commentsTmp").html());
		const $wrapList = $(".commentBox");
		const articleNo = $("#articleNo").val();
		//console.log(articleNo);
		let page = 1;
		//console.log(page);
		getComments();
		
		// 풀매수 쪽
		function getComments(){
			$.ajax({
				url : "/vanilla-stock/ajax/articlePage/pickComments",
				type : "GET",
				data : { articleNo : articleNo , page : page },
				error : function(){
					alert("error");
				},
				success : function(json){
					if (page == 1 || json.commentsList.length > 0) {
						let tmp = commentsTmp({
							"commentsList" : json.commentsList
						});			
						$wrapList.append(tmp);
					}
				} // ajax
			}) // function getComments()			
		}
		
		// 댓글 삽입
		const $insertForm = $("#pickCommentsForm");
		function insertPickComments() {
			let formData =  $insertForm.serialize();
			$.ajax({ 
				url:"/vanilla-stock/ajax/articlePage/pickComments",
				type:"POST",
				data:formData+'&articleNo='+articleNo,
				error:function(){
					alert("error")
				},
				success: function(text) {
					alert(text);
					history.go(0);
				}
			});//ajax 
		}// function insertPickComments()
		
		$( ".commentEnter" ).click(function() {	 
			if("${loginMember eq null ? '0' : '1'}" == 1){
      			insertPickComments();
      		} else{
      			alert("로그인이 필요한 서비스입니다");
      		}
		});
		
		$('.aux').on("click", "#more_btn", function(e) {
			e.preventDefault();
			// 각 페이지의 시작되는 게시물 번호  
			page = this.dataset.no;
			
			this.dataset.no = parseInt(page) + 1;
			//ajax로 데이터 리스트 받아오는 함수 
			getComments();
	 	});
	</script>
  </body>
</html>
