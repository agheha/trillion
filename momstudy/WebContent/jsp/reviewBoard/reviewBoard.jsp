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
	<link rel="stylesheet" href='<c:url value="/css/review_board.css" />'>
	<link rel="stylesheet" href='<c:url value="/css/layout.css" />'>

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
        integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<title>후기게시판</title>
</head>
<body>
	<header id="header">
		<%@include file="/jsp/common/header.jsp" %>
	</header>
 
    <!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
		<%--

		<jsp:include page="<%pageName%>" flush="false">
			<jsp:param name="name" value="<%=name%>" />
			<jsp:param name="pageName" value="<%=pageName%>"/>
		</jsp:include>

		--%>
    <section class="background_wrap">
        <div class="background">
            <h1>후기게시판</h1>
            <p>--------------</p>
        </div>
    </section>

	<section id="layout2">
	
        <div class="left_list">
        	<form action="<c:url value="/review/list.do" />"  method="GET" >
	            <ul>
	            	<c:forEach var="category" items="${category}">
		                <li>
		                	<button name="code" value="${category.categoryCode}" id="cate${category.categoryCode}">
		                		${category.categoryName}
		                	</button>
		                </li>
	                </c:forEach>
	            </ul>          
        	</form>
        </div>
	
	    <div class="board_cont_wrap">
		   	<div class="btn_wrap">
	   			<button type="button" id="onModal">등록</button>
		   	</div>
		   	
		   	
		   	<!-- 모달창 -->
		   	<div id="content" class="modal">
		   		<div>
					<form action="<c:url value="/review/writeForm.do" />" method="post" onsubmit="return studyChk()">
						<button type="button" id="close" class="close">
							<i class="fas fa-times"></i>
						</button>
						<p>등록하실 스터디를 선택하세요.</p>
						<c:if test="${empty slist}">
				       		<div class="emptyCont">작성 가능한 스터디가 없습니다.</div>
				       	</c:if>
				       	<c:forEach var="rb" items="${slist}" >
					      	<div class="board_cont">
								<input type="checkbox" class="checkbox" name="studyNum" value="${rb.num}" />
								<span>${rb.name}</span>
					      	</div>
				        </c:forEach>
				        <div class="mbtn_wrap">
					        <c:choose>
						        <c:when test="${empty slist}">
							        <!-- <button type="button" id="close">취소</button>	  -->       
						        </c:when>
						        <c:otherwise>
							        <button type="submit">선택</button>
						        </c:otherwise>
					        </c:choose>
			        	</div>
					</form>
		   		</div>
			</div>
		   	
		   	
		   	
		   	<div class="cont_wrap">
		       	<c:if test="${empty list}">
		       		<div class="emptyCont">게시물이 없습니다.</div>
		       	</c:if>
		       	<c:forEach var="rb" items="${list}">
			      	<div class="board_cont">
				        	<a href='<c:url value="/review/detail.do?num=${rb.num}" /> '>
				        	
				            <div class="cont_img">
				            	<c:choose>
				            		<c:when test="${empty rb.fileGroupCode}">
				            			<img src="<c:url value="/images/main_bg.jpg" />" alt="">
				            		</c:when>
				            		<c:otherwise>
		                             	<img src="<c:url value="/util/download.do?fgno=${rb.fileGroupCode}" />" alt="">
				            		</c:otherwise>
				            	</c:choose>
				            </div>
				           	<div class="cont_text">
				                <p>${rb.title}</p>
				                <span>${rb.content}</span>
				                <div class="boardInfo">
				                	<%-- <div>
										<span>작성자 : ${rb.email}</span>		            	
				                	</div> --%>
									<%-- <div>
						                <span>작성일 : <fmt:formatDate value="${rb.regDate}" pattern="yyyy-MM-dd" /></span>				                	
				                	</div> --%>
				                	<div>			                	
						                <span>조회수 : ${rb.seeCnt}</span>
						                <span>평점 : ${rb.score}</span>
				                	</div>
				            	</div>
				           	</div>
				       	</a>
			      	</div>
		        </c:forEach>
		   	</div>
	    	<%@include file="/jsp/common/pagination.jsp" %>
	    </div>
	</section>


    <script src="<c:url value='/script/review/reviewBoard.js' />"></script>
</body>
</html>