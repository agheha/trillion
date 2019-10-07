<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href='<c:url value="/css/common.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/study_nlogin.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/header.css" />'>

<!-- slide plugin -->
<link rel="stylesheet" type="text/css" href='<c:url value="/script/slick/slick.css"/>'>
<link rel="stylesheet" type="text/css" href='<c:url value="/script/slick/slick-theme.css"/>'>

<title>후기게시판</title>

<!-- jquery -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/script/slick/slick.js"></script>

</head>
<body>
    <header id="header">
    	<%--헤더 인클루드 --%>
		<%@include file="/jsp/common/header.jsp" %>
    </header>

    <!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
    <section class="background_wrap">
        <div class="background">
            <h1>스터디</h1>
            <p>--------------</p>
        </div>
    </section>

    <div class="board_cont_wrap">
    	<div class="slide_wrap">
    	
    	<c:if test="${empty strList}">
    		<div>
    			<h2>등록된 모집글이 없습니다.</h2>
    		</div>
    	</c:if>
    	
    	<!--  여기서 이미지는 등록글 작성시 등록한 이미지로 대체해주어야 한다!!! -->
    	
    	<c:forEach var="str" items="${strList}">
        	<a href="#" class="content_wrap">
            	<div class="imgbg">
                	<div>
                    	<img src="<%= request.getContextPath() %>/images/test_img1.jpg" alt="">
                    </div>
                </div>
                <div class="thumbnail">
                	<img src="<%= request.getContextPath() %>/images/test_img1.jpg" alt="">
                </div>
                <div class="study_cont">
                	<p>${str.title}</p>
                	<div>
                		<span>평점 ${str.avr}점</span>
                        <span>회원 명</span>
                    </div>
                </div>
             </a>
    	</c:forEach>

             <a href="#" class="content_wrap">
             	<div class="imgbg">
                	<div>
                    	<img src="<%= request.getContextPath() %>/images/test_img2.jpg" alt="">
                    </div>
                </div>
                <div class="thumbnail">
                	<img src="<%= request.getContextPath() %>/images/test_img2.jpg" alt="">
                </div>
                <div class="study_cont">
                	<p>자바스크립트 따라잡기</p>
                    <div>
                    	<span>평점 5점</span>
                    	<span>회원 3명</span>
                    </div>
                </div>
             </a>

             <a href="#" class="content_wrap">
             	<div class="imgbg">
                	<div>
                    	<img src="<%= request.getContextPath() %>/images/test_img3.jpg" alt="">
                    </div>
                </div>
                <div class="thumbnail">
                	<img src="<%= request.getContextPath() %>/images/test_img3.jpg" alt="">
                </div>
                <div class="study_cont">
                	<p>자바스크립트 따라잡기</p>
                    <div>
                    	<span>평점 5점</span>
                        <span>회원 3명</span>
                    </div>
                </div>
             </a>

                <a href="#" class="content_wrap">
                    <div class="imgbg">
                        <div>
                            <img src="<%= request.getContextPath() %>/images/test_img4.jpg" alt="">
                        </div>
                    </div>
                    <div class="thumbnail">
                        <img src="<%= request.getContextPath() %>/images/test_img4.jpg" alt="">
                    </div>
                    <div class="study_cont">
                        <p>자바스크립트 따라잡기</p>
                        <div>
                            <span>평점 5점</span>
                            <span>회원 3명</span>
                        </div>
                    </div>
                </a>

                <a href="#" class="content_wrap">
                    <div class="imgbg">
                        <div>
                            <img src="<%= request.getContextPath() %>/images/test_img5.jpg" alt="">
                        </div>
                    </div>
                    <div class="thumbnail">
                        <img src="<%= request.getContextPath() %>/images/test_img5.jpg" alt="">
                    </div>
                    <div class="study_cont">
                        <p>자바스크립트 따라잡기</p>
                        <div>
                            <span>평점 5점</span>
                            <span>회원 3명</span>
                        </div>
                    </div>
                </a>
    	</div>
    	<div>
    	<input class="submit_btn" type="button" value="더보기" />
    	</div>
    	<%@include file="/jsp/common/pagination.jsp" %>
    </div>




    <script type="text/javascript">
        $(document).ready(function() {
            $("#header").load("header.html");
            $(".board_cont").mouseover("")

            $('.slide_wrap').slick({
                slidesToShow: 3,
                slidesToScroll: 1,
            });
        });
    </script>
</body>
</html>