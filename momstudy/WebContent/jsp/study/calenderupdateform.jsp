<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="now" value="<%=new java.util.Date()%>"/>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<!-- css -->
<link rel="stylesheet" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/css/header.css"/>">
<link rel="stylesheet" href="<c:url value="/css/calenderwrite.css"/>">

<title>studyreg</title>

</head>

<body>
	<form name="myForm" action="studywrite.do" method="post"
		onsubmit="return chknull();">
		<div class="wcotents">
			<div class="name">
				<span>일정 등록</span>
			</div>
			<div class="sn">
				<div class="inner">
					<div>
						<span class="item">제목</span>
					</div>
					<div>
						<input type="text" id="caltitle" name="title" placeholder="일정의 제목을 입력해주세요.">
					</div>
				</div>
			</div>
			<div class="sn">
				<div class="inner">
					<div>
						<span class="item">내용</span>
					</div>
					<div>
						<input type="text" id="calcontent" name="content" placeholder="일정의 내용을 입력해주세요.">
					</div>
				</div>
			</div>
			<div class="sn">
				<div class="inner">
					<div>
						<span class="item">시작일</span>
					</div>
					<div>
						<input type="date" id="startdate" min="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>">
					</div>
				</div>
			</div>
			<div class="sn">
				<div class="inner">
					<div>
						<span class="item">종료일</span>
					</div>
					<div>
						<input type="date" id="limitdate">
					</div>
				</div>
			</div>
			<div class="sn">
				<div class="inner">
					<div>
						<span class="item">일정 성격</span>
					</div>
					<div>
					<input type="radio" name="type" value="1" id="study" checked> <label
					 for="study">모임</label> <input type="radio"
						name="type" value="2" id="normal"> <label
						for="normal">일반 일정</label>
					</div>
				</div>
			</div>
			<div class="sn">
				<div class="inner">
					<div>
						<span class="item">일정 색상</span>
					</div>
					<div>
						<input id="barcolor" type="color" name="barcolor"/>
						<label for="barcolor" id="labelbar">바 색상</label>
						<input id="fontcolor" type="color" name="fontcolor"/>
						<label for="fontcolor" id="labelfont">글자 색상</label>
					</div>
				</div>
			</div>
			<div class="sn">
				<button class="inbutton" type="button" id="closeCreatebtn">취소</button>
				<button class="inbutton" id="submitbtn" type="button">만들기</button>
			</div>
		</div>
	</form>
    <script src="<c:url value="/script/study/calenderwriteform.js"/>"></script>
</body>

</html>




