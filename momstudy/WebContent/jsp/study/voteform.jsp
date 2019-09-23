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
	<form action="<c:url value="/study/vote.do" />" method="post">
		<div class="poll-container">
			<div class="poll-voter">
				<span class="poll-title">${vote.title}</span>
				<button class="vote-btn">투표</button>
				<hr style="border: none; height: 2px; background: grey;">
				<table class="poll-list">
					<tbody>
						<c:forEach var="aricle" items="${valist}">
							<tr class="vote-row">
								<td class="poll-option"><p>${aricle.content}</p>
									<div class="poll-option-bar"></div></td>
								<c:choose>
									<c:when test="${vote.duplication eq 1}">
										<td><input type="radio" name="aricle"
											value="${aricle.code}"></input></td>
											<input type="hidden" name="num" value="${vote.num}"/>
											${vote.num}
									</c:when>

									<c:otherwise>
										<td><input type="checkbox" name="aricle"
											value="${aricle.code}"></input></td>
											<input type="hidden" name="num" value="${vote.num}"/>
									</c:otherwise>

								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</form>
</body>
</html>