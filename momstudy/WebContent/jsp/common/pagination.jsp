<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<style>

.totalContent{
	width: 100%;
	background: rgb(243, 243, 243);	
}
.pageContent {
	width: max-content;
	margin: auto;
	list-style-type: none;
	height: 40px;
}

.searchContent {
	width: max-content;
	margin: auto;	
	list-style-type: none;
	height: 40px;
	line-height: 40px;
}

.check {
	background: white;
	border: 1px solid  rgb(243, 243, 243);	
	color: rgb(245, 181, 63);
}

.lis {
	    box-sizing: border-box;
    float: left;
    height: 40px;
    width: 40px;
    line-height: 26px;
        text-align: center;
    border: 5px solid  rgb(243, 243, 243);	
}

.prev, .next {
	width: 33px;
	height: 100%;
	text-align: center;
	line-height: 45px;
}

.prev {
	float: left;
}

.next {
	float: right;
}

.page {
	float: left;
	width: max-content;
}

.lis:hover {
	  text-decoration: underline;
	  cursor: pointer;
}


.searchContent > form > input, .searchContent > form > select, .searchContent > form > div {
	height: 30px;
}

.searchContent > form > div {
	float: right;
    width: 60px;
    text-align: center;
    line-height: 30px;
	font-size: 13px;
	position: relative;
	top: 5px;	
	background: rgb(44, 44, 44);
    color: white;
}
.line{
	border-top: 1px solid rgb(223, 223, 223);
}

</style>
</head>
<body>
	<div class="totalContent">
		<div class="pageContent">
			<c:if test="${pr.prev}">
				<div class="prev">이전</div>
			</c:if>
			<form action="#" method="post" name="pForm">
				<input type="hidden" value="${search.filter}" name="filter">
				<input type="hidden" value="${search.keyword}" name="keyword">
				<input type="hidden" value="${search.type}" name="type"> <input
					type="hidden" value="${search.categoryCode}" name="categoryCode">
				<input type="hidden" value="" name="pageNo" id="pageNo">
				<ul class="page">
					<c:forEach begin="${pr.beginPage}" end="${pr.endPage}"
						varStatus="status">
						<li class="lis"
							<c:if test="${pr.pageNo eq (pr.beginPage + status.count-1)}">
				id="checked"
			</c:if>>${pr.beginPage + status.count-1}</li>
					</c:forEach>

				</ul>
				<c:if test="${pr.next}">
					<div class="next">다음</div>
				</c:if>
			</form>
		</div>
		<div class="line"></div>
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

				<input type="text" name="keyword" />
				<div class="divbt" id="searchbtn">검색</div>
		</form>
		</div>
	</div>
	<script>
		let p = document.pForm;
		let s = document.sForm;
		let lis = document.querySelectorAll(".lis");
		let checkedEle = document.querySelector("#checked");
		checkedEle && checkedEle.classList.add("check");
		let searchbtn = document.querySelector("#searchbtn");
		searchbtn.addEventListener('click',(e)=>{
			s.submit();
		})
		lis.forEach((ele)=>{
			ele.addEventListener('click',(e)=>{
				document.querySelector("#pageNo").value = e.target.innerText;
				p.submit();
			})
		})
	</script>
</body>
</html>