<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div class="profile">
		<img src="<c:url value="/images/test_img2.jpg" />" alt="testImg">
	</div>
	<div class="left_list">
		<div>
			<form name="goForm" action="<c:url value="/study/studymain.do"/>"
				method="post">
				<p>
					<a href="#" onclick="goMain();">${study.name}</a>
				</p>
				<input type="hidden" value="${study.num}" name="num" />
			</form>
			<ul>
				<!-- 스터디장 화면 다르게 보임 -->
				<li><a href="<c:url value="/study/studyinfo.do"/>">스터디 정보</a></li>
				<li><a href="<c:url value="/study/member.do"/>">멤버</a></li>
				<li><a href="<c:url value="/study/votelist.do"/>">투표</a></li>
				<li><a
					href="<c:url value="/study/list.do?studynum=${study.num}"/>">게시판</a></li>
				<c:if test="${user.email eq study.email}">
					<li><a id="admin">스터디 관리</a></li>
					<form name="adminForm" action="" method="post">
						<ul class="admin">
							<li><div class="space"></div>
								<a class="adminele2" id="studyUpdate">스터디 정보 수정</a></li>
							<li><div class="space"></div>
								<a class="adminele" go="<c:url value="/study/adminmember.do"/>">스터디원
									관리</a></li>
							<li><div class="space"></div>
								<a class="adminele"
								go="<c:url value="/study/adminaprovalmember.do"/>">스터디 신청자
									관리</a></li>
							<c:if test="${str != null}">
								<li><div class="space"></div>
									<a class="adminele"
									go="<c:url value="/study/studyrecruitmentdetail.do?num=${str.num}"/>">모집글
										관리</a></li>
							</c:if>
							<c:if test="${str == null}">
								<li><div class="space"></div>
									<a class="adminele"
									go="<c:url value="/study/studyrecruitmentwriteform.do"/>">모집글
										생성</a></li>
							</c:if>
						</ul>
					</form>
				</c:if>
			</ul>
		</div>
	</div>
</div>

<div class="updateStudyMd mdhidden" >
	<div class="backgroundMd"></div>
	<div class="updateStudyCt">
		<%@include file="/jsp/study/studywriteform.jsp" %>
	</div>
</div>
<script src="<c:url value="/script/common/sidebar.js"/>"></script>