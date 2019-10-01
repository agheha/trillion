<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href='<c:url value="/css/common.css" />'>
<link rel="stylesheet" href='<c:url value="/css/layout.css" />'>
<link rel="stylesheet" href='<c:url value="/css/study_layout.css" />'>
<link rel="stylesheet" href='<c:url value="/css/study.css" />'>
<link rel="stylesheet" href='<c:url value="/css/circle.css" />'>
<link rel="stylesheet" href='<c:url value="/css/header.css" />'>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">

<!-- full calendar -->
<link rel="stylesheet" type="text/css"
	href='<c:url value="/script/core/main.css" />' />
<link rel="stylesheet" type="text/css"
	href='<c:url value="/script/daygrid/main.css" />' />
<script type="text/javascript"
	src='<c:url value="/script/core/main.js" />'></script>
<script type="text/javascript"
	src='<c:url value="/script/daygrid/main.js" />'></script>

<title>스터디</title>

<!-- jquery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

</head>
<body>
	<header id="header">
		<%@include file="/jsp/common/header.jsp"%>
	</header>

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>스터디</h1>
			<p>--------------</p>
		</div>
	</section>

	<section id="layout">

		<%@include file="/jsp/common/sidebar.jsp"%>

		<div class="study_right_wrap">
			<div class="top_grid">

				<div class="study_main_cont d_day">
					<p>목표까지</p>
					<div>
						<h2>D - 30 day</h2>
					</div>
				</div>

				<div class="study_main_cont circle">
					<!-- 출석률 Animate UI -->
					<!-- 퍼센트가 변할 때마다 클래스명과 span 내부의 값을 바꾼다. -->
					<p>이번 달 나의 출석률</p>
					<div>
						<div class="clearfix">
							<div class="c100 p56 orange">
								<span>56%</span>
								<div class="slice">
									<div class="bar"></div>
									<div class="fill"></div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- // 출석률 Animate UI -->
				<div class="study_main_cont check">
					<p>출석 현황</p>
					<div></div>
				</div>
			</div>



			<div class="bottom_grid">

				<div class="study_main_cont notice">
					<p>공지사항</p>
					<div>
						<ul>
							<li><a href="#">TESTTESTTESTST</a></li>
							<li><a href="#">TESTTESTTESTST</a></li>
							<li><a href="#">TESTTESTTESTST</a></li>
							<li><a href="#">TESTTESTTESTST</a></li>
							<li><a href="#">TESTTESTTESTST</a></li>
							<li><a href="#">TESTTESTTESTST</a></li>
							<li><a href="#">TESTTESTTESTST</a></li>
							<li><a href="#">TESTTESTTESTST</a></li>
							<li><a href="#">TESTTESTTESTST</a></li>
							<li><a href="#">TESTTESTTESTST</a></li>

						</ul>
					</div>
				</div>

				<div class="study_main_cont calender">
					<p>Calender</p>
					<div id='calendar'></div>
				</div>
			</div>

		</div>
	</section>


	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');

			var calendar = new FullCalendar.Calendar(calendarEl, {
				plugins : [ 'dayGrid' ]
			});

			calendar.render();
		});
	</script>
</body>
</html>