<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href='<c:url value="/css/common.css" />'>
<link rel="stylesheet" href='<c:url value="/css/layout.css" />'>
<link rel="stylesheet" href='<c:url value="/css/header.css" />'>
<link rel="stylesheet" href='<c:url value="/css/study_layout.css" />'>
<link rel="stylesheet" href='<c:url value="/css/studyvote.css" />'>
<!-- <link rel="stylesheet" href="./../css/studymanage.css">     -->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">

<title>���͵�</title>

<!-- jquery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

</head>
<body>
	<header id="header"></header>

	<!-- ������������ background�� �ٲ��� �ϴ� ó�� �ʿ� -->
	<section class="background_wrap">
		<div class="background">
			<h1>���͵�</h1>
			<p>--------------</p>
		</div>
	</section>

	<section id="layout">

		<!-- jsp �۾� �� incluide�� ���� -->
		<div>
			<div class="profile">
				<img src="<c:url value="/images/test_img2.jpg" />" alt="testImg">
			</div>
			<div class="left_list">
				<div>
					<p>
						<a href="./study.html">���͵��</a>
					</p>
					<ul>
						<!-- ���͵��� ȭ�� �ٸ��� ���� -->
						<li><a href="./studymembers.html">���</a></li>
						<li><a href="./studyvote.html">��ǥ</a></li>
						<li><a href="./studyschedule.html">����</a></li>
						<li><a href="./studyboard.html">�Խ���</a></li>
					</ul>
				</div>
			</div>
		</div>


		<div class="study_right_wrap">
			<div class="vote_title">
				<p>��ǥ �ϱ�</p>
				<div>
					<input type="text" name="voteserach" /> <select name="vote"
						id="vote">
						<option value="1">����</option>
						<option value="1">����</option>
						<option value="1">�۾���</option>
					</select>
					<button>��ǥ���</button>
				</div>
			</div>
			<div class="board_list">
				<c:if test="${empty vlist}">
					<div>
						<h2>��ǥ�� �����ϴ�</h2>
					</div>
				</c:if>
				<c:forEach var="vote" items="${vlist}">
					<div>
						<a href="#">
							<ul>
								<li><a href="<c:url value="/study/detailVote.do?num=${vote.num}"/>">${vote.num}</a></li>
								<li>${vote.title}</li>
								<li><fmt:formatDate value="${vote.limitDate}"
										pattern="yyyy-MM-dd" /></li>
							</ul>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("header.html");
		});
	</script>
</body>