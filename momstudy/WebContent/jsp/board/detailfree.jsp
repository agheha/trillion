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
.report {
 text-align: right;
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
			<h1>자유게시판</h1>
			<p>ㅎㅇ</p>
		</div>
	</section>

	<section id="layout">
		<div class="study_right_wrap">
			<div class="board_title">
				<p>
					<c:out value="${board.title}" />
				</p>
				<div class ="top">
					<span>${board.email}</span> 
					<span><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" /></span>
					<span style="width: 54px;">${board.seeCnt}</span>
				</div>
			</div>

			<div class="board_cont">
				<p><c:out value="${board.content}" /></p>
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
				<button type="button">
				 <a class="report" href="">신고하기</a>
				</button>
				
			</div>
			<br>
			
			<!-- 댓글 여기서부터 -->
			<div class="commentWrap">
				<div class="row">
					<div class="col-sm-12">
						<div class="review">
							<form name="create" method="post" action="freecommentWrite.do" class="commentForm" onsubmit="return check()">
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
												<form method="post" action="freecommentupdate.do"
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
																onclick="document.location.href='freecommentdelete.do?commentGroupCode=${comment.commentGroupCode}&num=${comment.num}'">삭제</button>
															<button type="button" class="btn btn-secondary"
																onclick="document.location.href='freedetail.do?type=modify&commentGroupCode=${comment.commentGroupCode}&no=${board.num}&commentNo=${comment.num}'">수정</button>
															
															<c:if test="${comment.parent == 0}">
																<button type="button" class="btn btn-secondary"
																	onclick="document.location.href='freedetail.do?type=reply&parentNo=${comment.num}&no=${board.num}'">답변
																</button>
															</c:if>
														</div>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								
									<c:if test="${type eq 'reply' && comment.num == parentNo}">
										<div class="commReply">
											<form method="post" action="freedetail.do" class="commentForm">
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
	</section>


	<script type="text/javascript"  src="<c:url value="/script/board/detailboard.js" />">
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