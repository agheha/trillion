<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/css/question.css"/>">
<link rel="stylesheet" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/css/layout.css"/>">
</head>
<body>
	
	<header id="header">
		<%@include file="/jsp/common/header.jsp"%>
	</header>
	
	<section class="background_wrap">
		<div class="background">
			<h1>문의게시판</h1>
			<p>문의게시판 입니다.</p>
		</div>
	</section>
	
	<section id="layout">
	</section>
	<div id="demo">
		<div style="text-align: right; padding : 10px 5px">
			<button type="button" id="wrtbtn" class="oneBtn">문의글 작성하기</button>	
		</div>

		<!-- Responsive table starts here -->
		<!-- For correct display on small screens you must add 'data-title' to each 'td' in your table -->
		<div class="table-responsive-vertical shadow-z-1">
			<!-- Table starts here -->
			<table id="table" class="table table-hover table-mc-light-blue">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty quelist}">
							<td colspan="4" style="text-align: center">문의 내역이 없습니다</td>
						</c:when>
						<c:otherwise>
							<c:forEach var="que" items="${quelist}">
								<tr onclick="showlist(${que.num})">
									<td data-title="ID">${que.numbering}</td>
									<td data-title="Name">${que.title}</td>
									<td data-title="Link"><fmt:formatDate
											value="${que.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<c:choose>
									<c:when test="${que.condition eq 2}">
										<td data-title="Status">답변완료</td>
									</c:when>
									<c:otherwise>
										<td data-title="Status">대기중</td>
									</c:otherwise>
									</c:choose>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	<%@include file="/jsp/common/pagination.jsp"%>
	<%@include file="/jsp/question/questionwrite.jsp"%>
	<script src="<c:url value="/script/question/question.js" />"></script>

</body>
</html>
