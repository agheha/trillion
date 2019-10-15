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
<link rel="stylesheet" href='<c:url value="/css/study_layout.css" />'>	
<link rel="stylesheet" href='<c:url value="/css/header.css" />'>
<link rel="stylesheet" href='<c:url value="/css/studyinfo.css" />'>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">

<title>스터디</title>

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
			<p class="contenttitle">스터디 정보</p>
			<hr class="contenthr"/>
			<div class="infocontent">
				<div class="item">
					<div class="iname"><span>스터디 이름</span></div>
					<div class="ivalue"><span>${studyinfo.name}</span></div>
				</div>
				<div class="item">
					<div class="iname"><span>스터디장</span></div>
					<div class="ivalue"><span>${studyinfo.email}</span></div>
				</div>
				<div class="item">
					<div class="iname"><span>카테고리</span></div>
					<div class="ivalue"><span>${studyinfo.category}</span></div>
				</div>
				<div class="item">
					<div class="iname"><span>지역</span></div>
					<div class="ivalue"><span>${studyinfo.address}</span></div>
				</div>
				<div class="item">
					<div class="iname"><span>스터디원 수</span></div>
					<div class="ivalue"><span>${studyinfo.member}명</span></div>
				</div>
				<div class="item">
					<div class="iname"><span>생성날짜</span></div>
					<div class="ivalue"><span><fmt:formatDate value="${studyinfo.regDate}" pattern="yyyy년 MM월 dd일"/></span></div>
				</div>
				<div class="item">
					<div class="iname"><span>모집글 여부</span></div>
					<c:choose>
						<c:when test="${studyinfo.chk == 0}">
							<div class="ivalue"><span>없음</span></div>
						</c:when>
						<c:when test="${studyinfo.chk == 1}">
							<div class="ivalue"><span>있음</span></div>
						</c:when>
					</c:choose>
				</div>
		
			</div>
		</div>
	</section>


</body>
</html>