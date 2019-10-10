<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include_main_top.jsp"%>
<!-- 조심 -->
<div id="box-1">
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
			<th>신고사유</th>
			<th>이메일</th>
			<th>신고된 날짜</th>
			<th>신고한 사람</th>
			<th>신고된 횟수</th>
		</thead>
		<tbody>
			<c:forEach var="report" items="${list}">
				<tr>
					<td>${report.reseaon }</td>
					<td>${report.reportTarget }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${report.regDate}" /></td>
					<td>${report.email }</td>
					<td>${report.cnt }</td>
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

