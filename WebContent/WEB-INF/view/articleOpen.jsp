<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title></title>
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/kakao.font.css" />
    <link rel="stylesheet" href="../css/default.css" />
    <link rel="stylesheet" href="../css/articleOpen.css" />
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
        background-color: red;
      }
    </style>
  </head>
  <body>
    <div class="articleOpenform">
      <div class="articleOpenTitle">
        <span class="articleCName">회사 </span>
        <select name="회사" class="articleCompanyOption">
          <option value="" selected="selected">회사선택</option>
          <option value="학생">학생</option>
          <option value="회사원">회사원</option>
          <option value="기타">기타</option>
        </select>
      </div>
      <div class="articleOpenTitle">
        <span class="articleName">투기장명</span>
        <input
          type="text"
          placeholder="투기장명을 입력하세요."
          name="title"
          class="openTitle"
        />
      </div>

      <div class="openConfirmed">
        OPEN
      </div>
    </div>
  </body>
</html>
