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
	<link rel="stylesheet" href="<c:url value="/css/find.css"/>">
	<link rel="stylesheet" href="<c:url value="/css/header.css"/>">
	
	<title>Document</title>
	

</head>
<body>
	
	<header id="header">
		<%@include file="/jsp/common/header.jsp"%>
	</header>
	
	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>계정관리</h1>
			<p>필수 항목은 꼭 적어주세요.</p>
		</div>
	</section>

	<c:if test="${param.result} eq 'fail'">

	</c:if>
	<fieldset>
		<div class="main">
			<div class="find">
				<div class="find-item">
					<div class="find-item-title">아이디 찾기</div>
					<div class="find-item-content">
						<div class="find-item-inputbox">
							<input id="iname" type="text" placeholder="이름" name="name">
						</div>
						<div class="find-item-inputbox">
							<input id="iphnum" type="text" placeholder="휴대폰" name="phnum">
						</div>

						<div id="emailmsg" class="find-item-msg">
							본인인증시 사용하였던 <br>휴대전화번호와 이름을 입력해주세요.
						</div>
						<button id="idbtn" class="find-item-button">아이디 찾기</button>
					</div>
				</div>
				<div class="find-item">
					<div class="find-item-title">비밀번호 찾기</div>
					<div class="find-item-content">
						<div class="find-item-inputbox">
							<input id="pname" type="text" placeholder="이름" name="name">
						</div>
						<div class="find-item-inputbox">
							<input id="pemail" type="email" placeholder="이메일" name="email">
						</div>
						<div id="passmsg" class="find-item-msg">본인인증 완료 후 가입 시 등록했던 <br>이메일로 인증메일을보내드립니다.</div>
						<button id="pbtn" class="find-item-button">비밀번호 찾기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- <div class="foot">Copyright © 2019 trillion. All rights
			reserved.</div> -->
	</fieldset>
	<script src="<c:url value="/script/user/userfindemail.js" />"></script>
	<script src="<c:url value="/script/user/userfindpass.js" />"></script>
</body>
</html>