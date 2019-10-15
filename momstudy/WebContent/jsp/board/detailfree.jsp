<%@page import="kr.co.momstudy.repository.vo.Comment"%>
<%@page import="java.util.List"%>
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

<link rel="stylesheet" href='<c:url value="/css/common.css" /> '>
<link rel="stylesheet" href='<c:url value="/css/header.css" />'>
<link rel="stylesheet" href='<c:url value="/css/layout.css" />'>
<link rel="stylesheet" href='<c:url value="/css/study_layout.css" />'>
<link rel="stylesheet" href='<c:url value="/css/studyboard_detail.css" />'>


<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">


<!-- jquery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>


</head>
<body>
	<header id="header">
		<%@include file="/jsp/common/header.jsp"%>
	</header>

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>자유게시판</h1>
			<p>ㅎㅇ</p>
		</div>
	</section>

	<section id="layout">
		<div class="study_right_wrap">
			<div class="board_title">
				<p><c:out value="${board.title}" /></p>
			</div>
			<div class="boardInfo">
				<span>작성자 : ${board.email}</span> 
				<span>작성일 : <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" /></span>
				<span>조회수 : ${board.seeCnt}</span>
			</div>

			<div class="board_cont" style="padding-top: 50px;">
				${board.content}
				<button class="alertBtn">
					<i class="fas fa-user-slash"></i>
					신고하기
				</button>
			</div>
				
			  <div class="buttons">
	           <c:choose>
			        <c:when test="${board.email == user.email}">
				        <button type="button" onclick="location.href='<c:url value="/boardfree/freeupdateForm.do?num=${board.num}"/>' ">수정</button>
		                <button type="button" onclick="location.href='<c:url value="/boardfree/freedelete.do?num=${board.num}"/>' ">삭제</button>
			        </c:when>
			        <c:otherwise>
				        <button type="button" onclick="location.href='<c:url value="/boardfree/freelist.do"/>' ">목록</button>
			        </c:otherwise>
	      	   </c:choose>
           </div>
			
			   <!--  댓글 -->
		 	<div id="comment_Wrap">
				<div id="commentRegistForm">
					<form name="crForm" method="post" action="freecommentWrite.do" onsubmit="return commentRegistAjax()" >
						
						<input type="hidden" name="num" value="${board.num}" />
						<input id="user" type="hidden" name="email" value="${user.email}" />
						<div>
							<textarea name="content"></textarea>
						</div>
						<div>
							<button type="submit">등록</button>
						</div>
				    	</form>
				  </div>
				<div id="commentList"></div>
			</div>
       </div>
	</section>
	
	<script>
		let num = ${board.num}
	</script>

	<script type="text/javascript"  src="<c:url value="/script/board/detailboard.js" />"></script>
	
</body>
</html>