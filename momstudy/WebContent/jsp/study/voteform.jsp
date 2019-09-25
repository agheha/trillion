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
	<form action="<c:url value="/study/vote.do" />" method="post">
		<div class="poll-container">
			<div class="poll-voter">
				<span class="poll-title">${vote.title}</span>
				<button class="vote-btn">투표</button>
				<hr style="border: none; height: 2px; background: grey;">
				<table class="poll-list">
					<tbody id=aricle>
						<c:forEach var="aricle" items="${valist}">
							<tr class="vote-row">
								<td colspan="2" class="poll-option"><p>${aricle.content}</p>
									<div class="poll-option-bar"></div>
								<c:choose>
									<c:when test="${vote.duplication eq 1}">
										<input type="radio" name="aricle"
											value="${aricle.code}"></input>
											<input type="hidden" name="num" value="${vote.num}"/>
									</c:when>

									<c:otherwise>
										<input type="checkbox" name="aricle"
											value="${aricle.code}"></input>
											<input type="hidden" name="num" value="${vote.num}"/>
									</c:otherwise>

								</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="3"><button type="button" class="vote-btn-add"
									onclick="add_tr()">항목추가</button></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</form>



	<script type="text/javascript">
		var count = 3;
		function add_tr() {
			var str = "" 
			str = `<td class="poll-option"><input type="text" name="aricle`+ count++ +`"placeholder="항목을 입력해주세요.">
						<div class="poll-option-bar"></div>
					
					<button type="button" class="vote-btn-remove"
						onclick="remove_tr(this)">삭제</button>
					
					<button type="button" class="vote-btn-remove"
						onclick="remove_tr(this)">삭제</button>
					</td>`;

			var tr = document.createElement('tr');
			tr.className = "vote-row";
			tr.innerHTML = str;
			document.getElementById('aricle').appendChild(tr);
		}

		function remove_tr(obj) {
				document.getElementById('aricle').removeChild(
						obj.parentNode.parentNode);

		}
	</script>



</body>
</html>