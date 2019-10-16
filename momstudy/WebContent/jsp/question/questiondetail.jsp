<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.texta {
	width: 100%;
	resize: none;
	border: none;
	min-height: 50px;
	overflow: hidden;
}
</style>
<link rel="stylesheet" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/css/layout.css"/>">
<link rel="stylesheet" href="<c:url value="/css/questiondetail.css"/>">
<link rel="stylesheet"
	href='<c:url value="/css/studyboard_detail.css" />'>
<link rel="stylesheet" href='<c:url value="/css/comment.css" />'>
<!-- 답변 댓글 내용 뿌려줌.css -->
<link rel="stylesheet" href='<c:url value="/css/admin_Qcomment.css" />'>
</head>
<body>
	<header id="header">
		<%@include file="/jsp/common/header.jsp"%>
	</header>

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>스터디</h1>
		</div>
	</section>

	<section id="layout">

		<div class="study_right_wrap">
			<div class="board_title">
				<p>
					<c:out value="${question.title}" />
				</p>
				<div class="top">
					<span>${question.email}</span> <span><fmt:formatDate
							value="${question.regDate}" pattern="yyyy-MM-dd" /></span>
				</div>
			</div>

			<div class="board_cont">
				<p>
					<c:out value="${question.content}" />
				</p>
			</div>

			<!-- 수정 삭제 버튼 -->
			<div class="buttons">
				<span id="agreebtn">
					<button type="button" id="updatequestion">수정</button>
				</span>
				<button type="button" id="deletequestion">삭제</button>
				<button type="button">
					<a class="del" href="<c:url value="/question/questionform.do"/>">목록</a>
				</button>
			</div>
			<br>
		</div>

		<!-- 답변댓글 내용 뿌려줌 -->
		<div id="Qcomment">
			<c:forEach var="comment" items="${comment}">
				<div id="Qcemail">
					<p>질문주신 <c:out value="${question.title}" />에 (
						<c:out value="${comment.email}" />
						) 가 답변드립니다.
					</p>
					<div>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${comment.regDate}" />
					</div>
				</div>

				<div id="Qccontent">
					<h3>답변 내용</h3>
					<div>${comment.content}</div>
				</div>
			</c:forEach>
		</div>

	</section>
	<script>
		function resize(obj) {
			obj.style.height="1px";
			obj.style.height = (12+obj.scrollHeight) + "px";
		}
		let upque = document.querySelector("#updatequestion");
		upque.addEventListener("click", () => {
			let agreebtn = document.querySelector("#agreebtn");
			agreebtn.innerHTML = "<button type='button' id='agbtn'>확인</button>"
			let content = document.querySelector(".board_cont");
			content.innerHTML = "<textarea onkeydown='resize(this)' onkeyup='resize(this)' id='uptext'>${question.content}</textarea>"
			let uptext = document.querySelector("#uptext")
			uptext.focus();
			uptext.classList.add("texta")
		})
	</script>
</body>
</html>