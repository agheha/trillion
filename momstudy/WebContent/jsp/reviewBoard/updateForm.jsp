<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

	<link rel="stylesheet" href='<c:url value="/css/common.css" />'>
	<link rel="stylesheet" href='<c:url value="/css/header.css" />'>
	<link rel="stylesheet" href='<c:url value="/css/layout.css" />'>
	<link rel="stylesheet" href='<c:url value="/css/boardWriteForm.css" />'>
	
	<script type="text/javascript" src="reviewBoard.js"></script>


	<title>스터디</title>
</head>
<body>
    <header id="header"></header>

    <!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
    <section class="background_wrap">
        <div class="background">
            <h1>후기게시판 등록</h1>
            <p>--------------</p>
        </div>
    </section>

    <section id="layout">
        <form action="<c:url value="/review/update.do" />" method="post" enctype="multipart/form-data" name="mForm">
            <div>
            	<p>작성자</p>
            	<div>${user.email}</div>
            	<input type="hidden" name="studyNum" value="${study.num}"/>
            	
                <p>제목</p>
                <div>${study.title}</div>
                
                <p>내용</p>
                <textarea name="content"></textarea>
                
                <p>평가</p>
                <select id="score" name="score">
                	<c:forEach var="score" begin="1" end="10">
	                	<option value="${score}">${score}</option>            	
                	</c:forEach>
                </select>
                
                <p>사진</p>
                <div class="upload">
                    <label for="ex_file">사진 업로드</label>
                    <input id="ex_file" type="file" name="attach" multiple />
                </div>
                
            </div>
            <div class="buttons">
                <button type="button" class="submit_btn" onclick="chkForm()">등록</button>
            </div>
        </form>
    </section>

    <script type="text/javascript">
    	/* let f = document.mForm;
    	
    	function chkForm(){
    		if(isEmpty(f.title, "제목")) return false;
    		if(isEmpty(f.content, "제목")) return false;
    	}
    	
    	function isEmpty(ele, msg) {
            if (ele.value == "") {
                alert(`${msg}은 필수 입력 사항입니다.`);
                ele.focus();
                return true;
            }
            return false;
        } */
    </script>
    
</body>
</html>