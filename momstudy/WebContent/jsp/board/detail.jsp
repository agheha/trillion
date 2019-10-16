<%@page import="kr.co.momstudy.repository.vo.Comment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	List<Comment> commentList = (List<Comment>) request.getAttribute("commentList");
%>
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

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>스터디</title>

<!-- jquery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<style>
table {
	width: 80%
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

.commentForm {
	display: flex;
	flex-direction: row;
}

.comment {
	height: 100%;
}

.insert1 {
	float: none;
	margin-left: auto;
}

.review {
	margin-bottom: 25px;
}

.comm {
	display: flex;
	flex-direction: row;
	margin-bottom: 10px;
}

.comm_id {
   margin-right: 10px;
}

.comm_content {
	margin-right: auto;
}

.comm_reg {
	margin-right: auto;
}

.comm_action {
	
}
.comm_reply {
   margin-left: 30px;
}
a {
	color: black
}
.top {
 text-align: right;
}
.prshow {
    opacity: 1;
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
			<p>준비해라 각오해라</p>
		</div>
	</section>

	<section id="layout">
		<%@include file="/jsp/common/sidebar.jsp"%>

		<div class="study_right_wrap" style="width: 820px !important; border-left: 3px solid #dadada !important;">
			<div class="board_title">
				<p><c:out value="${board.title}" /></p>
			</div>
			<div class="boardInfo">
				<span>${board.email}</span> 
				<span><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" /></span>
				<span>${board.seeCnt}</span>
			</div>

			<div class="board_cont">
				${board.content}"
				<button class="alertBtn">
					<i class="fas fa-user-slash"></i>
					신고하기
				</button>
			</div>
			
           <!-- 수정 삭제 버튼 -->
			<div class="buttons">
				<button type="button">
					<a class="del" href='updateform.do?num=${board.num}'>수정</a>
				</button>
				<button type="button">
					<a class="del" href='delete.do?num=${board.num}'>삭제</a>
				</button>
				<button type="button">
				  <a class="del" href='list.do'>목록</a>
				</button>
			<button type="button" class="report" onclick="mopen()"> 신고하기</button>
			</div>
			<br>
			
			<!-- 댓글 여기서부터 -->
			<div class="commentWrap">
				<div class="row">
					<div class="col-sm-12">
						<div class="review">
							<form name="create" method="post" action="commentWrite.do" class="commentForm" onsubmit="return check()">
								<input type="hidden" name="num" value="${board.num}" />
								<div>
									<textarea id="comment_text" name="content" cols="90"
										class="comment"></textarea>
								</div>
								<div class="insert1">
									<button type="submit" class="btn btn-primary">등록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<!-- 댓글 삭제, 수정 -->
				<div class="row">
					<div class="col-sm-12">
						<div id="commentList">
							<c:if test="${empty commentList}">
								<p>댓글이 존재하지 않습니다.</p>
							</c:if>
								<!-- parent가 0일시 들여쓰기 (댓글) -->
							<c:forEach var="comment" items="${commentList}">
								<c:choose>
								   <c:when test="${comment.parent == 0}">
								   		<div class="row">
								   </c:when>
								   <c:otherwise>
								   		<div class="comm_reply row" >
								   </c:otherwise>
								</c:choose>
								
									<div class="comm col-sm-12">
										<div class="comm_id">${comment.email}</div>
										<div class="comm_reg">
											<fmt:formatDate pattern="yy-MM-dd HH:mm"
												value="${comment.regDate}" />
										</div>
									</div>
									<div class="col-sm-12">
										<c:choose>
											<c:when test="${type eq 'modify' && comment.num == commentNo}">
												<form method="post" action="commentupdate.do"
													class="commentForm">
													<div>
														<textarea id="comment_text" name="content" cols="90"
															class="comment">${comment.content}</textarea>
													</div>
													<input type="hidden" name="num" value="${comment.num}" />
			                                        <input type="hidden" name="commentGroupCode" value="${comment.commentGroupCode}" />		
			
													<div class="insert1">
														<button type="submit" class="btn btn-primary">수정</button>
													</div>
												</form>
											</c:when>
											<c:otherwise>
												<div class="comm">
													<div class="comm_content">${comment.content}</div>
													<div class="comm_action">
														<div class="btn-group-sm" role="group"
															aria-label="Basic example">
														     <button type="button" class="btn btn-secondary"
																onclick="document.location.href='commentdelete.do?commentGroupCode=${comment.commentGroupCode}&num=${comment.num}'">삭제</button>
															<button type="button" class="btn btn-secondary"
																onclick="document.location.href='detail.do?type=modify&commentGroupCode=${comment.commentGroupCode}&no=${board.num}&commentNo=${comment.num}'">수정</button>
															
														<!-- 	<c:if test="${comment.parent == 0}">
																<button type="button" class="btn btn-secondary"
																	onclick="document.location.href='detail.do?type=reply&parentNo=${comment.num}&no=${board.num}'">답변
																</button>
															</c:if> -->
														</div>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								
									<c:if test="${type eq 'reply' && comment.num == parentNo}">
										<div class="commReply">
											<form method="post" action="detail.do" class="commentForm">
												<input type="hidden" name="no" value="${board.num}" />
												<div>
													<textarea id="comment_text" name="content" cols="90" class="comment"></textarea>
												</div>
												<div class="insert1">
													<button type="submit" class="btn btn-primary">등록</button>
												</div>
											</form>
										</div>
									</c:if>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
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

  <!-- RP팝업 js -->
<script type="text/javascript" src="<c:url value='/script/admin/popUp.js'/>"></script>
<script type="text/javascript" src="<c:url value='/script/admin/reportAjax.js'/>"></script>

	<script type="text/javascript" src="<c:url value="/script/board/detailboard.js" />">
		$(document).ready(function() {
			$("#header").load("header.html");
		});
	</script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>