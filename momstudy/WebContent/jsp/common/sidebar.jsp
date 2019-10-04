<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div>
		<div class="profile">
			<img src="<c:url value="/images/test_img2.jpg" />" alt="testImg">
		</div>
		<div class="left_list">
			<div>
					<form name="myForm" action="<c:url value="/study/studymain.do"/>" method="post">
				<p>
					<a href="#" onclick="goMain();">${study.name}</a>
				</p>
					<input type="hidden" value="${study.num}" name="num"/> 
					</form>
				<ul>
					<!-- 스터디장 화면 다르게 보임 -->
					<li><a href="./studymembers.html">멤버</a></li>
					<li><a href="<c:url value="/study/votelist.do"/>">투표</a></li>
					<li><a href="./studyschedule.html">일정</a></li>
					<li><a href="<c:url value="/board/votelist.do"/>">게시판</a></li>
				</ul>
				</form>
			</div>
		</div>
	</div>
<script>
	function goMain(){
		let f = document.myForm;
		f.submit();
	}
</script>