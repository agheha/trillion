<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
			<div class="profile">
				<img id="myimg" src="<c:url value="/images/test_img2.jpg"/>" width="200"
					height="200" alt="testImg">
			</div>
			<div>
				<form name="fForm" action="<c:url value="/test/fileupload.do"/>">
					<label id="upload" for="file">이미지수정</label> <input type="file"
						id="file" name="file" onchange="changeValue(this)"
						style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;" />
				</form>
			</div>
			<ul>
				<li><span id="passUpdate">비밀번호 변경</span></li>
				<li><span id="userDelete">회원탈퇴</span></li>
			</ul>
		</div>
	</div>
	<script src="<c:url value="/script/user/usermodal.js" />"></script>
	<script src="<c:url value="/script/user/userimg.js" />"></script>

</body>
</html>