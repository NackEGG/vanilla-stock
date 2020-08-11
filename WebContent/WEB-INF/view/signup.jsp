<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/kakao.font.css" />
    <link rel="stylesheet" href="css/default.css" />
    <link rel="stylesheet" href="css/signup.css" />
    
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
      integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
      crossorigin="anonymous"
    />
    <script src="../js/jquery.js"></script>
    <style type="text/css" media="screen">
      #divTEST {
        height: 1000px;
        background-color: lightcoral;
      }
    </style>
  </head>
  <body>
    <div id="header">
      <div id="logoBox">
        <h1>
          <a href="" title="vanilla stock">
            <img src="../img/vs-logo2.PNG" alt="vanilla stock" />
          </a>
        </h1>
      </div>
      <!--//#logoBox -->
      <div class="aux">
        <div id="gnb">
          <h2 class="screen_out">주요 서비스</h2>
          <ul>
            <li class="nav"><a href=""> 종목</a></li>
            <li class="nav on"><a href=""> 투기장 </a></li>
            <li class="nav"><a href="">랭킹</a></li>
          </ul>
        </div>
        <!--//#gnb -->

        <div id="searchBox">
          <label class="screen_out">찾을 회사 입력</label>
          <input
            class="inp_txt"
            type="text"
            placeholder="회사명을 입력해주세요"
          />
          <span class="btn_search"> <i class="fa fa-search"></i></span>
        </div>
        <!--//#searchBox -->
      </div>
      <!--//.aux -->
      <div id="loginBox">
        <div id="loginBtn" class="btn">
          로그인
        </div>
        <!--//loginBtn -->
        <div id="profileBox" class="hidden">
          <h2 class="screen_out">유저정보</h2>
          <img
            src="../profile/profile.png"
            class="profile_on"
            width="60"
            height="60"
            alt="테스터"
            title="테스터"
          />
          <div id="profilePopup" class="profile_on">
            <ul id="profileList">
              <li class="profile">
                <a href="/user.jsp?no=3"
                  ><span class="open_door">문</span>
                  <!--관리자는 관리자 페이지로 바꾸기 -->
                  마이페이지</a
                >
              </li>
              <!--//.profile -->
              <li class="profile">
                <a href="/logout.do"
                  ><span class="close_door">문</span> 로그아웃</a
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
    </div>
    <!--//#header -->
    <div id="content">
      <div class="aux">
        <div id="signup">
          <form action="" id="joinForm">
            <ul class="join_box">
              <li class="checkBox check01">
               
              </li>
              <li class="checkBox check02">
              
                <textarea name="signupContents" id="signupContents">
여러분을 환영합니다.
    저희 사이트는 정보제공만 할 뿐 여러분의 의사결정에 아무런 책임을 지지않습니다. 동의하신다면 이용약관 동의에 체크해주세요.
           </textarea
                >

                <ul class="clearfix">
                    <li class="checkBtn">
                        <input type="checkbox" name="chk" />
                      </li>
                    <li>이용약관 동의(필수)</li>
                   
                  </ul>
              </li>
              

          </form>
        </div> <!-- // #signup -->

        <div class= "signupForm">
            <div class="profileDefault">
                    <img src="avatar.jpg" class="profiledefault" />
                  </div>

                  <div class= "joinformContents">
                      <form  enctype="text/plain" action="/signup" method="post">
                        <table boder ="1px" bordercolor="grey" class="joinForm_middle">
                            <tbody>
                                <tr>
                                    <td class="join_subject" name="email">이메일</td>
                                    </tr>
                                    <tr>
                                    <td><input type="text" name="join_email" class="join_inputbox" placeholder="이메일을 입력해주세요."></td>
                                    <td><input type="button" name ="confirm" class="confirmbutton" value="중복확인"></td>
                                </tr>

                                <tr>
                                    <td class="join_subject" name="password">비밀번호</td>
                                    </tr>
                                    <tr>
                                    <td><input type="password" name="join_password" class="join_inputbox" placeholder="비밀번호를 입력해주세요."></td>
                                    </tr>
                                    <tr>
                                    <td><input type="password" name="join_password" class="join_inputbox" placeholder="비밀번호를 한번 더 입력해주세요."></td>
                                    <td><input type="button" name ="confirm" class="confirmbutton" value="중복확인"></td>
                                </tr>


                                <tr>
                                    <td class="join_subject" name="birthday">생년월일</td>
                                    </tr>
                                    <tr>
                                    
                                    <td class = "birthofdate"><select name="day" id="dateofbirth">
                                        <option value="01" selected(초기 선택된 항목)>01</option>
                                        <option value="02">02</option>
                                        <option value="03">03</option>
                                        <option value="04">04</option>
                                       <option value="05">05</option>
                                       <option value="06">06</option>
                                       <option value="07">07</option>
                                       <option value="08">08</option>
                                       <option value="09">09</option>
                                       <option value="10">10</option>
                                       <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                       <option value="15">15</option>
                                       <option value="16">16</option>
                                       <option value="17">17</option>
                                       <option value="18">18</option>
                                       <option value="19">19</option>
                                       <option value="20">20</option>
                                       <option value="21">21</option>
                                       <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>
                                       <option value="25">25</option>
                                       <option value="26">26</option>
                                       <option value="27">27</option>
                                       <option value="28">28</option>
                                       <option value="29">29</option>
                                       <option value="30">30</option>
                                       <option value="31">31</option>
                                     </select> 일
                                    </td>
                                    
                                     <td class="birthofdate">
                                     <select name="month" id="dateofbirth">
                                        <option value="01" selected(초기 선택된 항목)>01</option>
                                        <option value="02">02</option>
                                        <option value="03">03</option>
                                        <option value="04">04</option>
                                       <option value="05">05</option>
                                       <option value="06">06</option>
                                       <option value="07">07</option>
                                       <option value="08">08</option>
                                       <option value="09">09</option>
                                       <option value="10">10</option>
                                       <option value="11">11</option>
                                       <option value="12">12</option>
                                    </select>월
                                </td>
                                    <td class ="birthofdate">
                                    <select name="year" id="dateofbirth">
                                        <option value="2000" selected(초기 선택된 항목)>2000</option>
                                        <option value="1999">1999</option>
                                        <option value="1998">1998</option>
                                        <option value="1997">1997</option>
                                       <option value="1996">1996</option>
                                       <option value="1995">1995</option>
                                       <option value="1994">1994</option>
                                       <option value="1993">1993</option>
                                       <option value="1992">1992</option>
                                       <option value="1991">1991</option>
                                       <option value="1990">1990</option>
                                       <option value="1989">1989</option>
                                    </select>년
                                    </td>
                                    
                          
        
    
                                </tr>

                                <tr>
                                    <td class="join_subject" name="gender">성별</td>
                                    </tr>
                                    <tr>
                                    <td> <input type="radio" id="join_gender"
                                        name="gender" value="W"> 여성
                                        <td>
                                        <input type="radio" id="join_gender"
                                        name="gender" value="M"> 남성
                                        </td>
                                 </td>
                            
                                </tr>

                                <tr>
                                    <td class="join_subject" name="nickname">닉네임</td>
                                    </tr>
                                    <tr>
                                    <td><input type="text" name="join_nickname" class="join_inputbox" placeholder="닉네임을 입력해주세요."></td>
                                </tr>

                                

                            </tbody>
                        </table>
                    
                    
                    </form>

                    <div>
                        <input type="button" name ="signupconfirm" class="signupConfirmed" value="SIGN NP">
                    </div>
        
                  </div>
            </div>

        </div>

      </div>
    </div>
    <!--//#content -->

    <div id="footer">
      <div id="policy">
        <h4 class="screen_out">정책 및 약관</h4>
        <ul>
          <li><a href="">회사소개</a></li>
          <!--
	 -->
          <li><a href="">광고</a></li>
          <!--
	 -->
          <li><a href="">검색등록</a></li>
          <!--
	 -->
          <li><a href="">제휴제안</a></li>
          <!--
	 -->
          <li><a href="">이용약관</a></li>
          <!--
	 -->
          <li>
            <a href=""><strong>개인정보이용약관</strong></a>
          </li>
          <!--
	 -->
          <li><a href="">청소년보호정책</a></li>
          <!--
	-->
          <li><a href="">고객센터</a></li>
        </ul>
      </div>
      <!--//policy -->
      <address>&copy; 2020 <a href="">NackEGG.com</a></address>
    </div>
    <!--//#footer -->
    <script src="../js/fix-footer.js"></script>
  </body>
</html>
