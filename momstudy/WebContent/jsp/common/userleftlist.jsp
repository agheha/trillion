<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/jsp/common/usermodal.jsp" %>
	
	<div class="left_list">
			<div>
				<div class="profile">
					<img src="<c:url value="/images/test_img2.jpg"/>" width="200"
						height="200" alt="testImg">
				</div>
				<div>
					<input type="file" id="file" name="file" onchange="changeValue(this)"
					style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;"/>
					<button type="button" id="btn-upload">이미지수정</button>
				</div>
				<ul>
					<li><span id="passUpdate">비밀번호 변경</span></li>
					<li><span id="userDelete">회원탈퇴</span></li>
				</ul>
			</div>
		</div>
		<script src="<c:url value="/script/user/userimg.js" />"></script>
		<script src="<c:url value="/script/user/usermodal.js" />"></script>
		
</body>
</html>