<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include_main_top.jsp"%>
<!-- 조심 -->
<div id="box-1">
	<!-- box two content -->
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
				<tr class="adhobor" onclick="mopen(),userAjax(${report.num})">
					<td>${report.reseaon }</td>
					<td>${report.reportTarget }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${report.regDate}" /></td>
					<td>${report.email}</td>
					<td>${report.rpcnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div id="prpop">
	<div id="prpop_content">
	
	</div>
</div>

<div id="prpop1">
	<div id="prpop_content1">
	
	</div>
</div>
<%@include file="/jsp/common/pagination.jsp" %>
</div>

</div>

</div>

</div>
</section>
<script type="text/javascript"
	src="<c:url value='/script/admin/userAjax.js'/>">
</script>
<script type="text/javascript"
	src="<c:url value='/script/admin/userDtailAjax.js'/>">
</script>

</body>

</html>

