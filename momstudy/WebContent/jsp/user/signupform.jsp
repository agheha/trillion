<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<!-- css -->
<link rel="stylesheet" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/css/header.css"/>">
<link rel="stylesheet" href="<c:url value="/css/signup.css"/>">

<!-- jquery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<title>Login</title>
</head>
<body>

	<header id="header"></header>

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>회원가입</h1>
			<p>필수 항목은 꼭 적어주세요.</p>
		</div>
	</section>

	<!-- 아이디 및 비밀번호를 잘못 입력 시 -->
	<!-- 오류를 띄워주는 영역이 추가될 예정 -->
	<section>
		<form action="<c:url value="/user/signup.do"/>" method="post">
			<div class="fieldset">
				<p>이메일</p>
				<input class="user_id" type="email" name="email">

				<p>비밀번호</p>
				<input type="password" name="pass1">

				<p>비밀번호 재확인</p>
				<input type="password" name="pass2">

				<p>이름</p>
				<input type="text" name="name">
				<p>생년월일</p>
				<div class="select_wrap">
					<select id="birth_year" name="year">
						<c:forEach var="year" begin="1950" end="2018">
							<option value="${year}">${year}</option>
						</c:forEach>
						<option value="2019" selected>2019</option>
					</select> <select id="birth_month" name="month">
						<option value="1" selected>1</option>
						<c:forEach var="month" begin="2" end="12">
							<option value="${month}">${month}</option>
						</c:forEach>
					</select> <select id="birth_date" name="date">
						<option value="1" selected>1</option>
						<c:forEach var="date" begin="2" end="31">
							<option value="${date}">${date}</option>
						</c:forEach>
					</select>
				</div>
				<p>성별</p>
				<select id="gender" name="gender">
					<option value="man">남자</option>
					<option value="woman">여자</option>
					<option value="0" selected>성별</option>
				</select>
				<p>휴대전화</p>
				<input type="text" name="phnum" placeholder="- 은 제외">

				<p>관심있는 카테고리</p>
				<div class="category_wrap">
					<ul>
						<c:forEach items="${cateList}" var="category">
							<li><input id="it" type="checkbox" name="category"
								value="${category.categoryCode}"/> <label for="it">${category.categoryName}</label>
							</li>
						</c:forEach>
					</ul>
				</div>
				<button>등록</button>
<!-- 				<input type="button" class="login_submit_btn" value="등록" /> -->
			</div>
		</form>
	</section>


	<script type="text/javascript">
		$(document).ready(function() {

			// header 불러오기
			$("#header").load("header.html");

			// category_wrap & fieldset height 맞추기
			// var heightArray = $(".fieldset").map(function(){
			//     return $(this).height();
			// }).get();
			// var maxHeight = Math.max.apply(Math, heightArray);
			// $(".fieldset").height(maxHeight);
		});
	</script>
</body>
</html>