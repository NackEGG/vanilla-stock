<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
     						<span class="total"> 총 사용자 <strong class="total_count"></strong> 명 </span>
							<p class="sort">
								<input id="latestMember" type="radio" form="searchForm" name="sortType" value="latestMember" checked/>
								<label for="latestMember">최신순</label>
								<input id="hardMember" type="radio" form="searchForm" name="sortType" value="hardMember" />
								<label for="hardMember">열혈순</label>
								
								
							</p><!--//sort -->
						</div><!--//.head_list -->
						<div class="list_member">
					
						</div> <!--//.list_member -->
					</div><!--//.wrap_list -->

				</div><!--//.member -->