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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<!--�׷����� ���� ��ũ��Ʈ-->
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	

	<script>
		
	
	
	
	</script>
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
		/* #container {
		height: 400px; 
		}
		 */
		.highcharts-figure, .highcharts-data-table table {
		  min-width: 310px; 
		  max-width: 800px;
		 /*  margin: 1em auto; */
		}
		
		.highcharts-data-table table {
		  font-family: Verdana, sans-serif;
		  border-collapse: collapse;
		  border: 1px solid #EBEBEB;
		 /*  margin: 10px auto; */
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
				<a href="${pageContext.request.contextPath}" title="vanilla stock">
					<img src="${pageContext.request.contextPath}/img/vs-logo2.PNG" alt="vanilla stock"/>
				</a>
			</h1>

		</div><!--//#logoBox -->
		<div class="aux">
			<div id="gnb">
	          <h2 class="screen_out">�ֿ� ����</h2>
	          <ul>
	            <li class="nav on"><a href="${pageContext.request.contextPath}/cardpage/init"> ����</a></li>
	            <li class="nav"><a href="${pageContext.request.contextPath}/articlePage"> ������ </a></li>
	            <li class="nav"><a href="">��ŷ</a></li>
	          </ul>
	        </div>
			<!--//#gnb -->

			<div id="searchBox">
				<label class="screen_out">ã�� ȸ�� �Է�</label>
				<input class="inp_txt" type="text" placeholder="ȸ����� �Է����ּ���" />
				<span class="btn_search"> <i class="fa fa-search"></i></span>
			</div><!--//#searchBox -->

		</div><!--//.aux -->
      <div id="loginBox">
        <div id="loginBtn" class="btn ${loginMember eq null? '':'hidden'}" onclick="modalpopup('loginForm')">
          �α���
        </div>
         <!--//.aux -->
        <!-- Hidden�� �α���â-->
        <div id="loginForm" style="visibility: hidden;" >
          <div class="form">
            <div class="formContents"></div>
            <form class="login-form" action ="/vanilla-stock/login" method="post">
              <input type="text" name="email" class="email" placeholder="email" />
              <input type="password" name="password" class="password" placeholder="password" />
              <button class="login">login</button>
              <p class="message">
                	ȸ���� �ƴϽö��?
                <a
                  href="${pageContext.request.contextPath}/join"
                  >ȸ������</a
                >
              </p>
              <p class="close" onclick="popupclose('loginForm')">�ݱ�</p>
            </form>
          </div>
        </div>
        <!-- Hidden�� �α���â���� JS-->
        <script>
          function modalpopup(i) {
            document.getElementById(i).style.visibility = "visible";
          }

          function popupclose(i) {
            document.getElementById(i).style.visibility = "hidden";
          }
          
       
      	$(document).ready(function(e){
      		$('#login').click(function(){
      			// �Է� �� üũ
      			if($.trim($('#email').val()) == ''){
      				alert("���̵� �Է��� �ּ���.");
      				$('#email').focus();
      				return;
      			}else if($.trim($('#passwd').val()) == ''){
      				alert("�н����带 �Է��� �ּ���.");
      				$('#password').focus();
      				return;
      			}
      			
      			//����
      			$('#login-form').submit();
      		});
      		
      	});
        </script>
        <!--//loginBtn -->
        <div id="profileBox" class="${loginMember eq null ? 'hidden' : ''}">

          <img
            src="profile/profile.png"
            class="profile_on"
            width="60"
            height="60"
            alt="�׽���"
            title="�׽���"
          />
          <div id="profilePopup" class="profile_on">
            <ul id="profileList">
              <li class="profile">
                <a href="/user.jsp?no=3"
                  ><span class="open_door">��</span>
                  <!--�����ڴ� ������ �������� �ٲٱ� -->
                  ����������</a
                >
              </li>
              <!--//.profile -->
              <li class="profile">
                <a href="${pageContext.request.contextPath}/logout"
                  ><span class="close_door">��</span> �α׾ƿ�</a
                >
              </li>
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
          $profile.click(function () {
            $profileTarget.toggle();
          }); // profileBox click end
          $("html").click(function (e) {
            if (!$(e.target).hasClass("profile_on")) {
              $profileTarget.hide();
            }
          }); //
        </script>
      </div>
    </div><!--//#header -->
	<div id="content">
		<div class="aux">
			<div id="industry_info"><!--1row-->
				<div id="card_detail">
					 <div class="card_left">
						<ul>
							<li>
								<a href="" title="testicon">
								<img style="width: 50%; max-width: 600px; height: 50%; vertical-align: middle" 
										src="${pageContext.request.contextPath}/icon/<c:out value="${detailIndNo}"/>.png">
								</a>
							</li>
						</ul>
						
						<ul>
							<li style="text-align: center; font-size: large; margin-top: 15px" >
								<c:out value="${detailIndName}"/>
							</li>
						</ul>
					</div>
					<div class="card_right">
						<table class="card_table">
							<tr style="height: 30px">
								<td colspan="4" style="color : <c:choose>
									<c:when test="${cardDetail.getChangeRate() < 0}">blue</c:when>
									<c:when test="${cardDetail.getChangeRate() > 0}">red</c:when>
									<c:otherwise>#669</c:otherwise>
									</c:choose>">
									���� ��� :<c:out value="${String.format('%.02f', cardDetail.getChangeRate()) }"/>%
								</td>
							</tr>
							<tr>
								<td>��ü</td>
								<td>���</td>
								<td>����</td>
								<td>�϶�</td>
							</tr>
							<tr>
								<td><c:out value="${cardDetail.totalCnt}"/></td>
								<td><c:out value="${cardDetail.incCnt}"/></td>
								<td><c:out value="${cardDetail.totalCnt - cardDetail.incCnt - cardDetail.decCnt}"/></td>
								<td><c:out value="${cardDetail.decCnt}"/></td>
							</tr>
						</table>
					</div>
				</div><!--card_detail-->
				<!--�׷�������-->
				<div id="graph_company">
					<figure class="highcharts-figure">
						<div id="container" style="height: 300px"></div>
						<script>
						var dateList = ${plotDateList};
						Highcharts.chart('container', {
							  chart: {
							    type: 'column'
							  },
							  title: {
							    text: null
							  },
							  xAxis: {
							    categories: dateList
							  },
							  credits: {
							    enabled: false
							  },
							  series: [{
							    name: '',
							    data: [0, 0, 0, 0, 0, 0, 0]
							  }, {
							    name: '',
							    data: [0, 0, 0, 0, 0, 0, 0]
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
							<div id="comName1" style="font-size: xx-large">���� ����</div>
							<div id="CRate1" style="text-align: left">���%</div>
						</div>
						<div class="company_center">
							<img src="${pageContext.request.contextPath}/img/vsline.PNG" alt="vanilla stock" width="200px" height="20"/>
						</div>
						<div class="company_right">
							<img>
							<div id="comName2" style="font-size: xx-large">���� ����</div>
							<div id="CRate2" style="text-align: right">���%</div>
							
						</div>
					</div><!--detail_header-->
					<!--ȸ�缼�γ���ǥ-->
					<div>
						<table class="detail_table">
							<tr>
								<td id="cmpCurJuka1">-</td>
								<td style="background: white">�����ְ�</td>
								<td id="cmpCurJuka2">-</td>
							</tr>
							<tr>
								<td id="cmpDebi1">-</td>
								<td style="background: white">���ϴ��</td>
								<td id="cmpDebi2">-</td>
							</tr>
							<tr>
								<td id="cmpVolume1">-</td>
								<td style="background: white">�ŷ���</td>
								<td id="cmpVolume2">-</td>
							</tr>
							<tr>
								<td id="cmpPER1">-</td>
								<td style="background: white">PER</td>
								<td id="cmpPER2">-</td>
							</tr>
							<tr>
								<td id="cmpHighJuka1">-</td>
								<td style="background: white">��</td>
								<td id="cmpHighJuka2">-</td>
							</tr>
							<tr>
								<td id="cmpLowJuka1">-</td>
								<td style="background: white">����</td>
								<td id="cmpLowJuka2">-</td>
							</tr>
						</table>
					</div>
				</div><!--company_detail-->
				<div id="select_company">
					<form method="get" action="�׼ǳֱ�">
						<p>���� �����ϱ�</p><hr>
						 <c:forEach var="comlist" items="${comlist}"> 
						<ul id="select_company_list"><!--name�� value�����ϱ�-->
							<li><label><input type="checkbox" name="companysel" value="<c:out  value="${comlist.getCompany()}"/>" class="cb"><c:out  value="${comlist.getCompany()}"/></label></li>
							<!-- <li><label><input type="checkbox" name="companysel" value="red"> ȸ���̸�2</label></li> -->
						</ul>
						</c:forEach> 	
						<ul>
							<hr><li style="margin-left: 120px"><input type="button" onclick="return company_checkbox()" value="����" id="go"></li>
						</ul>
						 
					</form>
				</div><!-- select_company -->
				<!-- checkbox�� ���� �������� -->
				<script type="text/javascript">
				$('#go').on('click', function(){
					var dateList = ${plotDateList};
					var comName = [];
					var CRList1 = [];
					var CRList2 = [];
					
					$('input[type="checkbox"]:checked').each(function(index,item){
						comName[index] = $(this).val();
						
					   });
				    var form = {
				            str1 :comName[0],
				           	str2: comName[1]
				    }
				    $.ajax({
				        url: "http://localhost:8787/vanilla-stock/cardpage/restController",
				        type: "POST",
				        data: JSON.stringify(form),
				        contentType: "application/json; charset=utf-8;",
				        dataType: "json",
				        success: function(data){
				           	for(var i=0; i<7; i++){
				           		CRList1[i] = parseFloat(data[0][i]);
				           	}
				           	for(var i=0; i<7; i++){
				           		CRList2[i] = parseFloat(data[1][i]);
				           	}
				           	
				           	$('#comName1').html(comName[0]);
				        	$('#comName2').html(comName[1]);
				        	
				        	$('#CRate1').html(CRList1[6] + "%");
				        	$('#CRate2').html(CRList2[6] + "%");
				        	
				        	$('#cmpCurJuka1').html(data[2][0]);
				        	$('#cmpCurJuka2').html(data[3][0]);
				        	
				        	$('#cmpDebi1').html(data[2][1]);
				        	$('#cmpDebi2').html(data[3][1]);
				        	
				        	$('#cmpVolume1').html(data[2][2]);
				        	$('#cmpVolume2').html(data[3][2]);
				        	
				        	$('#cmpPER1').html(data[2][3]);
				        	$('#cmpPER2').html(data[3][3]);

				        	$('#cmpHighJuka1').html(data[2][4]);
				        	$('#cmpHighJuka2').html(data[3][4]);

				        	$('#cmpLowJuka1').html(data[2][5]);
				        	$('#cmpLowJuka2').html(data[3][5]);
				        	
				        	Highcharts.chart('container', {
				        		  chart: {
				        		    type: 'column'
				        		  },
				        		  title: {
				        		    text: '�����'
				        		  },
				        		  xAxis: {
				        		    categories: dateList
				        		  },
				        		  credits: {
				        		    enabled: false
				        		  },
				        		  series: [{
				        		    name: comName[0],
				        		    data: CRList1
				        		  }, {
				        		    name: comName[1],
				        		    data: CRList2
				        		  }]
				        	});
				        },
				        error: function(){
				            alert("restController err");
				        }
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