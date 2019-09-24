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
	<form action="<c:url value="/study/votewrite.do" />" method="post">
		<div class="poll-container">
			<div class="poll-voter">
				<span class="poll-title"><input type="text" name="title" placeholder="투표 제목을 입력해주세요."></span>
				<button class="vote-btn">투표등록</button>
				<hr style="border: none; height: 2px; background: grey;">
				<table class="poll-list">
					<tbody id="aricle">

						<tr class="vote-row" id="aricle-row">
							<td class="poll-option">
									<input type="text" name="aricle" placeholder="항목을 입력해주세요.">
								<div class="poll-option-bar"></div>
							</td>
							<td><button type="button" class="vote-btn-remove" onclick="remove_tr(this)">삭제</button></td>
						</tr>

						

						<tr class="vote-row">
							<td class="poll-option">
									<input type="text" name="aricle" placeholder="항목을 입력해주세요.">
								<div class="poll-option-bar"></div>
							</td>
							<td><button type="button" class="vote-btn-remove" onclick="remove_tr(this)">삭제</button></td>
						</tr>


					</tbody>
					
					<tfoot>
					
						
						<tr>
							<td colspan="2"><button type="button" class="vote-btn-add" onclick="add_tr()">항목추가</button></td>
						</tr>
						<tr>
							<td colspan="2"><hr style="border: none; height: 2px; background: grey;"></td>
						</tr>
						<tr>
							<td><label for="duplication">중복투표</label></td><td><input type="checkbox" name="duplication" id="duplication"/></td>
						</tr>
						<tr>
							<td><label for="anonumous">익명투표</label></td><td><input type="checkbox" name="anonumous" id="anonumous"/></td>
						</tr>
						<tr>
							<td><label for="addaricle">항복추가가능</label></td><td><input type="checkbox" name="addaricle" id="addaricle"/></td>
						</tr>
					</tfoot>

				</table>
			</div>
		</div>
	</form>


	<script type="text/javascript">
		function add_tr() {
			var tr = document.createElement('tr');
			tr.innerHTML = document.getElementById('aricle-row').innerHTML;
			document.getElementById('aricle').appendChild(tr);
		}	
		
		function remove_tr(obj) {
			if(document.getElementsByTagName("tr").length > 3){
			document.getElementById('aricle').removeChild(obj.parentNode.parentNode);
			} else {
				alert("항목은 2개 이상 입력해야합니다.")
			}
		}
	</script>

</body>
</html>