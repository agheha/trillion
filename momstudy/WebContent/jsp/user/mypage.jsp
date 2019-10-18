<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet" href='<c:url value="/css/header.css" />'>
<link rel="stylesheet" href="<c:url value="/css/mypage.css"/>">
<link rel="stylesheet" href="<c:url value="/css/participant.css"/>">
<link rel="stylesheet" href="<c:url value="/css/deletestudy.css"/>">
<link rel="stylesheet" href="<c:url value="/css/deletemsg.css"/>">


<title>마이페이지</title>
<!-- slide plugin -->
<link rel="stylesheet" href="<c:url value="/script/slick/slick.css"/>">
<link rel="stylesheet"
	href="<c:url value="/script/slick/slick-theme.css"/>">

<!-- jquery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/script/slick/slick.js"/>"></script>

<style>
</style>
</head>
<body>
	<header id="header">
		<%@include file="/jsp/common/header.jsp"%>
	</header>

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>마이페이지</h1>
			<p>--------------</p>
		</div>
	</section>

	<section id="layout">
		<div class="mypageContent">
			<div class="user">
				<div class="bigtext">내 정보</div>
				<div class="usercontent">
					<div class="userinfo">
						<div class="userpic">
							<img id="userimg"
								src="<c:url value="/util/download.do?fgno=${user.fileGroupCode}" />"
								alt="">
						</div>
						<div class="btns">
							<div class="btn" id="userinfo">사용자 정보 수정</div>
							<div class="btn" id="participant">신청한 스터디</div>
							<div class="btn" id="myparticipant">가입한 스터디</div>
						</div>
					</div>
					<div class="userscore">
						<div class="scorecontent">
							<%@include file="/jsp/study/score.jsp"%>
						</div>
						<div class="ment">당신의 평점을 가꾸어보세요.</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="studylist">
				<div class="bigtext" id="bigstudytitle">스터디 목록</div>
				<div class="icons">
					<i class="fas fa-chevron-left" id="prevBtn"></i>
				</div>
				<form name="sForm" action="<c:url value="/study/studymain.do" />"
					method="post">
					<input type="hidden" value="" name="num" id="numput">
					<div class="studycontent">
						<c:choose>
							<c:when test="${slist.size() > 0}">
								<div class="forslide">
									<c:forEach items="${slist}" var="study">
										<div num="${study.num}" class="studycard">
											<div class="studypic">
												<img class="studyimg"
													src="<c:url value="/util/download.do?fgno=${study.fileGroupCode}" />"
													alt="">
											</div>
											<div class="studytitle">${study.name}</div>
										</div>
									</c:forEach>
								</div>
							</c:when>
							<c:otherwise>
								<div class="notfoundcon">
									<div class="smallcon">
										<span class="studytext">가입하신 스터디가 없습니다. <br /> <br />
											스터디 찾기에서 원하는 스터디를 검색해보세요.
										</span>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</form>
				<div class="icons">
					<i class="fas fa-chevron-right" id="nextBtn"></i>
				</div>
			</div>
		</div>
	</section>

	<div class="partlistModal hidden">
		<!-- 우측 상당 슬라이드 -->
		<div class="partlist_sub"></div>
		<div class="table_wrap">
			<table class="part_table" id="pttable">
		</div>
		</table>
	</div>
	<div class="heightAuto hidden">
		<div class="right_top_cont" id="partlist"></div>
		<div class="table_wrap">
			<table class='rwd-table'></table>
		</div>
	</div>
	<div id="myModal" class="msgmodal">
		<!-- Modal content -->
		<div class="msgcontent" id="myBtn">
			<div id="que">스터디를 탈퇴하시겠습니까</div>
			<div class="buttons">
				<button type="button" id="signup" onclick="agree()">확인</button>
				<button name="detbe" class="closer" id="closecell">취소</button>			
			</div>
		</div>
	</div>
	<script>
		let email = "${user.email}";
		let pttable = document.querySelector("#pttable");
		let userinfo = document.querySelector("#userinfo");
		userinfo.addEventListener("click", e =>{
			location.href ="/momstudy/user/userinfo.do"
		})
		
	</script>
	<script src="<c:url value="/script/user/deletestudylist.js"/>"></script>
	<script src="<c:url value="/script/user/deletepartisipant.js"/>"></script>
	<script src="<c:url value="/script/user/deletestudy.js"/>"></script>
	<script src="<c:url value="/script/user/deletemsg.js"/>"></script>
	<script src="<c:url value='/script/user/mypage.js'/>"></script>
	<script>

	</script>
</body>
</html>






