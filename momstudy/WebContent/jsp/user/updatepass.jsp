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
<link rel="stylesheet" href="<c:url value="/css/updatepass.css"/>">

<title>비밀번호 변경</title>
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
					<button>이미지수정</button>
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
				<div class="title">비밀번호 변경</div>
				<div>
					<div class="slide_wrap">
						<form name="pForm" action="<c:url value='/user/updatepass.do' />"
							method="post" onsubmit="return chkpass()">
							<div>
								<div class="subtitle">변경 비밀번호</div>
								<input class="inputbox" type="text" name="pass1"
									autocomplete="off" />
							</div>
							<div>
								<div class="subtitle">비밀번호 확인</div>
								<input class="inputbox" type="text" name="pass2"
									autocomplete="off" /> <span class="alert_wrap">비밀번호가
									일치하지 않습니다.</span>
							</div>
							<div>
								<button class="submit_btn">확인</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- 달력부분 -->
		</div>
	</section>

	<script type="text/javascript">
		function chkpass() {
			let passRules = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

			let f = document.pForm
			if (f.pass1.value !== f.pass2.value) {
				alert("비밀번호가 일치하지 않습니다.")
				return false;	
			}
			if (f.pass1.value.length < 8 || f.pass1.value.length > 16 ) {
				alert("비밀번호는 8자리이상 16자리미만 입니다.")
				return false;
			}
			alert("비밀번호 변경이 완료되었습니다")
			return true;
		}
		
		
	</script>
	<script src="<c:url value="/script/user/usermodal.js" />"></script>
</body>
</html>