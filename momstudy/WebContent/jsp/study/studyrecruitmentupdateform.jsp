<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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

		<title>모집글 수정</title>
		<!-- jquery -->
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

</head>
<body>
	<header id="header">
    	<%@include file="/jsp/common/header.jsp" %>
    </header>
    <!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
    <section class="background_wrap">
    	<div class="background">
        	<h1>스터디모집글 수정</h1>
            <p>--------------</p>
        </div>
    </section>
        
    <section id="layout">
            
        <div class="study_right_wrap">
        	<form action="<c:url value="/study/studyrecruitmentupdate.do?num=${str.num}" />" method="post" enctype="multipart/form-data">
            <div>
            	<!-- 
            	<p>스터디명</p>
            	<div>${study.name}</div>
            	 -->
            	<input type="hidden" name="studyNum" value="${str.studyNum}"/>
            	
                <p>제목</p>
                <input type="text" name="title" value="${str.title}" />
                
                <p>내용</p>
                <textarea name="content">${str.content}</textarea>
                <p>사진</p>
                <div class="upload">
                    <label for="ex_file">사진 업로드</label>
                    <input id="ex_file" type="file" name="attach" multiple />
                </div>
            </div>
            <div class="buttons">
                <button class="submit_btn">등록</button>
            </div>
        </form>
                
            </div>
            </section>
       

        <script type="text/javascript">
            $(document).ready(function() {
                $("#header").load("header.html");
            });

            function resize(obj) {
                obj.style.height = "1px";
                obj.style.height = (12+obj.scrollHeight)+"px";
            }
        </script>
    
    

</body>
</html>