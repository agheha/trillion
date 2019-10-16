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
				<div class="title" style="font-size: 20px; font-weight: bold;">스터디 신청내역</div>
				<form name="pForm" action="<c:url value="/user/delparticipant.do"/>"onsubmit="return check()">
					<table class="rwd-table">
						<tr>
							<th>스터디</th>
							<th>스터디장</th>
							<th>신청일</th>
							<th>진행상태</th>
							<th>철회</th>
						</tr>
						<c:choose>
						<c:when test="${empty parlist}">
							<tr>
							<td colspan="5" style="text-align: center">신청중인 스터디가 존재하지 않습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
						<c:forEach items="${parlist}" var="parlist" varStatus="i" >
						<tr>
							<td>${parlist.name}</td>
							<td>${parlist.email}</td>
							<td><fmt:formatDate value="${parlist.partDate}"
									pattern="yyyy-MM-dd" /></td>
							<td>신청중</td>
							<td>
								<div>
									<input name="cancell" id="cancell${i.count}" type="checkbox" value="${parlist.num}"/>
									<label for="cancell${i.count}">선택</label>
								</div>
							</td>
						</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</table>
					<button>확인</button>
				</form>
			</div>
		</div>
	</section>
	<script>
		function check() {
			let cancells = document.querySelectorAll("input[name='cancell']");
			let cnt = 0;
			cancells.forEach(e => {
				if (e.checked === true) cnt++
			})
			if (cnt === 0) {
				alert("선택된 스터디가 없습니다.")
			} else {
				alert("스터디가 철회되었습니다")
				document.pForm.submit();
			}
		}
	</script>
</body>
</html>