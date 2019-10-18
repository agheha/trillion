<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include_main_top.jsp"%>

<div id="box-3">
	<!-- box two content -->
	<table>
		<thead>
			<th>신고사유</th>
			<th>스터디분야</th>
			<th>스터디명</th>
			<th>신고된 날짜</th>
			<th>신고한 사람id</th>
			<th>신고된 횟수</th>
		</thead>
		<tbody>
			<c:forEach var="report" items="${list}">
				<tr class="adhobor" onclick="mopen(),studyAjax(${report.num})">
					<td>${report.reseaon }</td>
					<td>${report.categoryName }</td>
					<td>${report.studyTitle }</td>
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
		<div id="b_main">
			<div class="b_content">
				<div>스터디명</div>
				<div id="s_title">스터디 명</div>
				<div id="s_type"> 스터디 분야</div>
			</div>
			<div class="b_content" id="s_cap">
				<div>스터디 장</div>
				<div id="s_cap">스터디 장 아이디</div>
			</div>
			<div class="b_content" id="s_email">
				<div>신고자</div>
				<div id="s_email">신고자 이메일</div>
			</div>
			<div class="b_content">
				<div>신고사유</div>
				<div id="con1">신고사유 내용</div>
			</div>
			<div id="b_content">내용</div>
		</div>
		<div id="prpoplayer" onclick="mclose()"></div>
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
	src="<c:url value='/script/admin/studyAjax.js'/>">
</script>
<script type="text/javascript"
	src="<c:url value='/script/admin/userDtailAjax.js'/>">
</script>
</body>

</html>