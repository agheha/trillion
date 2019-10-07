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
<link rel="stylesheet" here="./../css/study_layout.css">

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
					<img src="./../images/test_img2.jpg" width="200" height="200"
						alt="testImg">
					<button></button>
				</div>
				<ul>
					<li><a href="<c:url value='/jsp/user/updatepass.jsp' />">비밀번호
							변경</a></li>
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
						<div>
							<div class="subtitle">이메일</div>
							<input class="inputbox" type="text" placeholder="${user.email}"
								disabled="disabled" />
						</div>
						<div>
							<div class="subtitle">이름</div>
							<input class="inputbox" type="text" placeholder="${user.name}"
								disabled="disabled" />
						</div>
						<div>
							<div class="subtitle">휴대전화번호</div>
							<input class="inputbox" type="text"
								placeholder="${user.phoneNum}" disabled="disabled" />
						</div>
						<div>
							<div class="subtitle">관심분야</div>
						</div>
						<form action="<c:url value='/user/updateinfo.do' />"
							onsubmit="doAction()" )>
							<ul>
								<c:forEach items="${cateList}" var="category">
									<li><input type="checkbox" name="category"
										value="${category.categoryCode}" /> <label>${category.categoryName}</label>
									</li>
								</c:forEach>
							</ul>
							<div>
								<div class="subtitle">관심 지역</div>
							</div>
							<div class="category_wrap" id="area">
								<ul>
									<c:forEach items="${bigAddr}" var="bigAddr" varStatus="loop">
										<li><a href="#" onclick="show(${loop.count})"
											id="baddr${loop.count}" value="addr${loop.count}">${bigAddr.addressDetail}
												<span> ${bigAddr.count} </span>
										</a></li>
									</c:forEach>
								</ul>
							</div>
							<div class="category_wrap">
								<div id="showArea">
									<c:forEach items="${bigAddr}" var="bigAddr" varStatus="loop">

										<ul style="display: none" id="addr${loop.count}">
											<c:forEach items="${smallAddr}" var="smallAddr" varStatus="i">
												<c:if
													test="${bigAddr.addressDetail eq smallAddr.addressDetail}">
													<li><input id="add${i.count}" type="checkbox"
														name="userAddr" sAdd="${smallAddr.addressDetail2}"
														value="${smallAddr.addressCode}" /> <label
														for="add${i.count}">${smallAddr.addressDetail2}</label></li>
												</c:if>
											</c:forEach>
										</ul>
									</c:forEach>
								</div>
							</div>
<<<<<<< HEAD
							<div class="category_wrap" id="selArea"></div>
							<button>수정</button>
=======
							<button class="submit_btn">수정</button>
>>>>>>> master
						</form>
					</div>
				</div>
			</div>

			<!-- 달력부분 -->
		</div>
	</section>

	<script type="text/javascript">
		
		
		// 유저가 선택한 관심지역 추가 
		let selectAreas = [
			<c:forEach items="${userArea}" var="userArea">
			<c:out value="${userArea.addressCode}" />,
			</c:forEach>
		]
		
		let userAreas = document.querySelectorAll('input[name="userAddr"]')
		
		userAreas.forEach(area => {			
			selectAreas.forEach(addressCode => {
				if (addressCode === parseInt(area.value)) {
					area.checked = true
				}		
			})
		})
	
		function doAction() {
			alert("수정이 완료되었습니다.")
		}
		
		function show() {
			
			let ulEle = document.querySelectorAll("#showArea > ul");
			
			ulEle.forEach((ele) => {
				ele.style.display="none"
			})
			
			let area = document.querySelector("#area").value
			
			ulEle.forEach((ele)=> {
				if(area === ele.id) {
					ele.style.display="block";
				}
			})
		}
		
		
		
	</script>
</body>
</html>