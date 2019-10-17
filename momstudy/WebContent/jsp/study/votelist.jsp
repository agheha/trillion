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

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
		integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">

	<title>스터디</title>

	<!-- jquery -->
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

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

		<%@include file="/jsp/common/sidebar.jsp"%>

		<div class="study_right_wrap">
				<div class="vote_title">
					<div>
						<button class="oneBtn" type="button" id="addbtn">투표등록 </button> 
					</div>
				</div>
				<div class="board_list">
					<ul id="types">
						<li>번호</li>
						<li>제목</li>
						<li>작성날짜</li>
						<li>마감날짜</li>
						<li>상태</li>
					</ul>
					<c:if test="${empty vlist}">
						<div>
							<h2 class="emptyCont">투표가 없습니다</h2>
						</div>
					</c:if>
					<form name="vForm" action="" method="post">
						<input type="hidden" value="${vote.num}" name="num" id="inputEle" />
						<c:forEach var="vote" items="${vlist}">
							<div>
								<c:if test="${vote.type eq 2}">
									<a href="#" onclick="goResult(${vote.num});">
										<ul>
											<li>${vote.numbering}</li>
											<li>${vote.title}</li>
											<li>
												<fmt:formatDate value="${vote.regDate}" pattern="yyyy-MM-dd" />
											</li>
											<li>
												<fmt:formatDate value="${vote.limitDate}" pattern="yyyy-MM-dd" />
											</li>
											<li>마감</li>
										</ul>
									</a>
								</c:if>
								<c:if test="${vote.type eq 1}">
									<a href="#" onclick="goDetail(${vote.num});">
										<ul>
											<li>${vote.numbering}</li>
											<li>${vote.title}</li>
											<li>
												<fmt:formatDate value="${vote.regDate}" pattern="yyyy-MM-dd" />
											</li>
											<li>
												<fmt:formatDate value="${vote.limitDate}" pattern="yyyy-MM-dd" />
											</li>
											<li>진행중</li>
										</ul>
									</a>
								</c:if>
							</div>
						</c:forEach>
					</form>
				</div>

			<%@include file="/jsp/common/pagination.jsp" %>
		</div>

	</section>

	<script type="text/javascript">
		$(document).ready(function () {
			$("#header").load("header.html");
		});
		let lefts = screen.width/2 - 250;
		let tops = screen.height/2 - 200;
		console.log(lefts)
		console.log(tops)
		function goDetail(vnum) {
			let inputEle = document.querySelector("#inputEle");
			inputEle.value = vnum;
			let f = document.vForm;
			var gsWin = window.open('about:blank','vote','width=500,height=300,left='+lefts+',top='+tops+'')
			f.action = `<c:url value="/study/detailvote.do"/>`;
		    f.target ="vote";
		    f.method ="post";
			f.submit();
		}

		function goResult(vnum) {
			let inputEle = document.querySelector("#inputEle");
			inputEle.value = vnum;
			let f = document.vForm;
			var gsWin = window.open('about:blank','vote','width=500,height=300,left='+lefts+',top='+tops+'')
			f.action = `<c:url value="/study/voteresult.do"/>`;
			f.target ="vote";
		    f.method ="post";
			f.submit();
		}
		
		function addVote(){
			var gsWin = window.open('<c:url value="/study/votewriteform.do"/>','vote','width=500,height=300,left='+lefts+',top='+tops+'')
		}
		
		let addbtn = document.querySelector("#addbtn");
		addbtn.addEventListener("click",addVote);
	    </script>


</body>