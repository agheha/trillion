<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<!-- css -->
<link rel="stylesheet" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/css/header.css"/>">
<link rel="stylesheet" href="<c:url value="/css/signup.css"/>">

<!-- jquery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<title>Login</title>
</head>
<body>

	<header id="header"></header>

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>회원가입</h1>
			<p>필수 항목은 꼭 적어주세요.</p>
		</div>
	</section>

	<!-- 아이디 및 비밀번호를 잘못 입력 시 -->
	<!-- 오류를 띄워주는 영역이 추가될 예정 -->
	<section>
		<form action="<c:url value="/user/signup.do"/>" method="post">
			<div class="fieldset">
				<div class="left_wrap">
					<p>이메일</p>
					<input class="user_id" type="email" name="email">

					<%-- 필요한 부분에 class만 동일하게 붙여서 사용하면 됨. --%>
					<span class="alert_wrap">이메일을 선택하세요</span>

					<p>비밀번호</p>
					<input type="password" name="pass1">

					<p>비밀번호 재확인</p>
					<input type="password" name="pass2">

					<p>이름</p>
					<input type="text" name="name">
					<p>생년월일</p>
					<div class="select_wrap">
						<select id="birth_year" name="year">
							<c:forEach var="year" begin="1950" end="2018">
								<option value="${year}">${year}</option>
							</c:forEach>
							<option value="2019" selected>2019</option>
						</select> <select id="birth_month" name="month">
							<option value="1" selected>1</option>
							<c:forEach var="month" begin="2" end="12">
								<option value="${month}">${month}</option>
							</c:forEach>
						</select> <select id="birth_date" name="date">
							<option value="1" selected>1</option>
							<c:forEach var="date" begin="2" end="31">
								<option value="${date}">${date}</option>
							</c:forEach>
						</select>
					</div>
					<p>성별</p>
					<select id="gender" name="gender">
						<option value="man">남자</option>
						<option value="woman">여자</option>
						<option value="0" selected>성별</option>
					</select>
					<p>휴대전화</p>
					<input type="text" name="phnum" placeholder="- 은 제외">
				</div>

				<div class="right_wrap">
					<p>관심있는 카테고리</p>
					<div class="category_wrap">
						<ul>
							<c:forEach items="${cateList}" var="category">
								<li><input type="checkbox" name="category"
									value="${category.categoryCode}"/> <label>${category.categoryName}</label>
								</li>
							</c:forEach>
						</ul>
					</div>
					<p>관심 지역</p>
					<div class="category_wrap" id="area">
						<ul>
						<c:forEach items="${bigAddr}" var="bigAddr" varStatus="loop">
							<li>
								<a href="#" onclick="show(${loop.count})" id="baddr${loop.count}" value="addr${loop.count}">${bigAddr.addressDetail} 
									<span>
										${bigAddr.count}
									</span>
								</a>
							</li>
						</c:forEach>
						</ul>
					</div>
					<div class="category_wrap">
						<div id="showArea">
							<c:forEach items="${bigAddr}" var="bigAddr" varStatus="loop">

							<ul style="display:none" id="addr${loop.count}">
								<c:forEach items="${smallAddr}" var="smallAddr" varStatus="i" >
									<c:if test="${bigAddr.addressDetail eq smallAddr.addressDetail}">								
									<li>
										<input id="add${i.count}" type="checkbox" name="userAddr" sAdd="${smallAddr.addressDetail2}"
										value="${smallAddr.addressCode}"/> 
										<label for="add${i.count}">${smallAddr.addressDetail2}</label>
									</li>
									</c:if>
								</c:forEach>
							</ul>
							</c:forEach>
						</div>	
					</div>
					<div class="category_wrap" id="selArea">
				</div>
					
				</div>
				<input type="submit" class="submit_btn" value="등록" />
			</div>
		</form>
	</section>


	<script type="text/javascript">
		let select = document.querySelectorAll('input[name="userAddr"]')
		function show(index) {
			
			let ulEle = document.querySelectorAll("#showArea > ul");
			
			ulEle.forEach((ele) => {
				ele.style.display="none"
			})
			
			let area = document.querySelector("#baddr"+ index).getAttribute("value")
			ulEle.forEach((ele)=> {
				if(area === ele.id) {
					ele.style.display="block";
				}
			})
		}
		
		select.forEach((ele) => {
			ele.addEventListener("click",showText);
		})
		select.forEach((ele) => {
			ele.addEventListener("click",del);
		})

		function showText(e) {

			let textArea = document.querySelector("#selArea");
			if (e.target.checked){
				let spanEle = document.createElement("span");
				spanEle.id = 'show'+e.target.value;
				spanEle.innerText =  e.target.getAttribute("sAdd");
				textArea.append(spanEle);
				return
			}
		}

		function del(e){
			let textArea = document.querySelector("#selArea");
			if (e.target.checked === false){
			document.querySelector('#show' + e.target.value).remove();
			return 	
			}
		}

		
	</script>
</body>
</html>