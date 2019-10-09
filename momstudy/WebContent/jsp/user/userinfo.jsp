<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/css/layout.css"/>">
<link rel="stylesheet" href="<c:url value="/css/userinfo.css"/>">
<link rel="stylesheet" href="<c:url value="/css/study_layout.css"/>">



<title>계정관리</title>
<!-- full calendar -->




</head>
<body>
	<header id="header">
		<%@include file="/jsp/common/header.jsp" %>	
	</header>
	
    <!-- The Modal -->
   		

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>계정관리</h1>
			<hr>
		</div>
	</section>
 
	
	<section id="layout">
	   	<%@include file="/jsp/common/userleftlist.jsp" %>	
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
							onsubmit="doAction()">
							<ul>
								<c:forEach items="${cateList}" var="category" varStatus="i">
									<li><input type="checkbox" name="category" id="cate${i.count}"
										value="${category.categoryCode}" /> <label for="cate${i.count}">${category.categoryName}</label>
									</li>
								</c:forEach>
							</ul>
							<div>
								<div class="subtitle">관심 지역</div>
							</div>
							<div class="category_wrap" id="area">
								<ul>
									<c:forEach items="${bigAddr}" var="bigAddr" varStatus="loop">
										<li><a href="#1" onclick="show(${loop.count})" id="baddr${loop.count}" value="addr${loop.count}">${bigAddr.addressDetail}
												<span> ${bigAddr.count} </span>
										</a></li>
									</c:forEach>
								</ul>
							</div>
							<div class="category_wrap">
								<div id="showArea">
									<c:forEach items="${bigAddr}" var="bigAddr" varStatus="loop">

										<ul style="display: none" id="addr${loop.count}" >
											<c:forEach items="${smallAddr}" var="smallAddr" varStatus="i">
												<c:if test="${bigAddr.addressDetail eq smallAddr.addressDetail}">
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
							<div class="category_wrap" id="selArea"></div>
							<button class="submit_btn">수정</button>
						</form>
					</div>
				</div>
			</div>

			<!-- 달력부분 -->
		</div>
	</section>
	<script type="text/javascript">
		// 유저가 선택한 관심지역 추가 
	
		let selectCate = [
			<c:forEach items="${userCate}" var="userCate">
			<c:out value="${userCate.categoryCode}" />,
			</c:forEach>
		];

		let userAddrCode = [
			<c:forEach items="${userArea}" var="userArea">
			<c:out value="${userArea.addressCode}"/>,
			</c:forEach>
		]
	</script>
	<script src="<c:url value="/script/user/userinfo.js" />"></script>
	<script src="<c:url value="/script/user/usermodal.js" />"></script>
</body>
</html>