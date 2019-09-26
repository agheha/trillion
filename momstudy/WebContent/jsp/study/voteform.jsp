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
	<form name="myform" action="<c:url value="/study/vote.do" />" method="post">
		<div class="poll-container">
			<div class="poll-voter">
				<span class="poll-title">${vote.title}</span>
				<button class="vote-btn" onclick="votesubmit(2)">투표</button>
				<a href='<c:url value="/study/deletevote.do?num="/>${vote.num}'><button class="vote-btn" type="button" id="deletevote">삭제</button></a>
				<a href='<c:url value="/study/voteupdateform.do?num="/>${vote.num}'><button class="vote-btn" type="button" id="deletevote">수정</button></a>
				<hr style="border: none; height: 2px; background: grey;">
				<table class="poll-list">
					<tbody id=aricle>
						<c:forEach var="aricle" items="${valist}">
							<tr class="vote-row">
								<td colspan="2" class="poll-option"><p>${aricle.content}</p>
									<div class="poll-option-bar"></div>
								<c:choose>
									<c:when test="${vote.duplication eq 2}">
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
					<c:if test="${vote.ariclePlus == 1}">
						<tr id="addbutton">
							<td colspan="3"><button type="button" class="vote-btn-add"
									onclick="add_tr(this)">항목추가</button></td>
						</tr>
					</c:if>
					</tfoot>
				</table>
			</div>
		</div>
	</form>



	<script type="text/javascript">
		function add_tr(obj) {
			var str = "" 
			str = `<td class="poll-option"><input type="text" name="addAricle" placeholder="항목을 입력해주세요.">
						<div class="poll-option-bar"></div>
					
					<button  class="vote-btn-remove" onclick='votesubmit(1)'>등록</button>
					<input type="hidden" value="${vote.num}" name="num"/>
					<button type="button" class="vote-btn-remove"
						onclick="remove_tr(this)">삭제</button>
					</td>`;

			var tr = document.createElement('tr');
			tr.className = "vote-row";
			tr.innerHTML = str;
			document.getElementById('aricle').appendChild(tr);
			document.getElementById('addbutton').removeChild(obj.parentNode);

		}

		function remove_tr(obj) {
				document.getElementById('aricle').removeChild(
						obj.parentNode.parentNode);
				var str = "";
				str = `<td colspan="3"><button type="button" class="vote-btn-add"
									onclick="add_tr(this)">항목추가</button></td>`;		
				var td = document.createElement('td');
				td.innerHTML = str;
				document.getElementById('addbutton').appendChild(td)	

		}
		function votesubmit(index){
			
		if(index == 1){
		document.myform.action=`<c:url value="/study/addaricle.do" />`;
		}
		if(index == 2){
			document.myform.action=`<c:url value="/study/vote.do" />`;
		}
		}
		
		
		
		window.history.forward();

		function noBack() {

			window.history.forward();

		}

	</script>



</body>
</html>