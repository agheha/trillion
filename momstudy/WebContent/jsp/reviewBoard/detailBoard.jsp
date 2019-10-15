<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

	<link rel="stylesheet" href='<c:url value="/css/common.css" />'>
	<link rel="stylesheet" href='<c:url value="/css/header.css" />'>
    <link rel="stylesheet" href='<c:url value="/css/layout.css" />'>
    <link rel="stylesheet" href='<c:url value="/css/study_layout.css" />'>
    <link rel="stylesheet" href='<c:url value="/css/studyboard_detail.css" />'>

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

       <div class="study_right_wrap">
           <div class="board_title">
               <p>${rBoard.title}</p>
               <div>
                   <span>작성자 : ${rBoard.email}</span>
                   <span>작성일 : <fmt:formatDate value="${rBoard.regDate}" pattern="yyyy-MM-dd" /></span>
               	   <span>평점: ${rBoard.score}</span>
               </div>
           </div>
		
		<!-- 추후 이미지 -->
           <div class="image_wrap">
           	   <c:if test="${file.groupCode != null}">
	               <img src="<c:url value="/util/download.do?fgno=${file.groupCode}" />"  />
           	   </c:if>
           </div>
   
           <div class="board_cont">
               ${rBoard.content}
               
               <form action="" method="post" name="rpform">
					<button class="alertBtn">
						<i class="fas fa-user-slash"></i>
						신고하기
					</button>
	      	   </form>
           </div>


           <div class="buttons">
	           <c:choose>
			        <c:when test="${rBoard.email == user.email}">
				        <button type="button" onclick="location.href='<c:url value="/review/updateForm.do?num=${rBoard.num}"/>' ">수정</button>
		                <button type="button" onclick="location.href='<c:url value="/review/delete.do?num=${rBoard.num}"/>' ">삭제</button>
			        </c:when>
			        <c:otherwise>
				        <button type="button" onclick="location.href='<c:url value="/review/list.do"/>' ">게시판으로 이동</button>
			        </c:otherwise>
	      	   </c:choose>
           </div>

			<!-- 댓글 영역 -->
			<div id="comment_Wrap">
				<div id="commentRegistForm">
					<form name="crForm" method="post" action="commentWrite.do" onsubmit="return commentRegistAjax()" >
						<input type="hidden" name="num" value="${rBoard.num}" />
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
		let num = ${rBoard.num}
	</script>
    <script src="<c:url value='/script/review/commentReview.js' />"></script>

</body>
</html>