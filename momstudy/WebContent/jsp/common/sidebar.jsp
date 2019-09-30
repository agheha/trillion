<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div>
		<div class="profile">
			<img src="<c:url value="/images/test_img2.jpg" />" alt="testImg">
		</div>
		<div class="left_list">
			<div>
				<p>
					<a href="<c:url value="/study/studymain.do"/>">스터디명</a>
				</p>
				<ul>
					<!-- 스터디장 화면 다르게 보임 -->
					<li><a href="./studymembers.html">멤버</a></li>
					<li><a href="./studyvote.html">투표</a></li>
					<li><a href="./studyschedule.html">일정</a></li>
					<li><a href="./studyboard.html">게시판</a></li>
				</ul>
			</div>
		</div>
	</div>
