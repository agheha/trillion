<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href='<c:url value="/css/pagination.css" />'>


	<div class="totalContent">
		<div class="pageContent">
			<c:if test="${pr.prev}">
				<div class="prev">이전</div>
			</c:if>
			<form action="#" method="post" name="pForm">
				<input type="hidden" value="${search.filter}" name="filter">
				<input type="hidden" value="${search.keyword}" name="keyword">
				<input type="hidden" value="${search.type}" name="type">
				<input type="hidden" value="${search.addrCodes}" name="addressCode"> 
				<input type="hidden" value="${search.categoryCode}" name="categoryCode">
				<input type="hidden" value="" name="pageNo" id="pageNo">
				<ul class="page">
					<c:forEach begin="${pr.beginPage}" end="${pr.endPage}" varStatus="status">
						<li class="lis" <c:if test="${pr.pageNo eq (pr.beginPage + status.count-1)}"> id="checked" </c:if>>${pr.beginPage + status.count-1}</li>
					</c:forEach>

				</ul>
				<c:if test="${pr.next}">
					<div class="next">다음</div>
				</c:if>
			</form>
		</div>
		<div class="searchContent">
		<form name="sForm" action="#" method="post" >
			 <select name="filter" id="filter">
			 		<c:forEach var="filter" items="${search.filters}">
					<option value="${filter[0]}">${filter[1]}</option>
			 		</c:forEach>
				</select>
		
				<select name="type">
					<c:forEach var="type" items="${search.types}">
					<option value="${type[0]}">${type[1]}</option>
			 		</c:forEach>		
				</select>
				
				<div>
					<input type="text" name="keyword" />
					<div class="divbt" id="searchbtn"></div>				
				</div>
				<input type="hidden" name="addressCode" value="${search.addrCodes}">;
		</form>
		</div>
	</div>
	<script src="<c:url value="/script/common/pagination.js" />"></script>
