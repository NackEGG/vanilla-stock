<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="listTab">
    				<h2 class="screen_out">탭 목록</h2>
    				<ul>
       					<li class="tab">
        					<input id="financeTab" checked="checked" class="hidden inp_tab"  type="radio" name="tab" value="finance"/>
          					<label class="item_tab"  for="financeTab">재무재표</label>
        				</li>
        				<li class="tab">
             				<input id="articleTab" class="hidden inp_tab" type="radio" name="tab" value="arena"/>
          					<label class="item_tab"  for="articleTab">투기장</label>
        				</li>
        				<li class="tab">
         					<input id="announceTab"  class="hidden inp_tab" type="radio" name="tab" value="announce"/>
          					<label class="item_tab"  for="announceTab">공지</label>
        				</li>
    				</ul>
				</div><!--//#listTab -->
			<div id="articleSection">
				<div class="article contents show">
					<div class="finance div_contents show">
					<div class="wrap_bar">
						<div class="inner_search">
						<label class="screen_out">찾을 회사 입력</label>
						<input class="inp_txt" type="text" placeholder="회사명 입력" />
						 <span class="btn_search"> <i class="fa fa-search"></i></span>
						
						<div class="box_ico_search_bar" title="상세검색">
							<span class="ico_btn_detail ico_search_down"> 
							<i class="fa fa-chevron-down"></i>
							</span>
						</div><!--//.box_btn_search_bar -->
						

						 </div><!--//.inner_search -->
						 <div class="inner_detail_search hidden">
						 	<div class="box_inp_detail_search">
						 		<label class="screen_out">찾을 분기 검색</label>
						 		<select name="startYear" >
						 			<option value="2020">2020</option>
						 			<option value="2019">2019</option>
						 			<option value="2018">2018</option>
						 		</select>
						 		<span> 년 </span>
						 		<select name="startQuarter">
						 			<option value="4">4</option>
						 			<option value="3">3</option>
						 			<option value="2">2</option>
						 			<option value="1">1</option>
						 		</select>
						 		<span> 분기 </span>
						 		<span style="margin: 0 5px;"><i class="fas fa-money-bill-wave"></i></span>
						 		<select name="endYear" >
						 			<option value="2020">2020</option>
						 			<option value="2019">2019</option>
						 			<option value="2018">2018</option>
						 		</select>
						 		<span> 년 </span>
						 		<select name="endQuarter">
						 			<option value="4">4</option>
						 			<option value="3">3</option>
						 			<option value="2">2</option>
						 			<option value="1">1</option>
						 		</select>
						 		<span> 분기 </span>
						 	</div><!--//.box_inp_detail_search -->
						 	<div class="box_ico_search_bar" title="상세검색">
							<span class="ico_btn_detail ico_search_up"> 
							<i class="fa fa-chevron-up"></i>
							</span>
						</div><!--//.box_btn_search_bar -->
						 </div><!--//.inner_detail_search -->

					</div><!--//.wrap_bar -->

					<div class="wrap_list">
						<div class="head_list">
     						<span class="total"> 총 게시글 <strong class="total_count">100</strong> 개 </span>
							<!-- <p class="sort">
								<a class="on" href="">최신순</a>
							</p>  --><!--//sort -->
						</div><!--//.head_list -->
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
            	<tr>
                	<td class="row">1</td>
                	<td class="industry">전자장비와기기</td> 
                	<td class="company_nm">삼성전기</td>
                	<td class="stock_listed">74693696</td>
                	<td class="capital">388003400000</td>
                	<td class="facevalue">5000</td> 
                	<td class="currency">원(KRW)</td>
                	<td class="year">2020</td>
                	<td class="quarter">1</td>
                	<td class="account_label">총 포괄손익, 지배기업의 소유주에게 귀속되는 지분</td> 
                	<td class="account_value">161960335782</td>    
            	</tr>

            	<tr>
                	<td class="row">1</td>
                	<td class="industry">전자장비와기기</td> 
                	<td class="company_nm">삼성전기</td>
                	<td class="stock_listed">74693696</td>
                	<td class="capital">388003400000</td>
                	<td class="facevalue">5000</td> 
                	<td class="currency">원(KRW)</td>
                	<td class="year">2020</td>
                	<td class="quarter">1</td>
                	<td class="account_label">총 포괄손익, 지배기업의 소유주에게 귀속되는 지분</td> 
                	<td class="account_value">161960335782</td>    
            	</tr>

            	<tr>
                	<td class="row">1</td>
                	<td class="industry">전자장비와기기</td> 
                	<td class="company_nm">삼성전기</td>
                	<td class="stock_listed">74693696</td>
                	<td class="capital">388003400000</td>
                	<td class="facevalue">5000</td> 
                	<td class="currency">원(KRW)</td>
                	<td class="year">2020</td>
                	<td class="quarter">1</td>
                	<td class="account_label">총 포괄손익, 지배기업의 소유주에게 귀속되는 지분</td> 
                	<td class="account_value">161960335782</td>    
            	</tr>

            	<tr>
                	<td class="row">1</td>
                	<td class="industry">전자장비와기기</td> 
                	<td class="company_nm">삼성전기</td>
                	<td class="stock_listed">74693696</td>
                	<td class="capital">388003400000</td>
                	<td class="facevalue">5000</td> 
                	<td class="currency">원(KRW)</td>
                	<td class="year">2020</td>
                	<td class="quarter">1</td>
                	<td class="account_label">총 포괄손익, 지배기업의 소유주에게 귀속되는 지분</td> 
                	<td class="account_value">161960335782</td>    
            		</tr>
        						</tbody>
    						</table> <!--//.list_rating -->  
    					</div><!--//.list_finance -->
					</div><!--//.wrap_list -->

					
					</div><!--//.finance -->
				
				
				
					<div class="arena div_contents">
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
									<a class="opt_select" href=""  data-setting-key="block_article">게시글 중지</a>
								</li>
								<li>
									<a class="opt_select" href=""  data-setting-key="delete_article">게시글 삭제</a>
								</li>
							</ul>

						</div><!--//select_option -->
						
					</div><!--//box_inp_search -->

						<div class="box_ico_search_bar">
							<div class="ico_search_bar"> <i class="fa fa-search"></i> 검색</div>
						</div><!--//.box_btn_search_bar -->

						</div><!--//.inner_bar-->
						<div class="inner_search hidden">
						<label class="screen_out">찾을 게시글 회사 입력</label>
						<input class="inp_txt" type="text" placeholder="회사명 입력" />
						 <span class="btn_search"> <i class="fa fa-search"></i></span>
						 <span class="btn_close"><i class="fas fa-times"></i></span>
						

						 </div><!--//.inner_search -->

					</div><!--//.wrap_bar -->

					<div class="wrap_list">
						<div class="head_list">
     						<span class="total"> 총 게시글 <strong class="total_count">100</strong> 개 </span>
							<p class="sort">
								<a class="on" href="">최신순</a>
								<a href="">열혈순</a>
								
							</p><!--//sort -->
						</div><!--//.head_list -->
						<div class="list_arena">
        					<h3 class="screen_out">투기장 게시글 목록</h3>
        					<ul>
           	 					<li class="arena">
                					<input type="checkbox" name="no" value="" />
                					<a href="">
                   						<div title="회사명" class="company">  조흥 </div>
                 						<div class="box_winratio" >
                							<span class="screen_out">투 표</span>
                							<div class="winratio_graph">

                    						<div class="winratio_graph_fill winratio_graph_fill_left" title="풀매수: 70" style="width: 70%" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_left" >70</div>
                    						<div class="winratio_graph_fill winratio_graph_fill_right"   title="풀매도: 30" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_right">30</div>

                							</div><!--//.winratio_graph -->
            							</div><!--//.box_winratio -->
                   						<div class="industry">
                   							<span>[ </span> 
                   							<span>화학</span>
                   							<span> ]</span> 
                   						</div>
                   						<div class="comments"><i class="far fa-comment"></i><span> 99999</span></div>
                   						<div class="regdate"><time>2012.02.01</time></div> 

                					</a>
                					
                					<button type="button" class="btn btn_delete">삭제</button><!--//btn_delete -->
                					
           						</li><!--//.arena -->
           						
           						<li class="arena">
                					<input type="checkbox" name="no" value="" />
                					<a href="">
                   						<div title="회사명" class="company">라이프사이언스테크놀로지</div>
                 						<div class="box_winratio" >
                							<span class="screen_out">투 표</span>
                							<div class="winratio_graph">

                    						<div class="winratio_graph_fill winratio_graph_fill_left" title="풀매수: 70" style="width: 70%" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_left" >70</div>
                    						<div class="winratio_graph_fill winratio_graph_fill_right"   title="풀매도: 30" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_right">30</div>

                							</div><!--//.winratio_graph -->
            							</div><!--//.box_winratio -->
                   						<div class="industry">
                   							<span>[ </span> 
                   							<span>독립전력생산및에너지거래</span>
                   							<span> ]</span> 
                   						</div>
                   						<div class="comments"><i class="far fa-comment"></i><span> 0</span></div>
                   						<div class="regdate"><time>2012.02.01</time></div> 

                					</a>
                					<div class="box_btn_delete"> 
                						<button type="button" class="btn btn_delete">삭제</button><!--//btn_delete -->
                					</div><!--//.box_btn_delete -->
           						</li><!--//.arena -->
           						<li class="arena">
                					<input type="checkbox" name="no" value="" />
                					<a href="">
                   						<div title="회사명" class="company">  조흥 </div>
                 						<div class="box_winratio" >
                							<span class="screen_out">투 표</span>
                							<div class="winratio_graph">

                    						<div class="winratio_graph_fill winratio_graph_fill_left" title="풀매수: 70" style="width: 70%" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_left" >70</div>
                    						<div class="winratio_graph_fill winratio_graph_fill_right"   title="풀매도: 30" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_right">30</div>

                							</div><!--//.winratio_graph -->
            							</div><!--//.box_winratio -->
                   						<div class="industry">
                   							<span>[ </span> 
                   							<span>화학</span>
                   							<span> ]</span> 
                   						</div>
                   						<div class="comments"><i class="far fa-comment"></i><span> 99999</span></div>
                   						<div class="regdate"><time>2012.02.01</time></div> 

                					</a>
                					
                					<button type="button" class="btn btn_delete">삭제</button><!--//btn_delete -->
                					
           						</li><!--//.arena -->
           						
           						<li class="arena">
                					<input type="checkbox" name="no" value="" />
                					<a href="">
                   						<div title="회사명" class="company">라이프사이언스테크놀로지</div>
                 						<div class="box_winratio" >
                							<span class="screen_out">투 표</span>
                							<div class="winratio_graph">

                    						<div class="winratio_graph_fill winratio_graph_fill_left" title="풀매수: 70" style="width: 70%" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_left" >70</div>
                    						<div class="winratio_graph_fill winratio_graph_fill_right"   title="풀매도: 30" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_right">30</div>

                							</div><!--//.winratio_graph -->
            							</div><!--//.box_winratio -->
                   						<div class="industry">
                   							<span>[ </span> 
                   							<span>독립전력생산및에너지거래</span>
                   							<span> ]</span> 
                   						</div>
                   						<div class="comments"><i class="far fa-comment"></i><span> 0</span></div>
                   						<div class="regdate"><time>2012.02.01</time></div> 

                					</a>
                					<div class="box_btn_delete"> 
                						<button type="button" class="btn btn_delete">삭제</button><!--//btn_delete -->
                					</div><!--//.box_btn_delete -->
           						</li><!--//.arena -->
           						<li class="arena">
                					<input type="checkbox" name="no" value="" />
                					<a href="">
                   						<div title="회사명" class="company">  조흥 </div>
                 						<div class="box_winratio" >
                							<span class="screen_out">투 표</span>
                							<div class="winratio_graph">

                    						<div class="winratio_graph_fill winratio_graph_fill_left" title="풀매수: 70" style="width: 70%" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_left" >70</div>
                    						<div class="winratio_graph_fill winratio_graph_fill_right"   title="풀매도: 30" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_right">30</div>

                							</div><!--//.winratio_graph -->
            							</div><!--//.box_winratio -->
                   						<div class="industry">
                   							<span>[ </span> 
                   							<span>화학</span>
                   							<span> ]</span> 
                   						</div>
                   						<div class="comments"><i class="far fa-comment"></i><span> 99999</span></div>
                   						<div class="regdate"><time>2012.02.01</time></div> 

                					</a>
                					
                					<button type="button" class="btn btn_delete">삭제</button><!--//btn_delete -->
                					
           						</li><!--//.arena -->
           						
           						<li class="arena">
                					<input type="checkbox" name="no" value="" />
                					<a href="">
                   						<div title="회사명" class="company">라이프사이언스테크놀로지</div>
                 						<div class="box_winratio" >
                							<span class="screen_out">투 표</span>
                							<div class="winratio_graph">

                    						<div class="winratio_graph_fill winratio_graph_fill_left" title="풀매수: 70" style="width: 70%" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_left" >70</div>
                    						<div class="winratio_graph_fill winratio_graph_fill_right"   title="풀매도: 30" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_right">30</div>

                							</div><!--//.winratio_graph -->
            							</div><!--//.box_winratio -->
                   						<div class="industry">
                   							<span>[ </span> 
                   							<span>독립전력생산및에너지거래</span>
                   							<span> ]</span> 
                   						</div>
                   						<div class="comments"><i class="far fa-comment"></i><span> 0</span></div>
                   						<div class="regdate"><time>2012.02.01</time></div> 

                					</a>
                					<div class="box_btn_delete"> 
                						<button type="button" class="btn btn_delete">삭제</button><!--//btn_delete -->
                					</div><!--//.box_btn_delete -->
           						</li><!--//.arena -->
           						<li class="arena">
                					<input type="checkbox" name="no" value="" />
                					<a href="">
                   						<div title="회사명" class="company">  조흥 </div>
                 						<div class="box_winratio" >
                							<span class="screen_out">투 표</span>
                							<div class="winratio_graph">

                    						<div class="winratio_graph_fill winratio_graph_fill_left" title="풀매수: 70" style="width: 70%" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_left" >70</div>
                    						<div class="winratio_graph_fill winratio_graph_fill_right"   title="풀매도: 30" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_right">30</div>

                							</div><!--//.winratio_graph -->
            							</div><!--//.box_winratio -->
                   						<div class="industry">
                   							<span>[ </span> 
                   							<span>화학</span>
                   							<span> ]</span> 
                   						</div>
                   						<div class="comments"><i class="far fa-comment"></i><span> 99999</span></div>
                   						<div class="regdate"><time>2012.02.01</time></div> 

                					</a>
                					
                					<button type="button" class="btn btn_delete">삭제</button><!--//btn_delete -->
                					
           						</li><!--//.arena -->
           						
           						<li class="arena">
                					<input type="checkbox" name="no" value="" />
                					<a href="">
                   						<div title="회사명" class="company">라이프사이언스테크놀로지</div>
                 						<div class="box_winratio" >
                							<span class="screen_out">투 표</span>
                							<div class="winratio_graph">

                    						<div class="winratio_graph_fill winratio_graph_fill_left" title="풀매수: 70" style="width: 70%" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_left" >70</div>
                    						<div class="winratio_graph_fill winratio_graph_fill_right"   title="풀매도: 30" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_right">30</div>

                							</div><!--//.winratio_graph -->
            							</div><!--//.box_winratio -->
                   						<div class="industry">
                   							<span>[ </span> 
                   							<span>독립전력생산및에너지거래</span>
                   							<span> ]</span> 
                   						</div>
                   						<div class="comments"><i class="far fa-comment"></i><span> 0</span></div>
                   						<div class="regdate"><time>2012.02.01</time></div> 

                					</a>
                					<div class="box_btn_delete"> 
                						<button type="button" class="btn btn_delete">삭제</button><!--//btn_delete -->
                					</div><!--//.box_btn_delete -->
           						</li><!--//.arena -->
           						<li class="arena">
                					<input type="checkbox" name="no" value="" />
                					<a href="">
                   						<div title="회사명" class="company">  조흥 </div>
                 						<div class="box_winratio" >
                							<span class="screen_out">투 표</span>
                							<div class="winratio_graph">

                    						<div class="winratio_graph_fill winratio_graph_fill_left" title="풀매수: 70" style="width: 70%" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_left" >70</div>
                    						<div class="winratio_graph_fill winratio_graph_fill_right"   title="풀매도: 30" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_right">30</div>

                							</div><!--//.winratio_graph -->
            							</div><!--//.box_winratio -->
                   						<div class="industry">
                   							<span>[ </span> 
                   							<span>화학</span>
                   							<span> ]</span> 
                   						</div>
                   						<div class="comments"><i class="far fa-comment"></i><span> 99999</span></div>
                   						<div class="regdate"><time>2012.02.01</time></div> 

                					</a>
                					
                					<button type="button" class="btn btn_delete">삭제</button><!--//btn_delete -->
                					
           						</li><!--//.arena -->
           						
           						<li class="arena">
                					<input type="checkbox" name="no" value="" />
                					<a href="">
                   						<div title="회사명" class="company">라이프사이언스테크놀로지</div>
                 						<div class="box_winratio" >
                							<span class="screen_out">투 표</span>
                							<div class="winratio_graph">

                    						<div class="winratio_graph_fill winratio_graph_fill_left" title="풀매수: 70" style="width: 70%" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_left" >70</div>
                    						<div class="winratio_graph_fill winratio_graph_fill_right"   title="풀매도: 30" ></div>
                    						<div class="winratio_graph_txt winratio_graph_txt_right">30</div>

                							</div><!--//.winratio_graph -->
            							</div><!--//.box_winratio -->
                   						<div class="industry">
                   							<span>[ </span> 
                   							<span>독립전력생산및에너지거래</span>
                   							<span> ]</span> 
                   						</div>
                   						<div class="comments"><i class="far fa-comment"></i><span> 0</span></div>
                   						<div class="regdate"><time>2012.02.01</time></div> 

                					</a>
                					<div class="box_btn_delete"> 
                						<button type="button" class="btn btn_delete">삭제</button><!--//btn_delete -->
                					</div><!--//.box_btn_delete -->
           						</li><!--//.arena -->	
        	
        					</ul>
    					</div><!--//.list_arena -->
					</div><!--//.wrap_list -->
				
					</div><!--//.arena -->
				</div><!--//.contents -->
			</div><!--//#articleSection -->