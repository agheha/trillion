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

<style>
.cotents {
	margin: auto;
	display: grid;
	width: 500px;
	grid-template-columns: 500px;
	grid-template-rows: 1fr 1fr 1fr 1fr;
	min-height: 350px;
	background: white;
	border: 2px solid lightgrey;
	border-radius: 10px;
}

.sn {
	border-top: 1px solid rgba(218, 217, 217, 0.644);
}

input[type=text] {
	height: 30px;
	width: 80%;
	border: 2px solid lightgrey;
	padding-left: 8px;
}

select {
	width: 30%;
}

.name {
	text-align: center;
	height: 50px;
	position: relative;
	top: 15px;
}

.name>span {
	font-size: 30px;
}

.inner {
	height: 100%;
	display: grid;
	grid-template-columns: 1fr 3fr;
	align-content: center;
}

.item {
	margin-left: 10px;
	font-size: 20px;
}



.inbutton {
	float: right;
	cursor: pointer;
	box-sizing: border-box;
	min-height: 40px;
	display: inline-block;
	background-color: #efefef;
	border: 0;
	border-radius: 8px;
	padding: 10px 14px;
	margin: 15px;
}

.inbutton:hover{
	background: lightgrey;
}
</style>
<title>studyreg</title>

</head>

<body>
	<div class="cotents">
		<div class="name">
			<span>스터디 등록</span>
		</div>
		<div class="sn">
			<div class="inner">
				<div>
					<span class="item">이름</span>
				</div>
				<div>
					<input type="text" name="name" placeholder="스터디 이름을 입력해주세요.">
				</div>
			</div>
		</div>
		<div class="sn">
			<div class="inner">
				<div>
					<span class="item">카테고리</span>
				</div>
				<div>
					<select>
						<option>it</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select>
				</div>
			</div>
		</div>
		<div class="sn">
			<div class="inner">
				<div>
					<span class="item">지역</span>
				</div>
				<div>
					<select>
						<option>서울</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select>
					<select>
						<option>마포구</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select>
				</div>
			</div>
		</div>
		<div class="sn">
				<button class="inbutton">취소</button>
				<button class="inbutton">만들기</button>
		
		</div>
	</div>
</body>

</html>