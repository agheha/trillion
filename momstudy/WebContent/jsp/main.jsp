<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/css/common.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/header.css"/>">

    <!-- slide plugin -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/script/slick/slick.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/script/slick/slick-theme.css"/>">

    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="<c:url value="/script/slick/slick.js"/>"></script>

    <!-- font icon -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
        integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <title>Study Project</title>
</head>
<body>
    <div class="background">
    	<div></div>
    </div>
    <div class="body_wrap">
   		<%@include file="/jsp/main/mainmenu.jsp"%>
    </div>

    <div class="main_content_wrap">
        <section class="main_bot">
            <p>조회수가 많은순</p>
            <div>
                <div class="slide_wrap">
                    <c:forEach items="${viewcnt}" var="rankcnt">
                    	<!-- 게시판 번호 넘겨주기 -->
	                    <a href="<c:url value="/study/studyrecruitmentdetail.do?num=${rankcnt.num}" />" class="content_wrap">   
    	                    <img src="<c:url value="/util/download.do?fgno=${rankcnt.fileGroupCode}" />"
    	                    width="200" height="200" >
	            	        <div class="gra"></div>
	            	        <p>${rankcnt.title}</p>
            	        </a>
                    </c:forEach>
                </div>
            </div>
        </section>

        <section class="main_bot">
            <p>회원이 많은순</p>
            <div>
                <div class="slide_wrap">         
                    <c:forEach items="${viewusercnt}" var="rankusercnt">
                    	<!-- 게시판 번호 넘겨주기 -->
	                    <a href="<c:url value="/study/studyrecruitmentdetail.do?num=${rankusercnt.num}" />" class="content_wrap">   
    	                    <img src="<c:url value="/util/download.do?fgno=${rankusercnt.fileGroupCode}" />"
    	                    width="200" height="200" >
	            	        <div class="gra"></div>
	            	        <p>${rankusercnt.title}</p>
            	        </a>
                    </c:forEach>
                </div>
            </div>
        </section>

        <section class="main_bot">
            <p>최근 등록한 스터디</p>
            <div>
                <div class="slide_wrap">
                    <c:forEach items="${viewlatestdate}" var="laterstadate">
                    	<!-- 게시판 번호 넘겨주기 -->
	                    <a href="<c:url value="/study/studyrecruitmentdetail.do?num=${laterstadate.num}" />" class="content_wrap">   
    	                    <img src="<c:url value="/util/download.do?fgno=${laterstadate.fileGroupCode}" />"
    	                    width="200" height="200" >
	            	        <div class="gra"></div>
	            	        <p>${laterstadate.title}</p>
            	        </a>
                    </c:forEach>
                </div>
            </div>
        </section>
    </div>
	<script src="<c:url value="/script/common/main.js" />"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('.slide_wrap').slick({
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplaySpeed: 3000,
                autoplay: true,
            });

            $('.slide_wrap_vertical').slick({
                slidesToShow: 3,
                slidesToScroll: 1,
                vertical: true,
                autoplay: true,
                autoplaySpeed: 3000,
            });
        });
    </script>
</body>
</html>