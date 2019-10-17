<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href="<c:url value="/css/deletestudy.css"/>">

<title>계정관리</title>
<!-- full calendar -->

</head>
<body>
	<div class="heightAuto hidden">
		<!-- 우측 상당 슬라이드 -->
		<div class="right_top_cont" id="partlist"></div>
		<table class='rwd-table'></table>
	</div>
	<!-- The Modal -->
	<div id="myModal" class="modal hidden">
		<!-- Modal content -->
		<div class="modal-content" id="myBtn">
			<%@include file="/jsp/user/deleteagree.jsp"%>
		</div>
	</div>
</body>
</html>