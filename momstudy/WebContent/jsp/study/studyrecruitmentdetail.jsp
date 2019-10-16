<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href='<c:url value="/css/common.css" /> '>
<link rel="stylesheet" href='<c:url value="/css/header.css" />'>
<link rel="stylesheet" href='<c:url value="/css/layout.css" />'>
<link rel="stylesheet" href='<c:url value="/css/study_layout.css" />'>
<link rel="stylesheet" href='<c:url value="/css/studyboard_detail.css" />'>
<link rel="stylesheet" href=`<c:url value="/css/signup_completed.css" />' > 

 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
    integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">

    
<title>스터디원 모집</title>
</head>
<body>
	<header id="header">
		<%@include file="/jsp/common/header.jsp"%>
	</header>

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>스터디</h1>
			<p>내게 맞는 스터디를 찾아보세요!</p>
		</div>
	</section>

	<section id="layout">
		<div class="study_right_wrap">
		
			<div class="board_title">
				<p>
					<c:out value="${str.title}" />
				</p>
				<div class ="top">
					<span>${str.email}</span> 
					<span><fmt:formatDate value="${str.regDate}" pattern="yyyy-MM-dd" /></span>
					<span style="width: 54px;">${str.seeCnt}</span>
				</div>
			</div>
			
			<!-- 이미지가 와야함 -->
			<div class="image_wrap">
           	   <c:if test="${file.groupCode != null}">
	               <img src="<c:url value="/util/download.do?fgno=${file.groupCode}" />"  />
           	   </c:if>
           </div>

			<div class="board_cont">
				<p>
					<c:out value="${str.content}" />
				</p>
			</div>
			
		   <!-- 비회원일 경우 버튼이 아예 생성되지 않음 -->
           <!-- 수정 삭제 버튼 => 작성자 본인, 관리자 일 때 -->
			<div class="buttons">
				<c:if test="${user.email == str.email || user.type == 0}">
					<button type="button">
						<a class="del" href='<c:url value="/study/studyrecruitmentupdateform.do?num=${str.num}" />'>수정</a>
					</button>
					<button type="button">
						<a class="del" href='<c:url value="/study/studyrecruitmentdelete.do?num=${str.num}" />'>삭제</a>
					</button>
					<span>
						<button type="button" id="report">신고하기</button>
					</span>
				</c:if>
           <!-- 신청하기 버튼 => 스터디원 이고, 로그인이 되어있는 상태에서만 활성화-->
				<c:if test="${user.email != str.email}">
				<!-- 참여한 적이 없는 사람만 활성화 -->
				<c:if test="${p_flag}">
					<button type="button" id="myBtn" >
						<a id="stdsign" href='#'>신청하기</a>
					</button>
				</c:if>
				</c:if>
			</div>
			<div class="buttons">
				<button type="button" id="golist"><a href='<c:url value="/study/studyrecruitmentlist.do"/>'>목록으로</a></button>
			</div>
		</div>
		
			<br>
			
			<!-- The Modal -->
			<div id="myModal" class="modal hidden">

				<!-- Modal content -->
				<div class="modal-content">
					<%@include file="/jsp/study/studysignup.jsp"%>
				</div>
			</div>

<script src="<c:url value="/script/study/studysignup.js"/>"></script>			
 		
</body>
</html>