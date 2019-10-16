<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	
	<link rel="stylesheet" href='<c:url value="/css/common.css" /> '>
	<link rel="stylesheet" href='<c:url value="/css/layout.css" />'>
	<link rel="stylesheet" href='<c:url value="/css/boardWriteForm.css" /> '>
	<link rel="stylesheet" href='<c:url value="/css/header.css" />'>
	<link rel="stylesheet" href='<c:url value="/css/study_layout.css" />'>
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">
	
	<title>스터디</title>

</head>
<body>
	<header id="header">
		<%@include file="/jsp/common/header.jsp" %>
	</header>

	<section class="background_wrap">
		<div class="background">
			<h1>스터디 자유게시판 등록</h1>
			<p>제목과 내용은 필수 입력사항입니다.</p>
		</div>
	</section>

	<section id="layout">
	
		<%@include file="/jsp/common/sidebar.jsp" %>
		
		<form class="studyboardlayout" name="create" action="write.do" method="post" onsubmit="return check()" >
			<div class="checked">
				<div>
					<input id="type" class="type" type="checkbox" name="type" value="0" onclick=" checkDisable(this.form)" />
					<label for="type">공지사항</label>
				</div>
				<div>
					<input id="notice" class="notice" type="checkbox" name="notice" value="0" disabled />
					<label for="notice">상단고정</label>
				</div>
			</div>
			<div>
				<p>제목</p>
				<input type="text" name="title" />
				<p>내용</p>
				<textarea name="content" id=""></textarea>
			</div>
			<div class="buttons">
				<button class="submit_btn" type="submit">등록</button>
			</div>
		</form>
	</section>

	<script type="text/javascript"  src="<c:url value="/script/board/writeboard.js" />">
		function resize(obj) {
		    obj.style.height = "1px";
		    obj.style.height = (12+obj.scrollHeight)+"px";
		}
	</script>
</body>
</html>