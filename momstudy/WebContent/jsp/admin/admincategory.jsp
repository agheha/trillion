<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include_main_top.jsp"%>

<div id="box-7">
	<!-- box two content -->
	
	<form action="categoryinsert.do" name="catform" class="add">
		<input type="text" name="categoryName" id="categoryadd">
		<button id="cadd">등록</button>
	</form>
	<form action="categorydelete.do" name="mform">

		<span id="categorytitle">카테고리</span>

		<div id="category">

			<table id="category_table">
				<thead>
					<th>카테고리명</th>
					<th>개설 스터디수</th>
					<th>삭제 <input type="checkbox" id="all" onclick="allCheck()"></th>
				</thead>
				<tbody>
					<c:forEach var="list" items="${list }">
						<tr>
							<td>${list.categoryName }</td>
							<td>${list.studycnt }</td>
							<td class="delete"><input type="checkbox" name="categoryCode"
								value="${list.categoryCode }"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<button id="del2">삭제</button>
	</form>
</div>

</div>

</div>

</div>

</div>
</section>
<script src="<c:url value="/script/admin/allChechk.js"/>"></script>
</body>

</html>