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
<link rel="stylesheet" href='<c:url value="/css/memberinfo.css" />'>
<link rel="stylesheet" href='<c:url value="/css/studymanage.css" />'>

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
		<!-- jsp 작업 시 incluide로 변경 -->
		<%--사이드바 인클루드 --%>
		<%@include file="/jsp/common/sidebar.jsp"%>



		<div class="study_right_wrap">
			<div class="contents">
				<h3 class="stm_title">스터디원 목록</h3>
				<table class="study_member">
					<thead>
						<tr>
							<th>아이디</th>
							<th>나이</th>
							<th>별명</th>
							<th>성별</th>
							<th>가입일</th>
							<th>신고</th>
						</tr>
					</thead>
					<tbody class="stdmem_td">
						<c:forEach items="${ulist}" var="oneUser">
							<tr email="${oneUser.email}" name="${oneUser.name}"
								class="tr_row">
								<c:choose>
									<c:when test="${study.email eq oneUser.email}">
										<td class="study_leader"><span><i
												class="fas fa-crown"></i></span>${oneUser.email}</td>
									</c:when>
									<c:otherwise>
										<td>${oneUser.email}</td>
									</c:otherwise>
								</c:choose>
								<td><fmt:formatDate var="age" value="${oneUser.birth}"
										pattern="yyyy" /> ${year - age + 1}</td>
								<td>${oneUser.name }</td>
								<td>${oneUser.gender}</td>
								<td><fmt:formatDate value="${oneUser.partDate}"
										pattern="yyyy-MM-dd" /></td>
								<td ><button class="alertBtn" type="button" onclick="mopen()">
					<i class="fas fa-comment-slash"></i>
					신고하기
				</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<%@include file="/jsp/common/pagination.jsp"%>
		</div>
	</section>


	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<%@include file="/jsp/study/usercard.jsp"%>
		</div>

	</div>



	<script src="<c:url value="/script/study/studymembers.js"/>"></script>
</body>