<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="./../css/common.css">
    <link rel="stylesheet" href="./../css/study_nlogin.css">

     <!-- slide plugin -->
     <link rel="stylesheet" type="text/css" href="./../script/slick/slick.css"/>
     <link rel="stylesheet" type="text/css" href="./../script/slick/slick-theme.css"/>

    <title>스터디원 모집</title>
    
    <!-- jquery -->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="./../script/slick/slick.js"></script>

</head>
<body>
    <header id="header">
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
        <p>인기있는 스터디</p>
        <div>
            <div class="slide_wrap">
                
                <a href="#" class="content_wrap">
                    <div class="imgbg">
                        <div>
                            <img src="./../images/test_img1.jpg" alt="">
                        </div>
                    </div>
                    <div class="thumbnail">
                        <img src="./../images/test_img1.jpg" alt="">
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
        </div>
    </div>

    <input class="submit_btn" type="button" value="더보기" />


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