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



<title>계정관리</title>
<!-- full calendar -->

</head>
<body>
	<div class="heightAuto hidden">
		<div class="right_top_cont" id="partlist"></div>
		<table class='rwd-table'></table>
	</div>
	<!-- The Modal -->
	<div id="myModal" class="msgmodal hidden">
		<!-- Modal content -->
		<div class="msgcontent" id="myBtn"></div>
		<div id="loadingdelmsg">
			<input type="hidden" name="stdnum" value="${str.studyNum}" />
			<div id="que">스터디를 탈퇴하시겠습니까?</div>
			<br />
			<button type="button" id="signup" onclick="agree()">확인</button>
			<button class="closer" id="closecell">취소</button>
		</div>
	</div>
</body>
</html>