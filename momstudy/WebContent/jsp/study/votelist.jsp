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
<h2>��ǥ�Խ���</h2>
	<table>
		<tr>
			<td>��ȣ</td>
			<td>����</td>
			<td>������¥</td>
		</tr>
		<c:if test="${empty vlist}">
		<tr>��ǥ�� �����ϴ�</tr>
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