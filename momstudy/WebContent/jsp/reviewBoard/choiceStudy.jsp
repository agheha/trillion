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

	<!-- css 추가해야됨 -->
	<%-- <link rel="stylesheet" href='<c:url value="/css/review_board.css" />'> --%>

	<title>스터디 선택 모달창</title>
</head>
<body>
	<div>
		<form action="<c:url value="/review/writeForm.do" />" method="post">
			<p>등록하실 스터디를 선택하세요.</p>
			<c:if test="${empty slist}">
	       		<div>게시물이 없습니다.</div>
	       	</c:if>
	       	<c:forEach var="rb" items="${slist}" >
		      	<div class="board_cont">
					<input type="checkbox" name="studyNum" value="${rb.num}" />
					<span>${rb.name}</span>
		      	</div>
	        </c:forEach>
	        <button type="submit" class="">선택</button>
		</form>
	</div>
</body>
</html>