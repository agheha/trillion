<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/css/vote.css" ></c:url>" />
</head>
<body>
	<div class="poll-container">
		<div class="poll-voter">
			<h4 class="poll-title">투표제목</h4>
			<hr style="border: none; height: 2px; background: grey;">
			<table class="poll-list">
				<tbody>
				<form action="<c:url value="/study/vote.do" />" method="post">
					<c:forEach begin="1" end="10" step="1">
					<tr class="vote-row" >
						<td class="poll-option"><p>투표항목</p>
							<div class="poll-option-bar" ></div>
						</td>
						<td><input type="radio"></input> </td>
					</tr>
					</c:forEach> 
				</form>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>