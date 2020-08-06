<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>참고페이지</title>
</head>
<body>
<ul>
<c:forEach var="cardData" items="${cardDataMap }">
 <li>
 	<div>key: <c:out value="${cardData.key }"></c:out></div>
 	<div><c:out value="${cardData.value.totalCnt }"></c:out></div>
 </li>
</c:forEach>
</ul>
</body>
</html>