<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<script src=""></script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<script src="<c:url value='/script/user/terms.js' />"></script>
<!-- css -->
<link rel="stylesheet" href="./../css/common.css">
<link rel="stylesheet" href="./../css/terms.css">

<!-- jquery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<title>terms</title>
</head>
<body>
	<header id="header"></header>

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>회원가입</h1>
			<p>약관에 동의해 주세요.</p>
		</div>
	</section>


	<section>
		<div class="main">
			<form name="sForm" action="<c:url value='/user/signupform.do'/>" onsubmit="return doAction()">
				<div class="form_layout">
					<div>
						<div class="form-item-checkbox">
							 <input class="check" type="checkbox" name="menu">
							<label>
								서비스 이용약관 동의 (필수)
							</label>
						</div>
						<div class="form-item-box"></div>
						<span class="alert_wrap">이용약관은 필수로 체크 되어야 할 사항입니다.</span>
					</div>
					<div>
						<div class="form-item-checkbox">
							<input class="check" type="checkbox" name="menu">
							<label> 
								개인정보보호를 위한 이용자 동의 (필수)
							</label>
						</div>
						<div class="form-item-box"></div>
						<span class="alert_wrap">개인정보보호는 필수로 체크 되어야 할 사항입니다.</span>
					</div>
				</div>
				<div class="form-item-checkbox">
					 <input class="check" type="checkbox" name="menu">
					<label>
						만 14세 이상입니다. (필수)
						
					</label>
					<span class="alert_wrap">나이제한은 필수로 체크 되어야 할 사항입니다.</span>
				</div>
				<div class="form-item-all">
					<input class="checkall" type="checkbox" id="chkall" onclick="doCheck()" name="chkAll">
					<label for="chkAll"> 전체동의하기 </label>
				</div>
				<div class="form-item-btn">
					<button class="submit_btn">다음</button>
				</div>
			</form>
		</div>
	</section>


	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("header.html");
		});
	</script>
</body>
</html>