<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

	<link rel="stylesheet" href='<c:url value="/css/common.css" />'>
	<link rel="stylesheet" href='<c:url value="/css/header.css" />'>
    <link rel="stylesheet" href='<c:url value="/css/layout.css" />'>
    <link rel="stylesheet" href='<c:url value="/css/study_layout.css" />'>
    <link rel="stylesheet" href='<c:url value="/css/studyboard_detail.css" />'>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
    integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
		crossorigin="anonymous">

    <title>스터디</title>

    <!-- jquery -->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
</head>
<body>
	<header id="header">
		<%@include file="/jsp/common/header.jsp" %>
	</header>

    <!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
    <section class="background_wrap">
        <div class="background">
            <h1>스터디</h1>
            <p>--------------</p>
        </div>
    </section>

    <section id="layout">

       <div class="study_right_wrap">
           <div class="board_title">
               <p>${rBoard.title}</p>
               <div>
                   <span>${rBoard.email}</span>
                   <span><fmt:formatDate value="${rBoard.regDate}" pattern="yyyy-MM-dd" /></span>
               </div>
           </div>
           
           <div>
           	   평점: <span>${rBoard.score}</span>
           </div>
		
		<!-- 추후 이미지 -->
           <div class="image_wrap">
           	   <c:if test="${file.groupCode != null}">
	               <img src="<c:url value="/util/download.do?fgno=${file.groupCode}" />"  />
           	   </c:if>
           </div>
   
           <div class="board_cont">
               ${rBoard.content}
           </div>

           <div class="buttons">
	           <c:choose>
			        <c:when test="${rBoard.email == user.email}">
				        <button type="button" onclick="location.href='<c:url value="/review/updateForm.do?num=${rBoard.num}"/>' ">수정</button>
		                <button type="button" onclick="location.href='<c:url value="/review/delete.do?num=${rBoard.num}"/>' ">삭제</button>
			        </c:when>
			        <c:otherwise>
				        <button type="button" onclick="location.href='<c:url value="/review/list.do"/>' ">게시판으로 이동</button>
			        </c:otherwise>
	      	   </c:choose>
           </div>

			<!-- 댓글 영역 -->
			<div id="comment_Wrap">
				<div id="commentRegistForm">
					<form name="crForm" method="post" action="commentWrite.do" onsubmit="return commentRegistAjax()" >
						
						<div>테스트용 rBoard.num = ${rBoard.num}</div>
						<div>테스트옹 user.email = ${user.email}</div>
						
						<input type="hidden" name="num" value="${rBoard.num}" />
						<input type="hidden" name="email" value="${user.email}" />
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
			
           
           <!-- 댓글 입력칸 -->
           <%-- <div class="commentWrap">
				<div class="row">
					<div class="col-sm-12">
						<div class="review">
							<form method="post" action="<c:url value="/review/commentWrite.do?num=${rBoard.num}"/>" class="commentForm">
								<div>
									<textarea id="comment_text" name="content" class="comment"></textarea>
								</div>
								<div class="insert1">
									<button type="submit" class="btn btn-primary">등록</button>
								</div>
							</form>
						</div>
					</div>
				</div> --%>
				
	            <!-- 댓글 삭제, 수정 -->
				<%-- <div class="row">
					<div class="col-sm-12">
						<div id="commentList">
							<c:if test="${empty comment}">
								<p>댓글이 존재하지 않습니다.</p>
							</c:if> --%>
							
							
							<!-- 대댓글 -->
							<%-- <c:choose>
							   <c:when test="${comment.parent == 0}">
							   		<div class="row">
							   </c:when>
							   <c:otherwise>
							   		<div class="comm_reply row" >
							   </c:otherwise>
							</c:choose> --%>
							
							<!-- parent가 0일시 들여쓰기 (댓글) -->
							<%-- <c:forEach var="comment" items="${comment}">
								<div class="comm col-sm-12">
									<span class="comm_id">${comment.email}</span>
									<span class="comm_reg">
										<fmt:formatDate pattern="yy-MM-dd HH:mm"
											value="${comment.regDate}" />
									</span>
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
															onclick="document.location.href='commentDelete.do?commentGroupCode=${comment.commentGroupCode}&num=${comment.num}'">삭제</button>
														<button type="button" class="btn btn-secondary"
															onclick="document.location.href='detail.do?type=modify&commentGroupCode=${comment.commentGroupCode}&no=${board.num}&commentNo=${comment.num}'">수정</button>
														
														<c:if test="${comment.parent == 0}">
															<button type="button" class="btn btn-secondary"
																onclick="document.location.href='detail.do?type=reply&parentNo=${comment.num}&no=${board.num}'">답변
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
										<form method="post" action="detail.do" class="commentForm">
											<input type="hidden" name="num" value="${board.num}" />
											<div>
												<textarea id="comment_text" name="content" cols="90" class="comment"></textarea>
											</div>
											<div class="insert1">
												<button type="submit" class="btn btn-primary">등록</button>
											</div>
										</form>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div> 
				</div>
			</div>--%>
       </div>
    </section>
    
	<script>
		let num = ${rBoard.num};
	</script>
    <script src="<c:url value='/script/review/commentReview.js' />"></script>

</body>
</html>