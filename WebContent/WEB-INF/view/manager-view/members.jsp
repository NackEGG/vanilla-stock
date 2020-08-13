<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="articleSection">
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
</div><!--//#articleSection -->		
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
<script>
const membersTmp = _.template($("#membsersTmp").html());
</script>	
				