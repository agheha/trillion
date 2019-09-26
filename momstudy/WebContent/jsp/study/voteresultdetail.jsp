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
				<a href="<c:url value="/study/votelist.do" />"><button class="vote-btn">목록</button></a>
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
	</script>



</body>
</html>