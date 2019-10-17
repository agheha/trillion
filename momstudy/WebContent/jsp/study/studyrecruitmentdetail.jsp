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
<link rel="stylesheet"
	href='<c:url value="/css/studyboard_detail.css" />'>
<link rel="stylesheet"
	href='<c:url value="/css/signup_completed.css" />'>
<!-- PR신고 -->
<link rel="stylesheet" href='<c:url value="/css/Layer_Pop_up.css" />'>
<link rel="stylesheet"
	href='<c:url value="/css/admin_reportform.css" />'>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">


<title>스터디원 모집</title>
<!-- RP팝업 js -->
<script type="text/javascript"
	src="<c:url value='/script/admin/popUp.js'/>"></script>
<!-- 신고하기 ajax -->
<script type="text/javascript"
	src="<c:url value='/script/admin/reportAjax.js'/>"></script>
<style type="text/css">
#prpop {
	width: 900px !important;
}
</style>
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
				<div class="top">
					<span>${str.email}</span> <span><fmt:formatDate
							value="${str.regDate}" pattern="yyyy-MM-dd" /></span> <span
						style="width: 54px;">${str.seeCnt}</span>
				</div>
			</div>

			<!-- 이미지가 와야함 -->
			<div class="image_wrap">
				<c:if test="${file.groupCode != null}">
					<img
						src="<c:url value="/util/download.do?fgno=${file.groupCode}" />" />
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
						<a class="del"
							href='<c:url value="/study/studyrecruitmentupdateform.do?num=${str.num}" />'>수정</a>
					</button>
					<button type="button">
						<a class="del"
							href='<c:url value="/study/studyrecruitmentdelete.do?num=${str.num}" />'>삭제</a>
					</button>
					<span>
						<button type="button" id="report">신고하기</button>
					</span>
				</c:if>
				<!-- 신청하기 버튼 => 스터디원 이고, 로그인이 되어있는 상태에서만 활성화-->
				<c:if test="${user.email != str.email}">
					<!-- 참여한 적이 없는 사람만 활성화 -->
					<c:if test="${p_flag}">
						<button type="button" id="myBtn">
							<a id="stdsign" href='#'>신청하기</a>
						</button>
					</c:if>
				</c:if>
			</div>
			<div class="buttons">
				<button type="button" id="golist">
					<a href='<c:url value="/study/studyrecruitmentlist.do"/>'>목록으로</a>
				</button>
				<div>
					<button type="button" id="report" onclick="mopen()">신고하기</button>
				</div>
			</div>
		</div>

		<br>

		<div id="prpop">
			<div id="prpop_content">
				<!-- 상세신고 ui -->
				<div id="b_main">
					<h2 id="rptitle">신고하기</h2>
					<hr />
					<div id="rpemail_wrap">
						<div class="rpemail">신고자</div>
						<div class="rpemail">${user.email}</div>
					</div>

					<h3>신고사유 선택</h3>
					<div>
						<form action='<c:url value="/admin/report.do"/>' method="post"
							name="rpform">
							<input type="radio" name="code" value="1" id="rpc1"
								class="rpcode" /> <label for="rpc1">욕설/비하</label> <br /> <input
								type="radio" name="code" value="2" id="rpc2" class="rpcode" />
							<label for="rpc2">음란성</label> <br /> <input type="radio"
								name="code" value="3" id="rpc3" class="rpcode" /> <label
								for="rpc3">게시글/댓글 도배</label> <br /> <input type="radio"
								name="code" value="4" id="rpc4" class="rpcode" /> <label
								for="rpc4">홍보성 콘텐츠</label> <br /> <input type="radio"
								name="code" value="5" id="rpc5" class="rpcode" /> <label
								for="rpc5">타인의 개인정보 유포</label> <br /> <input type="radio"
								name="code" value="6" id="rpc6" class="rpcode" /> <label
								for="rpc6">허위사실 유포</label> <br /> <input type="radio"
								name="code" value="7" id="rpc7" class="rpcode" /> <label
								for="rpc7">명예회손 관련</label> <br /> <input type="radio"
								name="code" value="8" id="rpc8" class="rpcode" /> <label
								for="rpc8">기타</label> <br />
							<div id="rpcontent">
								<textarea name="content" placeholder="내용을 입력하세요."
									class="content"></textarea>
							</div>
							<input type="hidden" name="type" value="board" class="type" /> <input
								type="hidden" name="boardNum" value="${str.num}"
								class="boardNum" /> <input type="hidden" name="email"
								value="${user.email}" class="email" /> <input type="hidden"
								name="boardType" value="recruit" class="boardType" /> <input
								type="hidden" name="categoryCode" value="${str.categoryCode}"
								class="categoryCode" />
							<div id="rpbtn">
								<button type="button" id="btn" onclick="reportAjax(),mclose()">신고하기</button>
							</div>
						</form>
					</div>
				</div>
				<div id="prpoplayer" onclick="mclose()"></div>
			</div>
		</div>

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