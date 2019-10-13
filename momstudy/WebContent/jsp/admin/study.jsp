<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include_main_top.jsp"%>

<div id="box-5">
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
			<th>스터디 분야</th>
			<th>스터디 명</th>
			<th>방장 아이디</th>
			<th>개설 날짜</th>
			<th>지역</th>
			<th>팀원 수</th>
		</thead>
		<tbody>
			<c:forEach var="report" items="${list}">
				<tr>
					<td>${report.categoryName }</td>
					<td>${report.name }</td>
					<td>${report.email }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${report.regDate}" /></td>
					<td>${report.addressDetail} ${report.addressDetail2}</td>
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