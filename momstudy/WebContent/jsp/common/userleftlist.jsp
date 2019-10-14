 ﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href='<c:url value="/css/sidebar.css" />'>
<style>
#upload {
	display: block;
	width: 220px;
	height: 52px;
	color: #fff;
	background-color: #4d4d4d;
	border: none;
	border-radius: 3px;
	line-height: 50px;
	text-align: center;
	cursor: pointer;
}
</style>
<body>
	<%@include file="/jsp/common/usermodal.jsp"%>

	<div class="left_list">
		<div>
			<c:choose>
				<c:when test="${user.fileGroupCode} == 0">
					<div class="profile">
						<img src="<c:url value="/images/user_basic_img.png" />"
							width="200" height="200" alt="testImg">
					</div>
				</c:when>
				<c:otherwise>
					<div class="profile">
						<img
							src="<c:url value="/util/download.do?fgno=${user.fileGroupCode}" />"
							width="200" height="200" alt="testImg">
					</div>
				</c:otherwise>
			</c:choose>
			<div>

				<form method="post" enctype="multipart/form-data" name="fForm"
					action="<c:url value="/user/myimg.do?path=user"/>">

					<label id="upload" for="file">이미지수정</label> <input type="file"
						id="file" name="file" onchange="changeValue(this)"
						style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;" />
				</form>
			</div>
			<ul>
				<li><a id="passUpdate">비밀번호 변경</a></li>
				<li><a href="<c:url value="/jsp/user/deleteuser.jsp"/>">회원탈퇴</a></li>
				<li><a id="admin">스터디 관리</a></li>
				<form name="adminForm" action="" method="post">
					<ul class="admin">
						<li><div class="space"></div><a class="adminele" go="<c:url value="/user/participant.do"/>">스터디 신청 내역</a></li>
						<li><div class="space"></div><a class="adminele" go="<c:url value="/study/adminmember.do"/>">스터디 신청 철회</a></li>
						<li><div class="space"></div><a class="adminele" go="<c:url value="/study/adminaprovalmember.do"/>">스터디 탈퇴 </a></li>
					</ul>
				</form>
			</ul>
		</div>
	</div>
	<script src="<c:url value="/script/user/usermodal.js" />"></script>
	<script src="<c:url value="/script/user/userimg.js" />"></script>
	<script src="<c:url value="/script/user/imgupdate.js" />"></script>
	<script>
		let bAdmin = document.querySelector("#admin");
		let admin = document.querySelector(".admin");
		let aForm = document.adminForm;
		
		let adminEle = document.querySelectorAll(".adminele");
		
		adminEle.forEach((ele) =>{
			ele.addEventListener('click',()=>{
				aForm["action"] = ele.getAttribute("go");
				 aForm.submit();
			})
		})
		
		console.log(bAdmin);
		
		function goMain(){
			let f = document.goForm;
			f.submit();
		}
		
		bAdmin.addEventListener('click',()=>{
			bAdmin.classList.toggle("clicked");
			admin.classList.toggle("admin")
		})
	</script>
</body>
</html>