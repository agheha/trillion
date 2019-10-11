<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value="/css/header.css"/>">
<div class="header">
	<div class="header_top_wrap">
		<div>
			<a href='<c:url value="/main.do"></c:url>'>MomStudy</a>
		</div>
		<div>
			<ul>
				<c:choose>
					<c:when test="${empty user}">
						<li><a href='<c:url value="/user/loginform.do"></c:url>'>로그인</a></li>
						<li>/</li>
						<li><a href="<c:url value="/user/signupform.do"></c:url>">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a href='<c:url value="/user/logout.do"></c:url>'>로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<div class="header_bot_wrap">
		<div>
			<a href='<c:url value="/user/mypage.do" />'><span>마이페이지</span></a>
		</div>
		<div>
			<a href='<c:url value="/study/studyrecruitmentlist.do" />'>스터디</a>
		</div>
		<div>
			<a href="./notice_board.html">자유게시판</a>
		</div>
		<div>
			<a href='<c:url value="/review/list.do" />'>후기게시판</a>
		</div>
		<div>
			<a href="./inquire_board.html">문의하기</a>
		</div>
	</div>
</div>
