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
						<li class="menu members ${category=='members'?'on':''}"><a href="/vanilla-stock/manager/members">사용자 관리</a></li>
						<li class="menu contents ${category=='contents'?'on':''}"><a href="/vanilla-stock/manager/contents"> 컨텐츠 관리</a></li>
						<li class="menu comments ${category=='comments'?'on':''}"><a href="/vanilla-stock/manager/comments">댓글 관리</a></li>
						<li class="menu stats ${category=='stats'?'on':''}"><a href="/vanilla-stock/manager/stats"> 통계</a></li>
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
			
				<c:import url="manager-view/${category }.jsp"/> 

			</div><!--//#articleSection -->
			<div class="div_paginate"></div>
	
		</div><!--//.aux -->
<form id="searchForm" action="" method="post" />

</div><!--//#content -->	
		

	

	
		<c:import url="/WEB-INF/template/footer.jsp"/>
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
		
					</script>
					
					<!-- <script >
					<@=paginate @>
					</script> -->

	<script type="text/javascript">
	
		const membersTmp = _.template($("#membsersTmp").html());
		const $wrapList  = $(".list_member"); 
		const $txtInp = $(".inp_txt");
		const $searchForm = $("#searchForm");
		const $totalCount = $(".total_count"); 
		const $aux = $(".aux");
		const $sortBtn = $(".sort input[type=radio]");
		const $divPaginate = $('.div_paginate'); 
		let page = 1;// page는 1페이지 부터 시작  
		
		getMembers();
		
		$sortBtn.change(getMembers);
		//검색하기 
		$searchForm.submit(function(e) {
			e.preventDefault();
			//console.log(sortingType);
			page=1;
			getMembers();
			
		});//submit end 

		function getMembers() {
			
			let formData =  $searchForm.serialize();
			console.log("form data");
			console.log(formData);
			$.ajax({ 
				url:"/vanilla-stock/ajax/manager/members",
				type:"post",
				data:formData+'&page='+page,
				error:function(){
					alert("error");
				},
				success: function(json) {
				
					if(page==1 || json.memberList.length>0){
						
						let tmp = membersTmp({"memberList": json.memberList,"paginate": json.paginate });
						console.log(json.total);
						$totalCount.text(json.total);
						
						$wrapList.empty().append(tmp);
						$divPaginate.empty().append(json.paginate);
						$txtInp.val(""); 
						
					}
				}
				
			});//ajax end 
		}// search() end
		
		//pageblock 클릭
		$aux.on("click",".paginate a",function(e){
			e.preventDefault();
			// 각 페이지의 시작되는 게시물 번호  
			page = this.dataset.no;
			//ajax로 데이터 리스트 받아오는 함수 
			console.log(page)
			getMembers();

		});//click() end
	
	</script>
</body>
</html>