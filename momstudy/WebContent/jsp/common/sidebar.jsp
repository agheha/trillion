<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href='<c:url value="/css/sidebar.css" />'>
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
					<li><a href="studymembers.html">멤버</a></li>
					<li><a href="<c:url value="/study/votelist.do"/>">투표</a></li>
					<li><a href="./studyschedule.html">일정</a></li>
					<li><a href="<c:url value="/board/votelist.do"/>">게시판</a></li>
					<c:if test="${user.email eq study.email}">
					<li><a id="admin">스터디 관리</a></li>
						<ul class="admin">
							<li><a class="adminele">정보 관리</a></li>
							<li class="adminele"><a>멤버 관리</a></li>
							<li class="adminele"><a>모집글 관리</a></li>
						</ul>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
<script>
	let bAdmin = document.querySelector("#admin");
	let admin = document.querySelector(".admin");
	console.log(bAdmin);
	function goMain(){
		let f = document.myForm;
		f.submit();
	}
	
	bAdmin.addEventListener('click',()=>{
		bAdmin.classList.toggle("clicked");
		admin.classList.toggle("admin")
	})
	

</script>