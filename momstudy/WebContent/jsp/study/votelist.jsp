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

<title>스터디</title>

<!-- jquery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

</head>
<body>
	<header id="header">
	
		<%--헤더 인클루드 --%>
	<%@include file="/jsp/common/header.jsp" %>
	
	</header>

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>스터디</h1>
			<p>--------------</p>
		</div>
	</section>


	<section id="layout">
		
		<%--사이드바 인클루드 --%>
		<%@include file="/jsp/common/sidebar.jsp" %>
		
		<div class="study_right_wrap">
			<div class="vote_title">
				<p>투표 하기</p>
				<div>
					<form action="" method="get">
					<button type="button" onclick="location.href='<c:url value="/study/votewriteform.do"/>'">투표등록</button>
					<input type="text" name="voteserach" /> <select name="vote"
						id="vote">
						<option value="1">제목</option>
						<option value="2">글쓴이</option>
					</select>
					<button>검색</button>
					</form>
				</div>
			</div>
			<div class="board_list">
				<ul>
					<li>번호</li>
					<li>제목</li>
					<li>마감날짜</li>
				</ul>
				<c:if test="${empty vlist}">
					<div>
						<h2>투표가 없습니다</h2>
					</div>
				</c:if>
				<c:forEach var="vote" items="${vlist}">
						<div>
						<c:if test="${vote.type eq 2}">
						<a href="<c:url value="/study/voteresult.do?num=${vote.num}"/>">
							<ul>
								<li>${vote.num}</li>
								<li>${vote.title}<span>(마감된 투표입니다.)</span></li>
								<li><fmt:formatDate value="${vote.limitDate}"
										pattern="yyyy-MM-dd" /></li>
							</ul>
						</a>
						</c:if>
						<c:if test="${vote.type eq 1}">
						<a href="<c:url value="/study/detailvote.do?num=${vote.num}"/>">
							<ul>
								<li>${vote.num}</li>
								<li>${vote.title}</li>
								<li><fmt:formatDate value="${vote.limitDate}"
										pattern="yyyy-MM-dd" /></li>
							</ul>
						</a>
						</c:if>
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