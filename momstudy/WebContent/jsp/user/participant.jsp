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
				<div class="title">스터디 신청내역</div>
				<form name="pForm" action="" onsubmit="parUpdate()">
					<table class="rwd-table">
						<tr>
							<th>스터디</th>
							<th>스터디장</th>
							<th>신청일</th>
							<th>진행상태</th>
							<th>철회</th>
						</tr>
						<c:forEach items="${parlist}" var="parlist">
							<td>${parlist.name}</td>
							<td>${parlist.email}</td>
							<td><fmt:formatDate value="${parlist.partDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>신청중</td>
							<td>
								<div>
									<input name="cancell" id="cancell" type="checkbox" value="${parlist.num}"/>
									<label for="cancell">취소</label>
								</div>
							</td>
						</c:forEach>
					</table>
					<button>수정하기</button>
				</form>
			</div>
		</div>
	</section>
	<script>
		function parUpdate() {
			let cancells = querySelectorAll("input[name='cancell']")
			let chlist = new Array();
			let cnt;
			let xhr = XMLHttpRequest();
			xhr.onreadystatechange = e => {
				if(xhr.readyState === 4) {
					if(xhr.status === 200) {
						cancells.forEach(ele => {
							if(ele.checked == true) {
								chlist.add(ele.value);
								cnt++;
							}
							if (cnt == 0) {
								alert("체크된 내역을 찾을수 없습니다.")
							}
						})
					}
				}
				xhr.open("GET","delparticipant.do?chk="+chlist)
				xhr.send()
			}
		}
	</script>
</body>
</html>