<%@ page language="java" contentType="text/html; charset=UTF-8"
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
				<span class="poll-title">${content}</span>
				<a href="<c:url value="/study/votelist.do" />"><button class="vote-btn" id="closevote">닫기</button></a>
				<hr style="border: none; height: 2px; background: grey;">
				<table class="poll-list">
					<tbody id=aricle>
						<c:forEach var="result" items="${vrlist}">
							<tr class="vote-row">
								<td colspan="2" class="poll-option"><p>${result.email}</p>
									<div class="poll-option-bar"></div>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>



	<script type="text/javascript">
		function closesvote(){
			window.opener.location.href="votelist.do"
			window.close();
		}
		
		let closevotebtn = document.querySelector('#closevote');
		
		closevotebtn.addEventListener("click",closesvote);
		
		let he = document.querySelector("body").offsetHeight;
		
		this.resizeTo(530,he+80);
	</script>



</body>
</html>