<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href='<c:url value="/css/studyvote.css" />'>

        <link rel="stylesheet" 
              href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
              integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" 
              crossorigin="anonymous">
        <link rel="stylesheet" 
              href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">

        <title>스터디</title>

        <!-- jquery -->
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<style>
   .red * {
	color: #fe6872 !important;
  }
  .board_list li:nth-child(1) {
    width: 90px;
}
.noticeback {
	padding: 1px 5px;
	background: pink;
	border: solid 1px #a2a2a2;
	border-radius: 4px;
}

</style>

</head>
    
    <body>
        <header id="header">
        <%@include file="/jsp/common/header.jsp" %>
        </header>

        <!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
        <section class="background_wrap">
            <div class="background">
                <h1>자유게시판</h1>
                <p>2019년 10월11일 11시 04분</p>
            </div>
        </section>

        <section id="layout">
           
            <div class="study_right_wrap">
                <div class="vote_title">
                    <p>자유 게시판</p>
                    <div>
                        <button type="button" onclick="location.href='<c:url value="/boardfree/freewriteform.do"/>'">글등록</button>
                    </div>
                </div>
                	<div class="board_list">
					<ul id="types">
						<li>번호</li>
						<li>제목</li>
						<li>이메일</li>
						<li>날짜</li>
						<li>조회수</li>
					</ul>
                <!--  <div class="board_list"> -->
                         <c:if test="${empty list}">
                           <div>
                              <h2>게시글이 없습니다.</h2>
                           </div>
                        </c:if>
                        <c:forEach var="b" items="${list}">
                        <c:choose>
							<c:when test="${b.type == 0 && b.notice == 0}">
								<div class="red">
									<a href="<c:url value="/boardfree/freedetail.do?no=${b.num}" />"  >
										<ul>
											<li><span class="noticeback">공지</span></li>
											<li>${b.title}</li>
											<li>${b.email}</li>
											<li><fmt:formatDate pattern="yyyy-MM-dd"
													value="${b.regDate}" /></li>
											<li>${b.seeCnt}</li>
										</ul>
									</a>
								</div>
							</c:when>
									<c:when test="${b.type == 0}">
								<div class="red">
									<a href="<c:url value="/boardfree/freedetail.do?no=${b.num}" />"  >
										<ul>
											<li><span class="noticeback">공지</span></li>
											<li>${b.title}</li>
											<li>${b.email}</li>
											<li><fmt:formatDate pattern="yyyy-MM-dd"
													value="${b.regDate}" /></li>
											<li>${b.seeCnt}</li>
										</ul>
									</a>
								</div>
							</c:when>
							<c:otherwise>
							<div>
								<a href="<c:url value="/boardfree/freedetail.do?no=${b.num}" />">
									<ul>
										<li>${b.numbering}</li>
										<li>${b.title}</li>
										<li>${b.email}</li>
										<li><fmt:formatDate pattern="yyyy-MM-dd"
												value="${b.regDate}" /></li>
										<li>${b.seeCnt}</li>
									</ul>
								</a>
							</div>
						</c:otherwise>
                        </c:choose>
                        </c:forEach>
                    </div>
                     <%@include file="/jsp/common/pagination.jsp" %>  
                 </div>
        </section>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#header").load("header.html");
            });
        </script>
    </body>
</html>