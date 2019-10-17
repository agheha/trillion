<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href='<c:url value="/css/memberinfo.css" />'>
<link rel="stylesheet" href='<c:url value="/css/studymanage.css" />'>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">
<!-- PR신고 -->
    <link rel="stylesheet" href='<c:url value="/css/Layer_Pop_up.css" />'>
    <link rel="stylesheet" href='<c:url value="/css/admin_reportform.css" />'>
<title>스터디</title>

<!-- jquery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

</head>
<body>
	<header id="header">
		<%--헤더 인클루드 --%>
		<%@include file="/jsp/common/header.jsp"%>

	</header>

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>스터디</h1>
			<p>--------------</p>
		</div>
	</section>

	<section id="layout">
		<!-- jsp 작업 시 incluide로 변경 -->
		<%--사이드바 인클루드 --%>
		<%@include file="/jsp/common/sidebar.jsp"%>



		<div class="study_right_wrap">
			<div class="contents">
				<h3 class="stm_title">스터디원 목록</h3>
				<table class="study_member">
					<thead>
						<tr>							
							<th>리더</th>
							<th>아이디</th>
							<th>나이</th>
							<th>별명</th>
							<th>성별</th>
							<th>가입일</th>
							<th>신고</th>
						</tr>
					</thead>
					<tbody class="stdmem_td">
						<c:forEach items="${ulist}" var="oneUser">
							<tr email="${oneUser.email}" name="${oneUser.name}"
								class="tr_row">
								<td class="study_leader">
									<c:if test="${study.email eq oneUser.email}">
									<span><i class="fas fa-crown"></i></span>
									</c:if>
								</td>	
								<td>${oneUser.email}</td>								
								<td><fmt:formatDate var="age" value="${oneUser.birth}"
										pattern="yyyy" /> ${year - age + 1}</td>
								<td>${oneUser.name }</td>
								<td>${oneUser.gender}</td>
								<td><fmt:formatDate value="${oneUser.partDate}"
										pattern="yyyy-MM-dd" /></td>
								<td ><button class="alertBtn" type="button" onclick="mopen()">
					<i class="fas fa-comment-slash"></i>
					신고하기
				</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<%@include file="/jsp/common/pagination.jsp"%>
		</div>
		
		
		<div id="prpop">
	<div id="prpop_content">
	<!-- 상세신고 ui -->
	  <div id="b_main">
        <h2 id="rptitle">신고하기</h2>
        <hr/>
        <div id="rpemail_wrap">
            <div class="rpemail">신고자</div>
            <div class="rpemail">${user.email}</div>
        </div>

        <h3>신고사유 선택</h3>
        <div>
            <form action='<c:url value="/admin/report.do"/>' method="post" name="rpform">
                <input type="radio" name="code" value="1" id="rpc1" class="rpcode"/>
                <label for="rpc1">욕설/비하</label>
                <br />
                <input type="radio" name="code" value="2" id="rpc2" class="rpcode"/>
                <label for="rpc2">음란성</label>
                <br />
                <input type="radio" name="code" value="3" id="rpc3" class="rpcode"/>
                <label for="rpc3">게시글/댓글 도배</label>
                <br />
                <input type="radio" name="code" value="4" id="rpc4" class="rpcode"/>
                <label for="rpc4">홍보성 콘텐츠</label>
                <br />
                <input type="radio" name="code" value="5" id="rpc5" class="rpcode"/>
                <label for="rpc5">타인의 개인정보 유포</label>
                <br />
                <input type="radio" name="code" value="6" id="rpc6" class="rpcode"/>
                <label for="rpc6">허위사실 유포</label>
                <br />
                <input type="radio" name="code" value="7" id="rpc7" class="rpcode"/>
                <label for="rpc7">명예회손 관련</label>
                <br />
                <input type="radio" name="code" value="8" id="rpc8" class="rpcode"/>
                <label for="rpc8">기타</label>
                <br />
                <div id="rpcontent">
                    <textarea name="content" placeholder="내용을 입력하세요." class="content"></textarea>
                </div>
                <input type="hidden" name="categoryCode" value="${study.categoryCode}" class="categoryCode"/>
                <input type="hidden" name="type" value="user" class="type"/>
                <input type="hidden" name="reportTarget" value="${oneUser.email}" class="reportTarget"/>
                <input type="hidden" name="boardNum" value="${board.num}" class="boardNum"/>
                <input type="hidden" name="email" value="${user.email}" class="email"/>
                <input type="hidden" name="boardType" value="" class="boardType"/>
                <input type="hidden" name="studyNum" value="${study.num}" class="studyNum"/>
                <div id="rpbtn">
                      <button type="button" id="btn" onclick="reportAjax(),mclose()">신고하기</button>
                </div>
            </form>
        </div>
    </div>
	<div id="prpoplayer" onclick="mclose()"></div>
	</div>
</div>		
		
		
	</section>


	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<%@include file="/jsp/study/usercard.jsp"%>
		</div>

	</div>



	<script src="<c:url value="/script/study/studymembers.js"/>"></script>
	  <!-- RP팝업 js -->
<script type="text/javascript" src="<c:url value='/script/admin/popUp.js'/>"></script>
<script type="text/javascript" src="<c:url value='/script/admin/reportAjax.js'/>"></script>
</body>