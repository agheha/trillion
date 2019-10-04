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
<link rel="stylesheet" href="./../css/userinfo.css">

<title>계정관리</title>
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
					<li><a href="#">회원탈퇴</a></li>
				</ul>
			</div>
		</div>

		<div class="heightAuto">
			<!-- 우측 상당 슬라이드 -->
			<div class="right_top_cont">
				<div class="title">기본정보</div>
				<div>
					<div class="slide_wrap">
						<div class="">
							<div class="subtitle">이메일</div>
						</div>
						<div>
							<input class="inputbox" type="text" placeholder="${user.email}" disabled="disabled"/>
						</div>
						<div>
							<div class="subtitle">이름</div>
						</div>
						<div>
							<input class="inputbox" type="text" placeholder="${user.name}" disabled="disabled"/>
						</div>
						<div>
							<div class="subtitle">휴대전화번호</div>
						</div>
						<div>
							<input class="inputbox" type="text" placeholder="${user.phoneNum}" disabled="disabled"/>
						</div>
						<div>
							<div class="subtitle">관심분야</div>
						</div>
						<form action="<c:url value='/user/updateinfo.do' />" >
							<div>
								<div>
									<ul>
										<c:forEach items="${cateList}" var="category">
											<li>
												<input id="it" type="checkbox" name="category"
												value="${category.categoryCode}"/> <label for="it">${category.categoryName}</label>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div>
								<div class="subtitle">지역</div>
							</div>
							<div>
								<div>
	<!-- 							<ul> -->
	<!-- 								<c:forEach items="${cateList}" var="category"> -->
	<!-- 									<li><input id="it" type="checkbox" name="category" -->
	<!-- 										value="${category.categoryCode}"/> <label for="it">${category.categoryName}</label> -->
	<!-- 									</li> -->
	<!-- 								</c:forEach> -->
	<!-- 							</ul> -->
								</div>
							</div>
						<button>수정</button>
						</form>
					</div>
				</div>
			</div>

			<!-- 달력부분 -->
		</div>
	</section>

	<script type="text/javascript">

		let aaa = [
			<c:forEach items="${userCate}" var="usercategory">
				<c:out value="${usercategory.categoryCode}" />,
			</c:forEach>
		];
	
		console.log(aaa)
		let categorys = document.querySelectorAll('input[name="category"]');
		categorys.forEach(category => {			
			aaa.forEach(categoryCode => {
				if (categoryCode === parseInt(category.value)) {
					category.checked = true
				}		
			})
		})
		
		
		
	</script>
</body>
</html>