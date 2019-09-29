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
			<div class="buttons">
				<c:if test="${vote.type eq 1}">
				<form class="revote" action="revote.do" method="post">
				<button class="vote-btn">재투표</button><input type="hidden" value="${vote.num}" name="num">
				<a href="<c:url value="/study/votelist.do" />"><button class="vote-btn" id="golist" type="button">목록</button></a>
				</form>
				</c:if>			
			</div>
				<span class="poll-title">${vote.title}</span>
				<hr style="border: none; height: 2px; background: grey;">
				<form action="<c:url value="/study/vote.do" />" method="post">
				<table class="poll-list">
					<tbody id=aricle>
						<c:forEach var="aricle" items="${valist}">
							<tr class="vote-row">
								<td colspan="2" class="poll-option" >
								<c:if test="${aricle.type == 2}"><span class="myariclecheck">V</span></c:if>
								<span>${aricle.content}</span><span class="votecnt">${aricle.list.size()}표</span>
								<c:choose>
								<c:when test="${vote.anonumous == 2}">
								<a href='<c:url value="/study/voteresultdetail.do?code=" />${aricle.code}'><div class="poll-option-bar" style="width:${aricle.list.size()/voteCnt*100}%"></div></a>								
								</c:when>	
								<c:otherwise>	
								<div class="poll-option-bar" style="width:${aricle.list.size()/voteCnt*100}%"></div>
								</c:otherwise>	
								</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
						<td colspan="2" ><span class="totalcnt">총 ${voteCnt}표</span></td>
						</tr>
					</tfoot>
				</table>
				</form>
			</div>
		</div>


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