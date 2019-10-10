<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include_main_top.jsp"%>

<script type="text/javascript" src="../../../script/admin_main_allDelete/allChechk.js"></script>

<div id="box-6">
	<!-- box two content -->
	<form action="" method="get" class="saerch-board">
		<select name="" id="">
			<option value="">게시판명</option>
			<option value="">?1</option>
			<option value="">?2</option>
			<option value="">?3</option>
		</select> 
		<select name="" id="">
			<option value="">회원명</option>
			<option value="">?1</option>
			<option value="">?2</option>
		</select> <input type="text" name="" placeholder="saerch">
		<button>검색</button>
	</form>
	<form action="" method="post" name="mform">
		<table>
			<thead>
				<tr>
					<th>스터디명</th>
					<th>글제목[댓글수]</th>
					<th>닉네임(글쓴이 아이디)</th>
					<th>게시 날짜</th>
					<th>조회수</th>
					<th>추천수</th>
					<th>신고수</th>
					<th>삭제  <input type="checkbox" id="all" onclick="allCheck();"></th>
				<tr>
			</thead>
			<tbody>
				<%-- <c:forEach var="box1" items="${list}"> --%>
				<tr>
					<td>
						<%-- ${ } --%>
					</td>
					<td>
						<%-- ${ } --%>
					</td>
					<td>
						<%-- ${ } --%>
					</td>
					<td>
						<%-- ${ } --%>
					</td>
					<td>
						<%-- ${ } --%>
					</td>
					<td>
						<%-- ${ } --%>
					</td>
					<td>
						<%-- ${ } --%>
					</td>

					<td class="delete"><input type="checkbox" name="dleNo"
						value="<%-- ${ } --%>"></td>

				</tr>
				<%-- </c:forEach> --%>
			</tbody>
		</table>
		<button id="del1" type="button">삭제</button>
	</form>
</div>

</div>

</div>

</div>

</div>
</section>
</body>

</html>