<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="listTab">
	<h2 class="screen_out">탭 목록</h2>
	<ul>
		<li class="tab"><input form="searchForm" id="financeTab"
			checked="checked" class="hidden inp_tab" type="radio" name="tab"
			value="finance" /> <label class="item_tab" for="financeTab">재무재표</label></li>
		<li class="tab"><input form="searchForm" id="articleTab"
			class="hidden inp_tab" type="radio" name="tab" value="arena" /> <label
			class="item_tab" for="articleTab">투기장</label></li>
		<li class="tab"><input form="searchForm" id="announceTab"
			class="hidden inp_tab" type="radio" name="tab" value="announce" /> <label
			class="item_tab" for="announceTab">공지</label></li>
	</ul>
</div>
<!--//#listTab -->
<div id="articleSection">
	<div class="article contents show">
		<div class="finance div_contents show">
			<div class="wrap_bar">
				<div class="inner_search">
					<label class="screen_out">찾을 회사 입력</label> 
					<input type="hidden" name="searchWord" form="searchForm" id="stockCodeInp" />
					<input class="inp_txt company_inp" type="text" 
						placeholder="회사명 입력" /> <span class="btn_search"> <i
						class="fa fa-search"></i></span>
					<div id="companySearchBox" class="company_search_on"></div>
					<!--//#companySearchBox   -->

					<div class="box_ico_search_bar" title="상세검색">
						<span class="ico_btn_detail ico_search_down"> <i
							class="fa fa-chevron-down"></i>
						</span>
					</div>
					<!--//.box_btn_search_bar -->


				</div>
				<!--//.inner_search -->
				<div class="inner_detail_search hidden">
					<div class="box_inp_detail_search">
					<label class="screen_out">찾을 분기 검색</label> 

				
					</div>
					<!--//.box_inp_detail_search -->
					<div class="box_ico_search_bar" title="상세검색">
						<span class="ico_btn_detail ico_search_up"> <i
							class="fa fa-chevron-up"></i>
						</span>
					</div>
					<!--//.box_btn_search_bar -->
				</div>
				<!--//.inner_detail_search -->

			</div>
			<!--//.wrap_bar -->

			<div class="wrap_list">
				<div class="head_list">
					<span class="total"> 총 게시글 <strong class="total_count"></strong>
						개
					</span>
					<!-- <p class="sort">
								<a class="on" href="">최신순</a>
							</p>  -->
					<!--//sort -->
				</div>
				<!--//.head_list -->
				<div class="list_finance">
					<h3 class="screen_out">재무재표 목록</h3>
					<table class="list_rating">
						<thead>
							<tr>
								<th class="row">#</th>
								<th class="industry">업종</th>
								<th class="company_nm">회사명</th>
								<th class="stock_listed">상장주식수</th>
								<th class="capital">자본금</th>
								<th class="facevalue">액면가</th>
								<th class="currency">통화구분</th>
								<th class="year">년도</th>
								<th class="quarter">분기</th>
								<th class="account_label">계정명</th>
								<th class="account_value">당기금액</th>
							</tr>
						</thead>
						<tbody>



						</tbody>
					</table>
					<!--//.list_rating -->
				</div>
				<!--//.list_finance -->
			</div>
			<!--//.wrap_list -->


		</div>
		<!--//.finance -->



		<div class="arena div_contents">
			<div class="wrap_bar">
				<div class="inner_bar">

					<!-- -->
					<div class="box_inp_settings">
						<div class="ico_chx">
							<input form="searchForm" type="checkbox" name="all" value="" />
						</div>

						<div class="select_title" data-title="제목">

							<span class="opt_seleted"> 설정 </span> <span
								class="ico_angle_down"> <i class="fas fa-angle-down"></i>
							</span> <span class="ico_angle_up"> <i class="fas fa-angle-up"></i>
							</span>
						</div>
						<!--//select_title -->

						<div class="select_option">
							<ul>

								<li><a class="opt_select" href=""
									data-setting-key="block_article">게시글 중지</a></li>
								<li><a class="opt_select" href=""
									data-setting-key="delete_article">게시글 삭제</a></li>
							</ul>

						</div>
						<!--//select_option -->

					</div>
					<!--//box_inp_search -->

					<div class="box_ico_search_bar">
						<div class="ico_search_bar">
							<i class="fa fa-search"></i> 검색
						</div>
					</div>
					<!--//.box_btn_search_bar -->

				</div>
				<!--//.inner_bar-->
				<div class="inner_search hidden">
					<label class="screen_out">찾을 게시글 회사 입력</label> <input
						form="searchForm" class="inp_txt" type="text" placeholder="회사명 입력" />
					<span class="btn_search"> <i class="fa fa-search"></i></span> <span
						class="btn_close"><i class="fas fa-times"></i></span>


				</div>
				<!--//.inner_search -->

			</div>
			<!--//.wrap_bar -->

			<div class="wrap_list">
				<div class="head_list">
					<span class="total"> 총 게시글 <strong class="total_count"></strong>
						개
					</span>
					<p class="sort">
						<input id="latestSort" type="radio" form="searchForm"
							name="sortType" value="latest" checked /> <label for="latestSort">최신순</label>
						<input id="hotSort" type="radio" form="searchForm" name="sortType"
							value="hot" /> <label for="hotSort">열혈순</label>
					</p>
					<!--//sort -->
					<!--//sort -->
				</div>
				<!--//.head_list -->
				<div class="list_arena">
					<h3 class="screen_out">투기장 게시글 목록</h3>
					<ul>
						
						<!--//.arena -->

					</ul>
				</div>
				<!--//.list_arena -->
			</div>
			<!--//.wrap_list -->

		</div>
		<!--//.arena -->
	</div>
	<!--//.contents -->
</div>
<!--//#articleSection -->
<script type="text/template" id="arenaListTmp">
<@ _.each(arenas, function(arena){   @>	 
<li class="arena">
	<input type="checkbox" name="no" value="<@=arena.no @>" />
	<a href="">
		<div title="회사명" class="company"><@=arena.company @></div>
		<div class="box_winratio">
		<span class="screen_out">투 표</span>
		<div class="winratio_graph">
		<@ let buyRatio = Math.round(arena.buyingCount/(arena.buyingCount+arena.sellCount)*100); 
		
		@>
		
		<div class="winratio_graph_fill winratio_graph_fill_left" title="풀매수: <@=arena.buyingCount @>" style="width: <@=buyRatio @>% "></div>
		<div class="winratio_graph_txt winratio_graph_txt_left"><@=buyRatio @>%</div>
		<div class="winratio_graph_fill winratio_graph_fill_right" title="풀매도: <@=arena.sellCount @>"></div>
		<div class="winratio_graph_txt winratio_graph_txt_right"><@=100-buyRatio @>%</div>

		</div>
		<!--//.winratio_graph -->
		</div> <!--//.box_winratio -->
		<div class="industry">
		<span>[ </span> <span><@=arena.industry @></span> <span> ]</span>
		</div>
		<div class="comments">
		<i class="far fa-comment"></i><span> <@=arena.commentsCount @></span>
		</div>
		<div class="regdate">
		<time><@=moment(arena.regdate).fromNow() @></time>
		</div>

	</a>
	<button type="button" class="btn btn_delete">삭제</button> <!--//btn_delete -->
</li>
<@ })@>
</script>


<script type="text/template" id="financeListTmp">
<@ _.each(finances, function(fin){   @>	
<tr>
	
		<td class="row"><@=fin.R @></td>
		<td class="industry"><@=fin.name @></td>
		<td class="company_nm"><@=fin.company @></td>
		<td class="stock_listed"><@=fin.stockListed @></td>
		<td class="capital"><@=fin.capital @></td>
		<td class="facevalue"><@=fin.facevalue @></td>
		<td class="currency"><@=fin.currency @></td>
		<td class="year"><@=fin.year @></td>
		<td class="quarter"><@=fin.quarter @></td>
		<td class="account_label"><@=fin.labelKor @></td>
		<td class="account_value"><@=fin.accountValue @></td>

	</tr>
<@ })@>
</script>
<script type="text/template" id="searchCompanyTmp">
	
		<ul>
	<@ _.each(companyList, function(comp){   @>
			<li class="result_company" data-stockCode="<@=comp.stockCode @>"><@=comp.company @></li>
	<@ })@>
		</ul>
	
</script>
<script type="text/template" id="searchTermTmp">
<@
	console.log(years.size);

@>
<@ if(years.size > 0){ @> 
<select id="startYear" form="searchForm" name="startYear">
					
<@ for (let year of years){  @>
	<option value="<@=year @>" <@ if(startYearsVal == year) {@>selected <@ } @> ><@=year @></option>
<@ }@>
</select> <span> 년 </span> 
			
<select id="startQuarter" form="searchForm" name="startQuarter">
<@ 	_.each(terms, function(term){ @>
<@ if(term.year == startYearsVal){ @>
	<option value="<@=term.quarter @>" <@ if(startQuarterVal == term.quarter) {@>selected <@ } @> ><@=term.quarter @></option>

<@ }}) @>
</select>
	<span> 분기 </span>
	<span style="margin: 0 5px;"><i class="fas fa-money-bill-wave"></i></span>
	
	<select id="endYear" form="searchForm" name="endYear" >
<@ for (let year of years){  @>
		<@ if(year <= startYearsVal) { @>
		<option value="<@=year @>" <@ if(endYearsVal == year) {@>selected <@ } @>><@=year @></option>
		<@ } @>
<@ }@>
	</select>
	<span> 년 </span>
	<select form="searchForm" name="endQuarter">
<@ 	_.each(terms, function(term){ @>
<@ if(term.year == endYearsVal){ @>
	<@ if(endYearsVal == startYearsVal){ @>
		<@ if(term.quarter <= startQuarterVal){ @>
	<option value="<@=term.quarter @>"><@=term.quarter @></option>
	<@ } } else { @>
		<option value="<@=term.quarter @>"><@=term.quarter @></option>
	<@ } @>
<@ }}) @>
	</select>
<span> 분기 </span>
<button class="btn" form="searchForm"  type="submit">확인</button>
<@ } else { @>
	<span> 재무재표가 없습니다 </span>
<@ } @>
</script>


<script>
const searchCompanyTmp = _.template($("#searchCompanyTmp").html());
const searchTermTmp = _.template($("#searchTermTmp").html());
const financeListTmp = _.template($("#financeListTmp").html());
const arenaListTmp = _.template($("#arenaListTmp").html());
</script>
