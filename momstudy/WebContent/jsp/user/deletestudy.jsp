<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/css/layout.css"/>">
<link rel="stylesheet" href="<c:url value="/css/participant.css"/>">
<link rel="stylesheet" href="<c:url value="/css/study_layout.css"/>">

<title>계정관리</title>
<!-- full calendar -->
	
	
</head>
<body>

	
	
	<header id="header">
		<%@include file="/jsp/common/header.jsp"%>
	</header>

	<!-- The Modal -->


	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>계정관리</h1>
			<hr>
		</div>
	</section>


	<section id="layout">
		<%@include file="/jsp/common/userleftlist.jsp"%>
		<div class="heightAuto">
			<!-- 우측 상당 슬라이드 -->
			<div class="right_top_cont">
				<div class="title" style="font-size: 20px; font-weight: bold;">스터가 가입정보</div>
					<table class="rwd-table">
						<tr>
							<th>스터디</th>
							<th>스터디장</th>
							<th>개설일</th>
							<th>상태</th>
							<th>탈퇴</th>
						</tr>
						<c:choose>
						<c:when test="${empty parlist}">
							<tr>
							<td colspan="5" style="text-align: center">등록된 스터디가 존재하지 않습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
						<c:forEach items="${parlist}" var="parlist" varStatus="i" >
						<tr>
							<td>${parlist.name}</td>
							<td>${parlist.email}</td>
							<td><fmt:formatDate value="${parlist.partDate}"
									pattern="yyyy-MM-dd" /></td>
							<td>가입중</td>
							<td>
								<div>
									<button name="cancell" type="button" value="${parlist.num}">탈퇴</button>
								</div>
							</td>
						</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</table>
				</form>
			</div>
		</div>
	</section>
	<!-- The Modal -->
	<div id="myModal" class="modal hidden">

		<!-- Modal content -->
		<div class="modal-content">
			<%@include file="/jsp/user/deleteagree.jsp"%>
		</div>
	</div>
</body>
</html>