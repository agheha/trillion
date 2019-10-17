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

<link rel="stylesheet" href='<c:url value="/css/common.css" />'>
<link rel="stylesheet" href='<c:url value="/css/header.css" />'>
<link rel="stylesheet" href='<c:url value="/css/study_nlogin.css" />'>
<link rel="stylesheet" href='<c:url value="/css/recruitmentlist.css" />'>

<link rel="stylesheet" href='<c:url value="/css/searchtab.css"/>' >
<link rel="stylesheet" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- slide plugin -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/script/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/script/slick/slick-theme.css" />

<title>스터디원 모집</title>

<!-- jquery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
	src='<c:url value="/script/slick/slick.js" />'></script>
</head>
<body>
	<header id="header">
		<%@include file="/jsp/common/header.jsp"%>
	</header>

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>스터디</h1>
			<p>--------------</p>
		</div>
		
		<div class="left_list">
        	<form action="<c:url value="/study/studyrecruitmentlist.do" />"  method="GET" >
	            <ul>
	            	<c:forEach var="category" items="${cList}">
		                <li>
		                	<button name="code" value="${category.categoryCode}" id="cate${category.categoryCode}">
		                		${category.categoryName}
		                	</button>
		                </li>
	                </c:forEach>
	            </ul>          
        	</form>
        </div>
	</section>
		 

	<div class="board_cont_wrap">
	
		<!-- 서치바 인클루드 자리 -->
		<%@ include file="/jsp/common/searchtab.jsp" %>
		<div>
			<button id="myBtn" type="button">새로운 스터디 등록하기</button>
		</div>
		<div class="slide_wrap">
			<c:if test="${empty list}">
				<div>
					<h2>등록된 모집글이 없습니다.</h2>
				</div>
			</c:if>

			<!--  여기서 이미지는 등록글 작성시 등록한 이미지로 대체해주어야 한다!!! -->
			<c:forEach var="str" items="${list}">
				<a href="<c:url value="/study/studyrecruitmentdetail.do?num=${str.num}" />" 
				   class="content_wrap">
					<div class="imgbg">
						<div>
							<img src="<c:url value="/util/download.do?fgno=${str.fileGroupCode}" />" alt="">
						</div>
					</div>
					<div class="thumbnail">
						<img src="<c:url value="/util/download.do?fgno=${str.fileGroupCode}" />" alt="">
					</div>
					<div class="study_cont">
						<p>${str.title}</p>
						<div>
							<span>평점 ${str.avr} 점 / 후기 ${str.reviewCnt} 개</span> <span>회원 ${str.pCnt} 명</span>
						</div>
					</div>
				</a>
			</c:forEach>
			</form>

		</div>

		<div>
		<%@include file="/jsp/common/pagination.jsp"%>
		</div>
	</div>
	
	
	<!-- The Modal 스터디 등록부분-->
	<div id="myModal" class="modal hidden">

		<!-- Modal content -->
		<div class="modal-content">
			<%@include file="/jsp/study/studywriteform.jsp"%>
		</div>
	</div>
	
	<script src="<c:url value="/script/study/studysignup.js"/>"></script>	
	
</body>
</html>