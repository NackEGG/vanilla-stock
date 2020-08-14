<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>manager page</title>
	<c:import url="/WEB-INF/template/link.jsp"/>
	<link rel="stylesheet" href="/vanilla-stock/css/managerPage.css" />
	
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
	<input type="hidden" id="categoryINP" value="${category }" name="category"/>
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

			
				
				<!-- user article 시작  -->
			
				<c:import url="manager-view/${category }.jsp"/> 

			
			<div class="div_paginate"></div>
	
		</div><!--//.aux -->
<form id="searchForm" action="" method="post" />

</div><!--//#content -->	
		
	
		<c:import url="/WEB-INF/template/footer.jsp"/>
		
	<script src="/vanilla-stock/js/manager.js"></script>

</body>
</html>