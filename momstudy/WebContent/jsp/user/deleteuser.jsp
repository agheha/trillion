<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/css/layout.css"/>">
<link rel="stylesheet" href="<c:url value="/css/deleteuser.css"/>">
<link rel="stylesheet" href="<c:url value="/css/study_layout.css"/>">
<link rel="stylesheet" href="<c:url value="/css/usermodal.css"/>">
<title>회원탈퇴</title>
<!-- full calendar -->



</head>
<body>

	<header id="header">
		<%@include file="/jsp/common/header.jsp"%>
	</header>

	<%@include file="/jsp/common/usermodal.jsp"%>
	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>계정관리</h1>
			<hr>
		</div>
	</section>

	<section id="layout">

		<div class="left_list">
			<div>
				<div class="profile">
					<img src="<c:url value="/images/test_img2.jpg"/>" width="200"
						height="200" alt="testImg">
				</div>
				<div>
					<input type="file" id="file" name="file" onchange="changeValue(this)"
					style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;"/>
					<button type="button" id="btn-upload">이미지수정</button>
				</div>
				<ul>
					<li><span id="passUpdate">비밀번호 변경</span></li>
					<li><span id="userDelete">회원탈퇴</span></li>
				</ul>
			</div>
		</div>

		<div class="heightAuto">
			<!-- 우측 상당 슬라이드 -->
			<div class="right_top_cont">
				<div class="title">회원탈퇴</div>
				<div>
					<div class="slide_wrap">
						<div>
							<div class="subtitle">현재 비밀번호</div>
							<input id="pass" class="inputbox" type="password" name="pass1"
								autocomplete="off" />
						</div>
						<div id="msg" style="color: red; display: none">비밀번호가 일치하지
							않습니다.</div>
						<div>
							<p>맘스터디 회원을 탈퇴하시겠습니까?</p>
						</div>
						<div>
							<button id="chkbtn" type="button" class="submit_btn">확인</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 달력부분 -->
		</div>
	</section>
	<script src="<c:url value="/script/user/usermodal.js" />"></script>
	<script src="<c:url value="/script/user/deleteuser.js" />"></script>
</body>
</html>