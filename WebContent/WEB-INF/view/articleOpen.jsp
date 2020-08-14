<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.List" %>
<% List<String> companyList = (List<String>)request.getAttribute("companyList"); %>    
  
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title></title>
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/kakao.font.css" />
    <link rel="stylesheet" href="css/default.css" />
    <link rel="stylesheet" href="css/articleOpen.css" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
      integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
    <script src="js/jquery.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
  	$( function() {
  		var availableTags = [];
  		<%for(int i=0; i < companyList.size();i++){%>
  		availableTags[<%=i%>]='<%=companyList.get(i)%>';
  		<%}%>
    	$( ".articleCompanyOption" ).autocomplete({
      	source: availableTags
    	});
  	} );
  </script>
    <style type="text/css" media="screen">
      #divTEST {
        height: 1000px;
        background-color: red;
      }
    </style>
  </head>
  <body>
    <div class="articleOpenform">
      <div class="articleOpenTitle">
        <span class="articleCName">회사 </span>
        <div class="ui-widget">
  			<label for="articleCompanyOption"> </label>
 			 <input type="text" class="articleCompanyOption" placeholder="회사명을 입력하세요" name="company"
 			 	form="insertForm">
		</div>
      </div>
      <div class="articleOpenTitle">
        <span class="articleName">투기장명</span>
        <input
          type="text"
          placeholder="투기장명을 입력하세요."
          name="title"
          class="openTitle"
          form="insertForm"
        />
      </div>
      	<div class="openConfirmed">
      		OPEN
      	</div>
    </div>
   <form id="insertForm" action="" method="post" />
   <script type="text/javascript">
	//_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim}; 
		//const $articleCompanyOption = $(".articleCompanyOption")
		//const $openTitle = $(".openTitle")
		const $insertForm = $("#insertForm");
		function insertArticle() {
			let formData =  $insertForm.serialize();
			console.log("form data");
			console.log(formData);
			$.ajax({ 
				url:"/vanilla-stock/ajax/articlePage/insert",
				type:"post",
				data:formData,
				error:function(){
					alert("open 실패");
				},
				success: function() {
					alert("open 성공")
					opener.location.reload();
					window.close();
					
				}
			});//ajax end 
		}// search() end
		$( ".openConfirmed" ).click(function() {
			insertArticle();	 
		});
	</script>
  </body>
</html>
