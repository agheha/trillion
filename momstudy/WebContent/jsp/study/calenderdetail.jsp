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
<link rel="stylesheet" href="<c:url value="/css/calenderdetail.css"/>">

<title>studyreg</title>

</head>

<body>
		<div class="cotents">
			<div class="sn">
				<div class="dinner">
					<div>
						<span class="item">제목</span>
					</div>
					<div>
						<span id="resultTitle">오늘의 일정</span>
					</div>
				</div>
			</div>
			<div class="sn">
				<div class="dinner">
					<div>
						<span class="item">작성자</span>
					</div>
					<div>
						<span id="resultEmail">오늘의 일정</span>
					</div>
				</div>
			</div>
			<div class="sn">
				<div class="dinner">
					<div>
						<span class="item">내용</span>
					</div>
					<div>
						<span id="resultContent"></span>
					</div>
				</div>
			</div>
			<div class="sn">
				<div class="dinner">
					<div>
						<span class="item">시작일</span>
					</div>
					<div>
						<span id="resultstart"></span>
					</div>
				</div>
			</div>
			<div class="sn">
				<div class="dinner">
					<div>
						<span class="item">종료일</span>
					</div>
					<div>
						<span id="resultend"></span>
					</div>
				</div>
			</div>
			<div class="sn">
				<div class="dinner">
					<div>
						<span class="item">일정 성격</span>
					</div>
					<div>
						<span id="resulttype"></span>
					</div>
				</div>
			</div>
			<div class="sn">
				<button class="inbutton" type="button" id="closeDetailBtn">닫기</button>
				<button class="inbutton" id="submitresultbtn" type="button">참여</button>
			</div>
		</div>
		    <script src="<c:url value="/script/study/calenderdetail.js"/>"></script>
</body>

</html>




