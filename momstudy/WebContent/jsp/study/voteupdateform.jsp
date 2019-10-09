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
	<form action="<c:url value="/study/voteupdate.do" />" method="post" name="vform">
		<input type="hidden" value="${vote.num}" name="num"> 
		<div class="poll-container">
			<div class="poll-voter">
				<span class="poll-title"><input type="text" name="title" id="votetitle"
					value="${vote.title}"></span>
				<button class="vote-btn" type="button" id="submitbtn">수정</button>
				<hr style="border: none; height: 2px; background: grey;">
				<table class="poll-list">
					<tbody id="aricle">
					<c:forEach var="aricle" items="${valist}" varStatus="i">
						<tr class="vote-row" id="aricle-row">
							<td class="poll-option"><input type="text" name="aricle${i.count}"
								value="${aricle.content}">
								<div class="poll-option-bar"></div></td>
							<td><button type="button" class="vote-btn-remove"
									onclick="remove_tr(this)">삭제</button></td>
						</tr>
					</c:forEach>

					</tbody>
					
					<tfoot>
						<tr>
							<td colspan="2"><button type="button" class="vote-btn-add"
									onclick="add_tr()">항목추가</button></td>
						</tr>
						
						<tr>
							<td colspan="2"><hr
									style="border: none; height: 2px; background: grey;"></td>
						</tr>
						
						<tr>
							<td colspan="2">
							<c:choose>
							<c:when test="${vote.duplication eq 1}">
							<input id="checkbox-1" class="checkbox-custom" name="duplication" checked type="checkbox">
							</c:when>
							<c:otherwise>							
							<input id="checkbox-1" class="checkbox-custom" name="duplication" type="checkbox">
							</c:otherwise>
							</c:choose>
							<label for="checkbox-1" class="checkbox-custom-label">중복투표</label>
							
							<c:choose>	
							<c:when test="${vote.anonumous eq 1}">
							<input id="checkbox-2" class="checkbox-custom" name="anonumous" checked type="checkbox">
							</c:when>
							<c:otherwise>							
							<input id="checkbox-2" class="checkbox-custom" name="anonumous" type="checkbox">
							</c:otherwise>
							</c:choose>
							<label for="checkbox-2" class="checkbox-custom-label">익명투표</label> 
							
							<c:choose>
							<c:when test="${vote.ariclePlus eq 1}">
							<input id="checkbox-3" class="checkbox-custom" name="addaricle"  checked type="checkbox">
							</c:when>
							<c:otherwise>
							<input id="checkbox-3" class="checkbox-custom" name="addaricle" type="checkbox">
							</c:otherwise>
							</c:choose>	
							<label for="checkbox-3" class="checkbox-custom-label">항목추가</label></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</form>


	<script type="text/javascript">
		var count = ${valist.size()} + 1;
	</script>
	
		<script src="<c:url value="/script/study/vote.js"/>"></script>

</body>
</html>