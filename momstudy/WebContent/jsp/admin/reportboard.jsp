<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include_main_top.jsp"%>

<div id="box-2">
	<!-- box two content -->
	<table>
		<thead>
			<th>신고사유</th>
			<th>게시판 명</th>
			<th>글 제목</th>
			<th>신고된 날짜</th>
			<th>신고한 사람id</th>
			<th>신고된 횟수</th>
		</thead>
		<tbody>
			<c:forEach var="report" items="${list}">
					<c:set value="${report.boardType}" var="boardType"></c:set>
				<tr onclick="mopen(),boardAjax(${report.num})">
					<td>${report.reseaon}</td>

					<c:choose>
						<c:when test="${boardType eq 'recruit'}">
							<td>스터디 모집게시판</td>
						</c:when>
						<c:when test="${boardType eq 'free' and report.studyNum eq 0 }">
							<td>자유 게시판</td>
						</c:when>
						<c:when test="${boardType eq 'free' and report.studyNum ne 0 }">
							<td>${report.studyNum}번 스터디 게시판</td>
						</c:when>
						<c:when test="${boardType eq 'review'}">
							<td>후기게시판</td>
						</c:when>
					</c:choose>

					<td>${report.boardTitle }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${report.regDate}" /></td>
					<td>${report.email }</td>
					<td>${report.rpcnt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div id="prpop">
	<div id="prpop_content">
		<div id="b_main">
			<div class="b_content">
				<div>글</div>
				<div id="board_title" >글 제목</div>
				<div id="board_type"> 게시판명</div>
			</div>
			<div class="b_content" id="re_email">
				<div>신고자</div>
				<div id="board_email" >신고자 이메일</div>
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
</section>
<script type="text/javascript"
	src="<c:url value='/script/admin/boardAjax.js'/>">
</script>
<script type="text/javascript"
	src="<c:url value='/script/admin/userDtailAjax.js'/>">
</script>
</body>

</html>
