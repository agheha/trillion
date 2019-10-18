<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include_main_top.jsp"%>

<div id="box-4">
	<!-- box two content -->
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
				<tr class="adhobor" onclick="mopen(),userDtailAjax1('${report.email}')">
					<td>${report.name }</td>
					<td>${report.email }</td>
					<td>${report.openCnt }</td>
					<td>${report.joinCnt}</td>
					<c:if test="${report.banDate eq null}">
					<td>없음</td>
					</c:if>
					<c:if test="${report.banDate ne null}">
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${report.banDate}" /></td>
					</c:if>
					<td>${report.rpcount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div id="prpop">
	<div id="prpop_content">
	
	</div>
</div>

<%@include file="/jsp/common/pagination.jsp" %>

</div>

</div>

</div>

</div>
</section>
<script type="text/javascript"
	src="<c:url value='/script/admin/userDtailAjax1.js'/>">
</script>
</body>

</html>