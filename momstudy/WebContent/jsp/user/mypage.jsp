<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" href="<c:url value="/css/common.css"/>">
	<link rel="stylesheet" href="<c:url value="/css/layout.css"/>">
	<link rel="stylesheet" href="<c:url value="/css/mypage.css"/>">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
    integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    
    <title>마이페이지</title>
    <!-- full calendar -->
	<link rel="stylesheet" href="<c:url value="/script/core/main.css"/>">
	<link rel="stylesheet" href="<c:url value="/script/daygrid/main.css"/>">
    <script type="text/javascript" src='./../script/core/main.js'></script>
    <script type="text/javascript" src='./../script/daygrid/main.js'></script>

    <!-- slide plugin -->
    <link rel="stylesheet" href="<c:url value="/script/slick/slick.css"/>">
    <link rel="stylesheet" href="<c:url value="/script/slick/slick-theme.css"/>">

    <!-- jquery -->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="./../script/slick/slick.js"></script>


</head>
<body>
    <header id="header"></header>

    <!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
    <section class="background_wrap">
        <div class="background">
            <h1>마이페이지</h1>
            <p>--------------</p>
        </div>
    </section>

    <section id="layout">
        <div class="heightAuto">
            <div class="profile">
                <img src="./../images/test_img2.jpg" alt="testImg">
            </div>
            <div class="icons">
                <div>
                    <a href="./signup.html">
                        <i class="fas fa-cog"></i>
                    </a>
                    <a href="#">
                        <i class="fas fa-bell"></i>
                    </a>
                    <ul class="alarm">
                        <li><a href="#">알림</a></li>
                        <li><a href="#">알림</a></li>
                        <li><a href="#">알림</a></li>
                        <li><a href="#">알림</a></li>
                        <li><a href="#">알림</a></li>
                    </ul>
                </div>
            </div>
            <div class="left_list">
                <div>
                    <p>내가 가입한 스터디</p>
                    <ul>
                        <li><a href="#">자바스크립트</a></li>
                        <li><a href="#">자바스크립트</a></li>
                        <li><a href="#">자바스크립트</a></li>
                        <li><a href="#">자바스크립트</a></li>
                        <li><a href="#">자바스크립트</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="heightAuto">
            <!-- 우측 상당 슬라이드 -->
            <div class="right_top_cont">
                <p>내가 가입한 스터디</p>
                <div>
                    <div class="slide_wrap">

                        <div class="content_wrap">
                            <div>
                                <span><img src="./../images/test_img1.jpg" alt="#"></span>
                                <p>자바스크립트</p>
                            </div>
                        </div>
                        <div class="content_wrap">
                            <div>
                                <span><img src="./../images/test_img1.jpg" alt="#"></span>
                                <p>자바스크립트</p>
                            </div>
                        </div>
                        <div class="content_wrap">
                            <div>
                                <span><img src="./../images/test_img1.jpg" alt="#"></span>
                                <p>자바스크립트</p>
                            </div>
                        </div>
                        <div class="content_wrap">
                            <div>
                                <span><img src="./../images/test_img1.jpg" alt="#"></span>
                                <p>자바스크립트</p>
                            </div>
                        </div>
                        <div class="content_wrap">
                            <div>
                                <span><img src="./../images/test_img1.jpg" alt="#"></span>
                                <p>자바스크립트</p>
                            </div>
                        </div>
                        <div class="content_wrap">
                            <div>
                                <span><img src="./../images/test_img1.jpg" alt="#"></span>
                                <p>자바스크립트</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 달력부분 -->
            <div class="right_bottom_cont">
                <div id='calendar'></div>
            </div>
        </div>
    </section>

    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
            plugins: [ 'dayGrid' ]
            });

            calendar.render();
        });

        $(document).ready(function() {
            $("#header").load("header.html");

            $('.slide_wrap').slick({
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplaySpeed: 3000,
                autoplay: true,
            });
        });
    </script>
</body>
</html>