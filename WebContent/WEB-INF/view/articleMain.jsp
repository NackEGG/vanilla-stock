<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<c:import url="/WEB-INF/template/link.jsp" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/kakao.font.css" />
<link rel="stylesheet" href="css/default.css" />
<link rel="stylesheet" href="css/article.css" />
<link rel="stylesheet" href="css/articleOpen.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous" />
<script src="js/jquery.js"></script>
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
				<a href="" title="vanilla stock"> <img src="img/vs-logo2.PNG"
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
					type="text" placeholder="회사명을 입력해주세요" form="searchForm" /> 
					<span class="btn_search"> <i
					class="fa fa-search"></i></span>
			</div>
			<!--//#searchBox -->
		</div>
		<!--//.aux -->
		<div id="loginBox">
			<div id="loginBtn" class="btn">로그인</div>
			<!--//loginBtn -->
			<div id="profileBox" class="hidden">
				<h2 class="screen_out">유저정보</h2>
				<img src="profile/profile.png" class="profile_on" width="60"
					height="60" alt="테스터" title="테스터" />
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

				$profile.click(function() {
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
            <li class="article_recent">
            	<input type="radio" class="sortRadio" name="sortType" checked="checked" value ="latest" form="searchForm">
            		최신순
            	</li>
            <li class="article_popular">
            	<input type="radio" class="sortRadio" name="sortType" value ="popularity" form="searchForm">
            		인기순
            	</li>
          </ul>
          <div class="article_open">
            <a href="">
              +OPEN
            </a>
          </div>
          <script>
          	$(".article_open a").click(function(e){
          		if("${loginMember eq null ? '0' : '1'}" == 1){
          			e.preventDefault();
          			window.open("/vanilla-stock/articleOpen", '_blank', 'width=800px,height=400px,toolbars=no,scrollbars=no, resizable=no, fullscreen=no'); 
          			return false;
          		} else{
          			e.preventDefault();
          			alert("로그인해주세요");
          		}
          	});
          </script>
        </div>
        <!--//#divTop -->
        <div id="divMiddle">
          <div class="article_list">
            </div> <!-- //article_list -->   
          </div>
        <!--//#divMiddle -->
        <div id="searchboxArticle">
      <h2 class="screen_out">검색</h2>
      <form id="searchForm" action="" method="POST">
        <fieldset class="fld_search">
          <legend class="screen_out">검색어 입력폼</legend>
          <div class="box_inp_search">
            <div class="select_title" data-title="제목" >
              <span class="opt_seleted" >
               					 회사명+제목
              </span>      
         	 </div>
		<!--//select_title -->
       		<div class="select_option">
				<ul>
					<li>
						<label for="searchAll" class="opt_select">회사명+제목</label>
						<input id="searchAll" class="hidden" checked type="radio" name="searchType" value="all"/>
					</li>
					<li>
						<label for="searchCompany" class="opt_select">회사명</label>
						<input id="searchCompany" class="hidden" type="radio" name="searchType" value="company"/>
					</li>
					<li>
						<label for="searchTitle" class="opt_select">제목</label>
						<input id="searchTitle" class="hidden" type="radio" name="searchType" value="title"/>
					</li>
					</ul>
			</div><!--//select_option -->
		</div>
		<!--//box_inp_search -->
            
					 <script type="text/javascript">
    	
					 	const $selectTitle = $(".select_title");
					 	const $searchBox = $("#searchboxArticle");
					 	const $selectOpt = $(".opt_select");
					 	$selectTitle.on("click", function(){
					 		$searchBox.toggleClass("click");
					 	});//on end
					 	$selectOpt.on("click",function(){
					 		let $this = $(this);
					 		let value = $this.text();
					 		$searchBox.removeClass("click");
					 		$(".select_title").text(value);
					 		//radio checked 변경 
					 		$this.siblings().prop("checked",true);
					 	});
    	
   					 </script>
					
					<div class="box_inp_txt">
						<label class="screen_out">검색어 입력</label> <input class="inp_txt"
							type="text" placeholder="검색어를 입력해주세요" form="searchForm" name="searchWord"/> 
							<span class="btn_search"> <i class="fa fa-search"></i></span>
					</div>
					
					<!--//box_inp_txt -->					
				</fieldset>
			</form>
			<!--//searchForm -->
			</div>
		<!-- //searchbox -->
	</div>
	<!--//.aux -->
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
				<li><a href=""><strong>개인정보이용약관</strong></a></li>
				<!--
	 -->
				<li><a href="">청소년보호정책</a></li>
				<!--
	-->
				<li><a href="">고객센터</a></li>
			</ul>
		</div>
		<!--//policy -->
		<address>
			&copy; 2020 <a href="">NackEGG.com</a>
		</address>
	</div>
	<!--//#footer -->
	<script src="js/fix-footer.js"></script>
	<script type="text/template" id="articleTmp">
	
	<@ if(articleList!=null && articleList.length>0){ @>
		<@ _.each(articleList, function(artc){ @>
	<div class="companyList">
		<div class="articleCompany">
                <span class="companyName">
					<i class="fas fa-fire-alt"></i><@=artc.companyName@>
				</span>
                <span class="articleTitle">
				<a href="articlePage/comments/<@=artc.no@>">
					<@=artc.title@>
				</a>
				</span>
              </div>
              <!--//#articleCompany -->
				<@ 	
					var good = 0;
					var bad = 0;
					if((artc.countGood + artc.countBad) != 0){
						good = artc.countGood/((artc.countGood) + (artc.countBad)) * 100;
						bad = artc.countBad/((artc.countGood) + (artc.countBad)) * 100;
					}
				@>
              <div class="articleRatio">
                <div
                  class="articleRatio_fill"
                  title="<@=good.toFixed(0)@>:<@=bad.toFixed(0)@>"
                  style="width: <@=good@>%;"
                ></div>
              </div>

              <!--//.articleRatio -->
              <div class="articleOpinion">
                <div class="opHeader">
                  <span>풀매수</span>
                  <span>:</span>
                  <span>풀매도</span>
                </div>
                <div class="articleOpNum">
                  <span><@=artc.countGood@></span>
                  <span><@=artc.countBad@></span>
                </div>
              </div>
              <!-- //.articleOpinion -->
              <div class="viewTimestamp">
                <div class="articleView">
                  <span>조회수</span>
                  <span><@=artc.countHit@></span>
                </div>
                <div class="articleTimestamp">
                  <span><@=moment(artc.regdate).fromNow()@></span>
                </div>
              </div>
              <!-- //.viewTimestamp -->
				</div><!--//.companyList-->
				<@ }) } @>
 			<@=paginate @>
	</script>
	<script type="text/javascript">
		//_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
		const articleTmp = _.template($("#articleTmp").html());
		const $wrapList = $(".article_list");
		const $txtInp = $(".inp_txt");
		const $searchForm = $("#searchForm");
		let page = 1; // page는 1페이지 부터 시작  
		getArticle();
		function getArticle() {

			let formData = $searchForm.serialize();
			console.log("form data");
			console.log(formData);
			$.ajax({
				url : "/vanilla-stock/ajax/articlePage/list/",
				type : "POST",
				data : formData + '&page='+page,
				error : function() {
					alert("error");
				},
				success : function(json) {

					if (page == 1 || json.articleList.length > 0) {

						let tmp = articleTmp({
							"articleList" : json.articleList,
							"paginate" : json.paginate
						});
						$wrapList.empty().append(tmp);
					}
				}
			});//ajax end 
		}// search() end
	</script>
	<script type="text/javascript">
		//pageblock 클릭
		$('.aux').on("click", ".paginate a", function(e) {
			e.preventDefault();
			// 각 페이지의 시작되는 게시물 번호  
			page = this.dataset.no;
			//ajax로 데이터 리스트 받아오는 함수 
			getArticle();
	 	});//click() end
	
	  	$('.aux').on("click",".sortRadio",function(e){
	  		page=1;
		    getArticle();
	    });//click() end
	    
	    $('.aux').on("click",".btn_search",function(e){
	  		page=1;
		    getArticle();
	    });//click() end
	</script>
</body>
</html>

