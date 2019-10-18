<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include_main_top.jsp"%>

<div id="box-5">
	<!-- box two content -->
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
					<td class="adhobor" onclick="mopen(),userDtailAjax1('${report.email}')">${report.email }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${report.regDate}" /></td>
					<td>${report.addressDetail} ${report.addressDetail2}</td>
					<td>${report.member}</td>
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