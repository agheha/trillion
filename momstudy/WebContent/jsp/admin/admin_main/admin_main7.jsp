<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include_main_top.jsp"%>

<script type="text/javascript" src="../../../script/admin_main_allDelete/allChechk.js"></script>
<div id="box-7">
	<!-- box two content -->
	<form class="saerch-ca">
		<button type="button" onclick="">추가</button>
		
		<select name="" id="">
			<option value="">회원명</option>
			<option value="">?1</option>
			<option value="">?2</option>
		</select> <input type="text" name="" placeholder="saerch">
		<button>검색</button>
	</form>
	<form action="" name="mform">
	<table>
		<thead>
			<th>카테고리명</th>
			<th>개설 스터디수</th>
			<th>삭제 <input type="checkbox" id="all" onclick="allCheck();"></th>
		</thead>
		<tbody>
			<%-- <c:forEach var="box1" items="${list}"> --%>
			<tr>
				<td><%-- ${ } --%></td>
				<td><%-- ${ } --%></td>
				<td class="delete"><input type="checkbox" name="dleNo" value="<%-- ${ } --%>"></td>
			</tr>
			<%-- </c:forEach> --%>
		</tbody>
	</table>
	<button type="button" id="del2">삭제</button>
	</form>
</div>

</div>

</div>

</div>

</div>
</section>
</body>

</html>