<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>manager page</title>
	<c:import url="/WEB-INF/template/link.jsp"/>
	<link rel="stylesheet" href="../css/managerPage.css" />
	
	
	<style type="text/css" media="screen">
		
		.article{
			width: 800px;
			margin: 0px auto;
			/*background-color: yellow;*/
		}	
		.paginate{
			margin-left: 180px;
		}
	
	</style>

</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"/>
	<div id="content">
		<div class="aux">

			<div id="snbSection">

				<h2 class="screen_out">사이트관리 기본서비스 및 메뉴</h2>
				<div class="aside_profile">
					<img src="../profile/default.png" alt="관리자">
				</div><!--//.aside_profile -->
				<div class="btn aside_btn_write">
					<div>작성하기</div>
				</div><!--//.aside_btn_write -->
					<div class="aside_box_menu">
					<h3 class="screen_out">관리 메뉴</h3>
					<ul class="aside_list_menu">
						<li class="menu dashboard"> <a href="managerPage-dashboard.html">대시보드</a></li>
						<li class="menu members on"><a href="managerPage-members.html">사용자 관리</a></li>
						<li class="menu contents"><a href="managerPage-contents.html"> 컨텐츠 관리</a></li>
						<li class="menu comments"><a href="managerPage-comments.html">댓글 관리</a></li>
						<li class="menu stats"><a href="managerPage-stats.html"> 통계</a></li>
					</ul>
				</div><!--//.aside_box_menu -->
			

			</div><!--//#snbSection -->

			<div id="articleSection">
				<div class="article dashboard">
					<div class="box_summary_stat">
						<h3 class="screen_out">일자별 방문 및 페이지 뷰</h3>
					</div><!--//.box_summary_stat -->
					<div class="box_summary_join">
						<h3 class="screen_out">최근 가입한 사용자 요약</h3>

					</div><!--//.box_summary_join -->
					<div class="box_summary_contents">
						<h3 class="screen_out">최근 글</h3>
					</div><!--//.box_summary_contents -->
					<div class="box_summary_comments">
						<h3 class="screen_out">최근 댓글</h3>

					</div><!--//.box_summary_comments -->

				</div><!--//.dashboard -->
				<!-- dashboard 끝  -->
				<!-- user article 시작  -->
				<div class="article user show">
					<div class="wrap_bar">
						<div class="inner_bar">
							
						<!-- -->
						<div class="box_inp_settings">
							<div class="ico_chx">
								<input type="checkbox" name="all" value="" />
							</div>
							
						<div class="select_title" data-title="제목">
							
							<span class="opt_seleted">
								설정
							</span>
							
							<span class="ico_angle_down">
							<i class="fas fa-angle-down"></i>
							</span>
							<span class="ico_angle_up">
							<i class="fas fa-angle-up"></i>
							</span>
						</div><!--//select_title -->
						
						<div class="select_option">
							<ul>
								
								<li>
									<a class="opt_select" href=""  data-setting-key="block_user">사용자 차단</a>
								</li>
								<li>
									<a class="opt_select" href=""  data-setting-key="delete_user">사용자 강퇴</a>
								</li>
							</ul>

						</div><!--//select_option -->
						
					</div><!--//box_inp_search -->

					 <script type="text/javascript">
    	
					 	const $selectTitle = $(".select_title");
					 	const $articleSection = $("#articleSection");
					 	$selectTitle.on("click", function(){
					 		$articleSection.toggleClass("click");
					 	});//on end
    	
   					 </script>
						<!-- -->
							<div class="box_ico_search_bar">
							<div class="ico_search_bar"> <i class="fa fa-search"></i> 검색</div>
						</div><!--//.box_btn_search_bar -->

						</div><!--//.inner_bar-->
						<div class="inner_search hidden">
						<label class="screen_out">찾을 유저 입력</label>
						<input name="searchWord" class="inp_txt" type="text" placeholder="사용자 계정 입력"  form="searchForm" />
						 <span class="btn_search"> <i class="fa fa-search"></i></span>
						 <span class="btn_close"><i class="fas fa-times"></i></span>
						

						 </div><!--//.inner_search -->
						  <script type="text/javascript">
						 	$btnClose = $(".btn_close");
						 	$innerSearch =$(".inner_search");
						 	$innerBar = $('.inner_bar');
						 	$icoSearchBar = $('.ico_search_bar');
						 	
						 	$btnClose.on("click", function(){
						 		$innerSearch.addClass('hidden');
						 		$innerBar.removeClass('hidden');
						 	});

						 	$icoSearchBar.on('click',function(){
						 		$innerSearch.removeClass('hidden');
						 		$innerBar.addClass('hidden');
						 	});


						 </script>

					</div><!--//.wrap_bar -->
					
					<div class="wrap_list">
						<div class="head_list">
     						<span class="total"> 총 사용자 <strong class="total_count">100</strong> 명 </span>
							<p class="sort">
								<input id="latestMember" type="radio" form="searchForm" name="sortType" value="latestMember" checked/>
								<label for="latestMember">최신순</label>
								<input id="hardMember" type="radio" form="searchForm" name="sortType" value="hardMember" />
								<label for="hardMember">열혈순</label>
								
								
							</p><!--//sort -->
						</div><!--//.head_list -->
						<div class="list_member">
					</div><!--//.wrap_list -->

				</div><!--//.user -->


			</div><!--//#articleSection -->
			
	
		
		</div><!--//.aux -->

	<form id="searchForm" action="" method="post" />

	</div><!--//#content -->
	
	<script type="text/template" id="membsersTmp">
						
						
        					<h3 class="screen_out">가입한 유저 목록</h3>
        						<ul>
									<@ if(memberList!=null&&memberList.length>0){ @>
										<@ _.each(memberList, function(mem){  @> 
           	 						<li class="member">
                						<input type="checkbox" name="no" value="<@=mem.NO @>" />
                						<a href="">
                   							<div title="닉네임" class="nickname"> <@=mem.NICKNAME @> </div>
                 							
                   							<div title="<@=mem.email @>" class="email"><@=mem.EMAIL @></div>
                   							<div class="box_activities">
                   								<ul>
                   									<h4 class="screen_out">유저 활동 내역 요약</h4>
                   									<li title="글 개수" class="activity">
                   										<div class="posts"><i class="far fa-file-alt"></i> <@=mem.COUNTARTICLES @></div>
                   									</li>
                   									<li class="activity">
                   										<div title="댓글수" class="comments"><i class="far fa-comments"></i> <@=mem.COUNTCOMMENTS @></div>
                   									</li>
                   									<li class="activity">
                   										<div title="방문수" class="visit"><i class="fas fa-shoe-prints"></i> <@=mem.COUNTVISITS @></div>
                   									</li>
                   								</ul>
                   							</div><!--//.box_activies -->
                    						<div class="join"><time><@=moment(mem.REGDATE).fromNow() @></time></div> 
                							</a>
           								</li><!--//.member -->
										<@ }) }@>
           							
            						
        							</ul>
						
    							</div><!--//.list_member -->
							<@=paginate @>
					</script>
	<c:import url="/WEB-INF/template/footer.jsp"/>
	<script type="text/javascript">
	//_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
		const membersTmp = _.template($("#membsersTmp").html());
		const $wrapList  = $(".list_member"); 
		const $txtInp = $(".inp_txt");
		const $searchForm = $("#searchForm");
		let page = 1; // page는 1페이지 부터 시작  
		getMembers();
		function getMembers() {
			
			let formData =  $searchForm.serialize();
			console.log("form data");
			console.log(formData);
			$.ajax({ 
				url:"/vanilla-stock/ajax/articlePage/list",
				type:"post",
				data:formData+'&page='+page,
				error:function(){
					alert("error");
				},
				success: function(json) {
				
					if(page==1 || json.memberList.length>0){
						
						let tmp = membersTmp({"articleList": json.memberList,"paginate": json.paginate });
						console.log(tmp);
						$wrapList.empty().append(tmp);
						$txtInp.val(""); 
						
					}
				}
				
			});//ajax end 
		}// search() end
		
		$btnSearch.on("click", function(){
	 		let page = 
	 	});
			
	</script>
</body>
</html>