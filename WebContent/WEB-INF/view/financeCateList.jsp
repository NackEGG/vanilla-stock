<%@page import="com.fasterxml.jackson.core.JsonParser.Feature"%>
<%@page import="com.fasterxml.jackson.databind.DeserializationFeature"%>
<%@page import="java.io.File"%>
<%@page import="com.fasterxml.jackson.databind.type.TypeFactory"%>
<%@page import="com.vs.vo.FinanceCateVO"%>
<%@page import="com.fasterxml.jackson.core.type.TypeReference"%>
<%@page import="java.net.URL"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


</style>
</head>
<body>
	<h1> 항목종목 전부 보기</h1>

	<table border="1">
	<thead>
		<tr>
			<th>sj_div</th>
			<th>account_id</th>
			<th>account_nm</th>
			<th>bsns_de</th>
			<th>label_kor</th>
			<th>label_eng</th>
		</tr>
				
	</thead>
	<tbody>
		<c:forEach items="${allList }" var="cate">
		<tr>
			<td>${cate.sjDiv } </td>
			<td>${cate.accountId } </td>
			<td>${cate.accountNm } </td>
			<td>${cate.bsnsDe } </td>
			<td>${cate.labelKor } </td>
			<td>${cate.labelEng } </td>
		</tr>
		
		</c:forEach>

	<tbody>

</table>
	
</body>
</html>