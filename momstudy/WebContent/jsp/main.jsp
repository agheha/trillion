<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
        <div class="main_wrap">
            <div class="main_content">
                <div>
                    
                    <div class="main_memberCnt">
                        <div>
                            <h2>회원 : </h2>
                            <p><span>1,000,000</span>명</p>
                        </div>
                        <div>
                            <h2>스터디 : </h2>
                            <p><span>300,000</span>개</p>
                        </div>
                    </div>
                    
                    <!-- 사이트 이름 or 로고 -->
                    <h1 class="main_title">MomStudy</h1>
                    
                    
                    <div class="under_line"></div>
                    
                    <!-- 스터디의 모든것 -->
                    <div class="login">
                    <c:choose>
                    <c:when test="${empty user}">
                    	<a href="<c:url value="/user/loginform.do"/>">
                    		<p class="main_title_cont">로그인하기</p>
                    	</a>
                    </c:when>
                    <c:otherwise>
                    	<p class="main_title_cont">${user.name}님 환영합니다.</p>
               			<a href="<c:url value="/user/logout.do"/>">
                    	<p class="main_title_cont">로그아웃</p>
                    	</a>                  
                    </c:otherwise>
                    </c:choose>
                    </div>
                    
                    
                    <div> 
                        <input type="input" placeholder="스터디를 검색 해 보세요.">
                    </div>
                    
                </div>
            </div>
            
            <ul class="main_menu">
                <li></li>                    
                <li>
                    <div>
                        <a href="<c:url value="/user/mypage.do"/>">
                            <i class="fas fa-address-card"></i>
                            	마이페이지
                        </a>
                    </div>
                </li>
                <li>
                    <div>
                        <a href='<c:url value="/study/studyrecruitmentlist.do" />'>
                            <i class="fas fa-book-reader"></i>
                            	스터디찾기
                        </a>
                    </div>
                </li>
                <li>
                    <div>
                        <a href="notice_board.html">
                            <i class="fas fa-chalkboard-teacher"></i>
                            	자유게시판
                        </a>
                    </div>
                </li>
                <li>
                    <div>
                        <a href="<c:url value="/review/list.do"/>">
                            <i class="fas fa-object-group"></i>
                            	후기게시판
                        </a>
                    </div>
                </li>
                <li>
                    <div>
                        <a href="inquire_board.html">
                            <i class="fas fa-question"></i>
                            	문의하기
                        </a>
                    </div>
                </li>
                <li></li>
            </ul>
        </div>
    </div>

    <div class="main_content_wrap">
        <section class="main_bot">
            <p>인기있는 카테고리</p>
            <div>
                <div class="slide_wrap">
                    
                    <a href="#" class="content_wrap">
                   
                        <img src="<c:url value="/images/test_img1.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img2.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img3.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img4.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img5.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img6.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img7.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img8.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                </div>
            </div>
        </section>

        <section class="main_bot">
            <p>인기있는 카테고리</p>
            <div>
                <div class="slide_wrap">
                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img1.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img2.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img3.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img4.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img5.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img6.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img7.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img8.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>
                </div>
            </div>
        </section>

        <section class="main_bot">
            <p>인기있는 카테고리</p>
            <div>
                <div class="slide_wrap">
                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img1.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img2.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img3.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img4.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img5.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img6.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img7.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="<c:url value="/images/test_img8.jpg"/>" alt="">
                        <div class="gra"></div>
                        <p>자바스크립트 따라잡기</p>
                    </a>
                </div>
            </div>
        </section>
    </div>

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