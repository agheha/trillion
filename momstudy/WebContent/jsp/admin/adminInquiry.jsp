<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="include_main_top.jsp"%>

<div id="box-8">
	<!-- box two content -->
	<table>
		<thead>
			<th>작성자</th>
			<th>작성날짜</th>
			<th>답변유무</th>
			<th>제목</th>
		</thead>
		<tbody>
			<c:forEach var="question" items="${list}">
				<tr onclick="mopen(),Qajax(${question.num})">
					<td>${question.email}: ${question.num}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${question.regDate}" /></td>

					<td>${question.condition}</td>

					<td>${question.title}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div id="prpop">
	<div id="prpop_content">
		<div id="b_main">
			<div id="Qemail">
				<div>이메일</div>
				<div id="Qemail2" class="Qemail2">?</div>
			</div>
			<br />
			<div id="Qtitle">
				<div>제목</div>
				<div id="Qtitle2">?</div>
			</div>
			<div id="Qtext">내용</div>
			<!-- 뿌려줌 답변댓글들(왠만하면 1개) -->

			<table id="comment">
				<tr>
					<td>관리자 아이디 님의 답변함</td>
				</tr>
			</table>

			<button type="button" id="Qbtn" onclick="mopen1()">답변하기</button>
			>
		</div>
		<div id="prpoplayer" onclick="mclose()"></div>
	</div>
</div>

<div id="prpop1">
	<div id="prpop_content1">
		<div id="b_main">
			<div id="Qdemail">
				<div>이메일</div>
				<div class="Qemail2">이름</div>
			</div>
			<div id="Qdtext">
				<form action="inquiryinsert.do" method="post" name="Qform" id="Qform">
					<input type="hidden" name="Qademail" value="${user.email}">
					<input type="hidden" name="commentGroupCode" id="commentGroupCode">
					<textarea name="Qcontent" id="Qcontent"></textarea>
					<br />
					<button id="Qbtn">답변</button>
				</form>
			</div>
		</div>
	</div>
</div>

<%@include file="/jsp/common/pagination.jsp" %>



</div>

</div>

</div>

</div>
</section>
<script type="text/javascript" src="<c:url value='/script/Qajax.js'/>"></script>
</body>
</html>