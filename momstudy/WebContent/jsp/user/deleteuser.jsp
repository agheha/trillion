<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href="./../css/common.css">
<link rel="stylesheet" href="./../css/header.css">
<link rel="stylesheet" href="./../css/layout.css">
<link rel="stylesheet" href="./../css/deleteuser.css">

<title>비밀번호 변경</title>
<!-- full calendar -->




</head>
<body>
	<header id="header"></header>

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>계정관리</h1>
			<hr>
		</div>
	</section>

	<section id="layout">

		<div class="left_list">
			<div>
          	 <div class="profile">
                <img src="./../images/test_img2.jpg" width="200" height="200" alt="testImg">
            </div>
            <div>
            	<button>이미지수정</button>
            </div>
				<ul>
					<li><a href="<c:url value='/jsp/user/updatepass.jsp' />">비밀번호 변경</a></li>
					<li><a href="<c:url value='/jsp/user/deleteuser.jsp' />">회원탈퇴</a></li>
				</ul>
			</div>
		</div>

		<div class="heightAuto">
			<!-- 우측 상당 슬라이드 -->
			<div class="right_top_cont">
				<div class="title">비밀번호 변경</div>
				<div>
					<div class="slide_wrap">
						<form name ="pForm" action="<c:url value='/user/updateinfo.do' />" method="post" onsubmit="return chkpass()" >
							<div>
								<div class="subtitle">변경 비밀번호</div>
							</div>
							<div>
								<input class="inputbox" type="text" name="pass1" autocomplete="off"/>
							</div>
							<div>
								<div class="subtitle">비밀번호 확인</div>
							</div>
							<div>
								<input class="inputbox" type="text" name="pass2" autocomplete="off"/>
							</div>
							<div>
								<button>확인</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- 달력부분 -->
		</div>
	</section>

	<script type="text/javascript">		
		
	</script>
</body>
</html>