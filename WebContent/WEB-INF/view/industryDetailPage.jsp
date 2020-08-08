<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/kakao.font.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<!--�׷����� ���� ��ũ��Ʈ-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/data.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	<!-- Additional files for the Highslide popup effect -->
	<script src="https://www.highcharts.com/media/com_demo/js/highslide-full.min.js"></script>
	<script src="https://www.highcharts.com/media/com_demo/js/highslide.config.js" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="https://www.highcharts.com/media/com_demo/css/highslide.css">


	<style type="text/css">
		/*1row*/

      #industry_info{
         height: 350px;
         position: relative;
      }
      #card_detail{
         height: 300px;
         width: 300px;
         background-color: #FFFBEF;
         position : absolute;
         top: 0;
         left: 5px;
      }
      .card_left{
         position: absolute;
         /*left: 10%;*/
         margin-top: 25px;
         width: 300px;
         text-align: center;
      }
      .card_right{
         position: absolute;
         left: 13%;
         margin-top: 130px;
         width: 400px;
         text-align: center;
      }
      .card_table{
         border: 1px solid gray;
         height: 50px;
         width: 200px;
         /*background-color: pink;*/
         margin-left:15px;
         margin-top: 70px;
      }
      .card_table tr td{
         border: 1px solid gray;
         vertical-align: middle;
      }
      /*�׷��� �����...?*/
      #graph_company{
         height: 200px;
         width: 700px;
         /*background-color: green;*/
         position : absolute;
         top: 0;
         right:50px;
      }

      /*2row*/
      #company_info{
         min-height: 300px;
        /*background-color: yellow; */
         position: relative;
      }
      #company_detail{
         min-height: 300px;
         width: 650px;
        /*background-color: red; */
         position : absolute;
		 top: 0;
		 left: 0px;
      }
      #detail_header{
         min-height: 130px;
         width: 600px;
         position: relative; 
         /*background-color: purple;*/
         /*       position : absolute;
                   left:0px;*/
      }
      .company_left{
         position: absolute;
         left: 70px;
         top: 25px;
      }
      .company_center{
         position: absolute;
         left: 220px;
         top: 50px;
      }
      .company_right{
         position: absolute;
         right: 0;
         top: 25px;
      }
      .detail_table{
         height: 200px;
         width: 500px;
         /*background-color: pink;*/
         margin-left: 80px;

         /*position : absolute;
            left:0px;*/
         /*margin-top: 200px;*/
      }
      .detail_table tr td{
         border: 1px solid gray;
         vertical-align: middle;
         text-align: center;
      }
      #select_company{
         min-height: 300px;
         width: 200px;
         /*background-color: yellow;*/
        /* position : absolute;
         right:50px;
         top: 0;*/
         margin-left: 780px;

         padding: 20px;
         border: 1px solid #bcbcbc;
      }
    /*   #select_company_list {
         display: block;
         min-height: 300px;
          width: 200px;
          background-color: red;
      }

      #select_company_list li{
         width: 200px;
         height: 19px;
      } */
      /*�׷����� ���� ������ css*/
      .highcharts-figure, .highcharts-data-table table {
         min-width: 360px;
         max-width: 800px;
         /*margin: 1em auto;*/
      }

      .highcharts-data-table table {
         font-family: Verdana, sans-serif;
         border-collapse: collapse;
         border: 1px solid #EBEBEB;
         text-align: center;
         width: 100%;
         max-width: 500px;
      }
      .highcharts-data-table caption {
         padding: 1em 0;
         font-size: 1.2em;
         color: #555;
      }
      .highcharts-data-table th {
         font-weight: 600;
         padding: 0.5em;
      }
      .highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
         padding: 0.5em;
      }
      .highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
         background: #f8f8f8;
      }
      .highcharts-data-table tr:hover {
         background: #f1f7ff;
      }

	</style>
	<script type="text/javascript">
		function company_checkbox(){
			var flag = false;
			var values = document.getElementsByName("companysel");
			var count = 0;
			for(var i=0; i<values.length;i++){
				if(values[i].checked){
					//alert(values[i].value);
					count++;
				}
			}
			if(count != 2){
				alert("2���� ����ּ���")
			}else{
				flag=true;
			}
			return flag;
			
		}
		
	
	</script>
</head>
<body>
	<div id="header">
		<div id="logoBox">
			<h1>
				<a href="" title="vanilla stock">
					<img src="${pageContext.request.contextPath}/img/vs-logo2.PNG" alt="vanilla stock"/>
				</a>
			</h1>

		</div><!--//#logoBox -->
		<div class="aux">
			<div id="gnb">
				<h2 class="screen_out">�ֿ� ����</h2>
				<ul>
					<li class="nav on"><a href=""> ����</a> </li>
					<li class="nav"><a href=""> ������ </a></li>
					<li class="nav"><a href="">��ŷ</a> </li>
				</ul>

			</div><!--//#gnb -->

			<div id="searchBox">
				<label class="screen_out">ã�� ȸ�� �Է�</label>
				<input class="inp_txt" type="text" placeholder="ȸ����� �Է����ּ���" />
				<span class="btn_search"> <i class="fa fa-search"></i></span>
			</div><!--//#searchBox -->

		</div><!--//.aux -->
		<div id="loginBox">
			<div id="loginBtn" class="btn hidden">
				�α���
			</div><!--//loginBtn -->
			<div id="profileBox" class="">
				<h2 class="screen_out">��������</h2>
				<img src="${pageContext.request.contextPath}/profile/profile.png"
					 class="profile_on"  width="60" height="60"
					 alt="�׽���"
					 title="�׽���"/>
				<div id="profilePopup" class="profile_on">
					<ul id="profileList">
						<li class="profile"><a href="/user.jsp?no=3"><span class="open_door" >��</span>
							<!--�����ڴ� ������ �������� �ٲٱ� -->
							����������</a></li><!--//.profile -->
						<li class="profile"><a href="/logout.do"><span class="close_door" >��</span> �α׾ƿ�</a></li><!--//.profile -->
					</ul><!--//profileList -->
				</div><!--//#profilePopup -->
			</div><!--#profileBox -->
			<script>
				const $profile = $("#profileBox img");
				const $profileTarget = $("#profilePopup");

				$profile.click(function () {
					$profileTarget.toggle();
				});// profileBox click end

				$("html").click(function(e){
					if(!$(e.target).hasClass("profile_on")){
						$profileTarget.hide();
					}
				});//
			</script>

		</div>

	</div><!--//#header -->
	<div id="content">
		<div class="aux">
			<div id="industry_info"><!--1row-->
				<div id="card_detail">
				<c:forEach var="comlist" items="${comlist}">
					<c:forEach var="cardData" items="${cardDataMap }">
					<c:if test="${comlist.industryNo==cardData.key}">
					 <div class="card_left">
						<ul>
							<li>
								<a href="" title="testicon">
								<img style="width: 50%; max-width: 600px; height: 50%; vertical-align: middle" 
										src="${pageContext.request.contextPath}/icon/<c:out value="${comlist.industryNo}"/>.png">
								</a>
							</li>
						</ul>
						
						<ul>
							<li style="text-align: center; font-size: large; margin-top: 15px" >
								<c:out value="${cardData.value.getIndustryName()}"/>
							</li>
						</ul>
					</div>
					<div class="card_right">
					<!-- c�±�(if,foreach)�̿� -->
						<table class="card_table">
							<tr style="height: 30px">
								<td colspan="4" style="color : <c:choose>
									<c:when test="${cardData.value.getChangeRate() < 0}">blue</c:when>
									<c:when test="${cardData.value.getChangeRate() > 0}">red</c:when>
									<c:otherwise>#669</c:otherwise>
									</c:choose>">
									���� ��� :<c:out value="${String.format('%.02f', cardData.value.getChangeRate()) }"/>%
								</td>
							</tr>
							<tr>
								<td>��ü</td>
								<td>���</td>
								<td>����</td>
								<td>�϶�</td>
							</tr>
							<tr>
								<td><c:out value="${cardData.value.totalCnt}"/></td>
								<td><c:out value="${cardData.value.incCnt}"/></td>
								<td><c:out value="${cardData.value.totalCnt-cardData.value.incCnt-cardData.value.decCnt}"/></td>
								<td><c:out value="${cardData.value.decCnt}"/></td>
							</tr>
						</table>
					</div>
					</c:if>
					</c:forEach>
					</c:forEach>
				</div><!--card_detail-->
				<!--�׷�������-->
				<div id="graph_company">
					<figure class="highcharts-figure">
						<div id="container" style="height: 300px"></div>
						<script>
							Highcharts.chart('container', {

								chart: {
									scrollablePlotArea: {
										minWidth: 700
									}
								},

								data: {
									csvURL: 'https://cdn.jsdelivr.net/gh/highcharts/highcharts@v7.0.0/samples/data/analytics.csv',
									beforeParse: function (csv) {
										return csv.replace(/\n\n/g, '\n');
									}
								},

								title: {
									text: null
								},

								/*subtitle: {
									text: 'Source: Google Analytics'
								},*/

								xAxis: {
									tickInterval: 7 * 24 * 3600 * 1000, // one week
									tickWidth: 0,
									gridLineWidth: 1,
									labels: {
										align: 'left',
										x: 3,
										y: -3
									}
								},

								yAxis: [{ // left y axis
									title: {
										text: null
									},
									labels: {
										align: 'left',
										x: 3,
										y: 16,
										format: '{value:.,0f}'
									},
									showFirstLabel: false
								}, { // right y axis
									linkedTo: 0,
									gridLineWidth: 0,
									opposite: true,
									title: {
										text: null
									},
									labels: {
										align: 'right',
										x: -3,
										y: 16,
										format: '{value:.,0f}'
									},
									showFirstLabel: false
								}],

								legend: {
									align: 'left',
									verticalAlign: 'top',
									borderWidth: 0
								},

								tooltip: {
									shared: true,
									crosshairs: true
								},

								plotOptions: {
									series: {
										cursor: 'pointer',
										point: {
											events: {
												click: function (e) {
													hs.htmlExpand(null, {
														pageOrigin: {
															x: e.pageX || e.clientX,
															y: e.pageY || e.clientY
														},
														headingText: this.series.name,
														maincontentText: Highcharts.dateFormat('%A, %b %e, %Y', this.x) + ':<br/> ' +
																this.y + ' sessions',
														width: 200
													});
												}
											}
										},
										marker: {
											lineWidth: 1
										}
									}
								},

								series: [{
									name: 'All sessions',
									lineWidth: 4,
									marker: {
										radius: 4
									}
								}, {
									name: 'New users'
								}]
							});
						</script>
					</figure>
				</div>

			</div><!--industry_info-->
			<div id="company_info"><!--2row-->
				<div id="company_detail">
					<!--ȸ�缼�γ��� Ÿ��Ʋ-->
					<div id="detail_header">
						<div class="company_left">
							<img>
							<div><span style="font-size: xx-large">�ƽþư���</span></div>
							<div><span>���%</span></div>
						</div>
						<div class="company_center">
							<img src="${pageContext.request.contextPath}/img/vsline.PNG" alt="vanilla stock" width="200px" height="20"/>
						</div>
						<div class="company_right">
							<img>
							<div><span style="font-size: xx-large">��ؾ��̵��</span></div>
							<div><span>���%</span></div>
							
						</div>
					</div><!--detail_header-->
					<!--ȸ�缼�γ���ǥ-->
					<div>
						<table class="detail_table">
							<tr>
								<td>��</td>
								<td style="background: white">���Ϻ�</td>
								<td>��</td>
							</tr>
							<tr>
								<td>��</td>
								<td style="background: white">�ż�ȣ��</td>
								<td>��</td>
							</tr>
							<tr>
								<td>��</td>
								<td style="background: white">�ŵ�ȣ��</td>
								<td>��</td>
							</tr>
							<tr>
								<td>��</td>
								<td style="background: white">�ŷ���</td>
								<td>��</td>
							</tr>
							<tr>
								<td>��</td>
								<td style="background: white">�ŷ����</td>
								<td>��</td>
							</tr>
							<tr>
								<td>��</td>
								<td style="background: white">���ϰŷ���</td>
								<td>��</td>
							</tr>
						</table>
					</div>
				</div><!--company_detail-->
				<div id="select_company">
					<form method="get" action="�׼ǳֱ�">
						<p>���� �����ϱ�</p><hr>
						 <c:forEach var="comlist" items="${comlist}"> 
						<ul id="select_company_list"><!--name�� value�����ϱ�-->
							<li><label><input type="checkbox" name="companysel" value="blue"><c:out  value="${comlist.getCompany()}"/></label></li>
							<!-- <li><label><input type="checkbox" name="companysel" value="red"> ȸ���̸�2</label></li> -->
						</ul>
						</c:forEach> 	
						<ul>
							<hr><li style="margin-left: 120px"><input type="button" onclick="return company_checkbox()" value="����" id="go"></li>
						</ul>
						 
					</form>
				</div><!-- select_company -->
				<!-- checkbox�� ���� �������� -->
				<script>
				$(document).ready(function(){
					$('#go').click(function(){
						var cnt=$('.cb:checked').length;
						$('#result').html(cnt+"�� ���õ�").css("color","blue");
					});
				});
				</script>
			</div><!--company_info-->
		</div><!--//.aux -->
	</div><!--//#content -->


	<div id="footer">
			<div id="policy">
		<h4 class="screen_out">��å �� ���</h4>
		<ul>
		<li><a href="">ȸ��Ұ�</a></li><!--
	 --><li><a href="">����</a></li><!--
	 --><li><a href="">�˻����</a></li><!--
	 --><li><a href="">��������</a></li><!--
	 --><li><a href="">�̿���</a></li><!--
	 --><li><a href=""><strong>���������̿���</strong></a></li><!--
	 --><li><a href="">û�ҳ⺸ȣ��å</a></li><!--
	--><li><a href="">������</a></li>
	</ul>
	</div><!--//policy -->
	<address>&copy; 2020 <a href="">NackEGG.com</a></address>

	</div><!--//#footer -->
	<script  src="${pageContext.request.contextPath}/js/fix-footer.js"></script>

</body>
</html>