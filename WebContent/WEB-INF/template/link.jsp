<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/vanilla-stock/css/reset.css" />
<link rel="stylesheet" href="/vanilla-stock/css/kakao.font.css" />
<link rel="stylesheet" href="/vanilla-stock/css/default.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<script src="/vanilla-stock/js/jquery.js"></script>
<script src="/vanilla-stock/js/underscore-min.js"></script>
<script src="/vanilla-stock/js/moment-with-locales.js"></script>
<script src="/vanilla-stock/js/highcharts.js"></script>
<script src="/vanilla-stock/js/dark-unica.js"></script>
<script src="/vanilla-stock/js/histogram-bellcurve.js"></script>
<script>
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
//한국시간으로 변경 
moment.locale("ko"); 
 	
 </script>