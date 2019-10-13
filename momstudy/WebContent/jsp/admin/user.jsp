<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include_main_top.jsp"%>

<div id="box-4">
	<!-- box two content -->
	<form class="saerch">
		<select name="" id="">
			<option value="">회원명</option>
			<option value="">?1</option>
			<option value="">?2</option>
		</select> <input type="text" name="" placeholder="saerch">
		<button>검색</button>
	</form>
	<table>
		<thead>
			<th>이름</th>
			<th>아이디</th>
			<th>개설 스터디 수</th>
			<th>가입 스터디수</th>
			<th>정지기간</th>
			<th>신고된 횟수</th>
		</thead>
		<tbody>
		<c:forEach var="report" items="${list}">
				<tr>
					<td>${report.name }</td>
					<td>${report.email }</td>
					<td>${report.openCnt }</td>
					<td>${report.joinCnt}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="" /></td>
					<td>${report.cnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

</div>

</div>

</div>

</div>
</section>
</body>

</html>