<%@page import="kr.co.momstudy.repository.vo.Comment"%>
<%@page import="java.util.List"%>
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

<link rel="stylesheet" href='<c:url value="/css/common.css" /> '>
<link rel="stylesheet" href='<c:url value="/css/header.css" />'>
<link rel="stylesheet" href='<c:url value="/css/layout.css" />'>
<link rel="stylesheet" href='<c:url value="/css/study_layout.css" />'>

<link rel="stylesheet"
	href='<c:url value="/css/studyboard_detail.css" />'>
<link rel="stylesheet" href='<c:url value="/css/comment.css" />'>
<!-- PR신고 -->
    <link rel="stylesheet" href='<c:url value="/css/Layer_Pop_up.css" />'>
    <link rel="stylesheet" href='<c:url value="/css/admin_reportform.css" />'>

<link rel="stylesheet" href='<c:url value="/css/studyboard_detail.css" />'>



<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">


<!-- jquery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>


</head>
<body>
	<header id="header">
		<%@include file="/jsp/common/header.jsp"%>
	</header>

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>자유게시판</h1>
			<p>ㅎㅇ</p>
		</div>
	</section>

	<section id="layout">
		<div class="study_right_wrap">
			<div class="board_title">
				<p><c:out value="${board.title}" /></p>
			</div>
			<div class="boardInfo">
				<span>작성자 : ${board.email}</span> 
				<span>작성일 : <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" /></span>
				<span>조회수 : ${board.seeCnt}</span>
			</div>

			
           <!-- 수정 삭제 버튼 -->
			<div class="buttons">
				<button type="button">
					<a class="del" href='freeupdateform.do?num=${board.num}'>수정</a>
				</button>
				<button type="button">
					<a class="del" href='freedelete.do?num=${board.num}'>삭제</a>
				</button>
				<button type="button">
				  <a class="del" href='freelist.do'>목록</a>
				</button>				

			<div class="board_cont" style="padding-top: 50px;">
				${board.content}
				<button type="button" class="alertBtn" onclick="mopen()">
					<i class="fas fa-user-slash"></i>
					신고하기
				</button>

			</div>
				
			  <div class="buttons">
	           <c:choose>
			        <c:when test="${board.email == user.email}">
				        <button type="button" onclick="location.href='<c:url value="/boardfree/freeupdateForm.do?num=${board.num}"/>' ">수정</button>
		                <button type="button" onclick="location.href='<c:url value="/boardfree/freedelete.do?num=${board.num}"/>' ">삭제</button>
			        </c:when>
			        <c:otherwise>
				        <button type="button" onclick="location.href='<c:url value="/boardfree/freelist.do"/>' ">목록</button>
			        </c:otherwise>
	      	   </c:choose>
           </div>
			
			   <!--  댓글 -->
		 	<div id="comment_Wrap">
				<div id="commentRegistForm">
					<form name="crForm" method="post" action="freecommentWrite.do" onsubmit="return commentRegistAjax()" >
						
						<input type="hidden" name="num" value="${board.num}" />
						<input id="user" type="hidden" name="email" value="${user.email}" />
						<div>
							<textarea name="content"></textarea>
						</div>
						<div>
							<button type="submit">등록</button>
						</div>
				    	</form>
				  </div>
				<div id="commentList"></div>
			</div>

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
                <input type="hidden" name="type" value="board" class="type"/>
                <input type="hidden" name="boardNum" value="${board.num}" class="boardNum"/>
                <input type="hidden" name="email" value="${user.email}" class="email"/>
                <input type="hidden" name="boardType" value="free" class="boardType"/>
                <input type="hidden" name="studyNum" value="0" class="studyNum"/>
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

  <!-- RP팝업 js -->
<script type="text/javascript" src="<c:url value='/script/admin/popUp.js'/>"></script>
<script type="text/javascript" src="<c:url value='/script/admin/reportAjax.js'/>"></script>
<script type="text/javascript"  src="<c:url value="/script/board/detailboard.js" />"></script>
<script type="text/javascript">
let num = ${board.num}
let email = `${user.email}`
</script>


	<script type="text/javascript"  src="<c:url value="/script/board/detailboard.js" />"></script>
	
</body>
</html>