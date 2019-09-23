<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>투표게시판</h2>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>마감날짜</td>
		</tr>
		<c:if test="${empty vlist}">
		<tr>투표가 없습니다</tr>
		</c:if>
		<c:forEach var="vote" items="${vlist}">
		<tr>
			<td>${vote.num}</td>
			<td>${vote.title}</td>
			<td>${vote.limitDate}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>