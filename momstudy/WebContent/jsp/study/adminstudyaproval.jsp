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
				<form action="studyaprovalmember.do" method="post" name="aprovalform">
				<h3 class="stm_title">스터디 신청자 목록</h3>
				<div class="smt_buttons">
					<button class="stm_button">승인</button>
				</div>
					<table class="study_member">
						<thead>
							<tr>
								<th>아이디</th>
								<th>나이</th>
								<th>별명</th>
								<th>성별</th>
								<th>가입일</th>
								<th>체크</th>
							</tr>
						</thead>
						<tbody class="stdmem_td">
						<c:if test="${empty ulist}">
							<td colspan="6"><h3>신청자가 없습니다.</h3></td>
						</c:if>
							<c:forEach items="${ulist}" var="oneUser" varStatus="i">
								<tr class="tr_row">
									<c:choose>
										<c:when test="${user.email eq oneUser.email}">
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
									<td><input type="checkbox" name="ban${i.index}"
										value="${oneUser.email}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
			<%@include file="/jsp/common/pagination.jsp"%>
		</div>
	</section>


	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<p>회원 사진</p>
			<p>이메일</p>
			<p>평점</p>
			<p>가입목록</p>
		</div>

	</div>

	<script>
	
		let aprovalform = document.aprovalForm;
		let aprovalbtn = document.querySelector(".stm_button");
		aprovalbtn.addEventListener('click',()=>{
			aprovalform.submit();
		})
	
		// Get the modal
		var modal = document.getElementById("myModal");

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	<script type="text/javascript">
			// add event listener
			// get elements
			let dataRows = document.getElementsByClassName('tr_row');

			// make func
			function onClickModal() {
				var modal = document.getElementById("myModal");

				// Get the modal
				var modal = document.getElementById("myModal");

				// Get the <span> element that closes the modal
				var span = document.getElementsByClassName("close")[0];

				// When the user clicks on <span> (x), close the modal
				span.onclick = function() {
					modal.style.display = "none";
				}

				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
					if (event.target == modal) {
						modal.style.display = "none";
					}
				}
				modal.style.display = "block";

				// 클릭한 row 의 id 값 참조해서 데이터 주입하는 작업
				// ajax 사용하거나 이미 가져온 데이터 활용하거나 선택
			}

			// add event listener
			for (let i = 0; i < dataRows.length; i++) {
				dataRows[i].addEventListener('click', onClickModal, false);
			}
		
	</script>
</body>