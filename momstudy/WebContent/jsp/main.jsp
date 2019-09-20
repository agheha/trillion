<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./../css/common.css">
    <link rel="stylesheet" href="./../css/main.css">

    <!-- slide plugin -->
    <link rel="stylesheet" type="text/css" href="./../script/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="./../script/slick/slick-theme.css"/>

    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="./../script/slick/slick.js"></script>

    <!-- font icon -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
        integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <title>Study Project</title>
</head>
<body>
    <div class="body_wrap">
        <div class="main_wrap">
            <div class="main_content">
                <div>
                    
                    <div class="main_memberCnt">
                        <div>
                            <h2>ȸ�� : </h2>
                            <p><span>1,000,000</span>��</p>
                        </div>
                        <div>
                            <h2>���͵� : </h2>
                            <p><span>300,000</span>��</p>
                        </div>
                    </div>
                    
                    <!-- ����Ʈ �̸� or �ΰ� -->
                    <h1 class="main_title">All About Study</h1>
                    
                    
                    <div class="under_line"></div>
                    
                    <!-- ���͵��� ���� -->
                    <p class="main_title_cont">���͵��� ��� ��</p>
                    
                    <div> 
                        <input type="input" placeholder="���͵� �˻� �� ������.">
                    </div>
                    
                </div>
            </div>
            
            <ul class="main_menu">
                <li></li>
                <c:choose>
                <c:when test="${empty user}">
                <li>
                    <div>
                        <a href="/user/loginform.do">
                            <i class="fas fa-address-card"></i>
                            ����������
                        </a>
                    </div>
                </li>
                </c:when>
                <c:otherwise>                
                <li>
                    <div>
                        <a href="mypage.do">
                            <i class="fas fa-address-card"></i>
                            ����������
                        </a>
                    </div>
                </li>
                </c:otherwise>
                </c:choose>
                <li>
                    <div>
                        <a href="study.html">
                            <i class="fas fa-book-reader"></i>
                            ���͵�ã��
                        </a>
                    </div>
                </li>
                <li>
                    <div>
                        <a href="notice_board.html">
                            <i class="fas fa-chalkboard-teacher"></i>
                            �����Խ���
                        </a>
                    </div>
                </li>
                <li>
                    <div>
                        <a href="review_board.html">
                            <i class="fas fa-object-group"></i>
                            �ı�Խ���
                        </a>
                    </div>
                </li>
                <li>
                    <div>
                        <a href="inquire_board.html">
                            <i class="fas fa-question"></i>
                            �����ϱ�
                        </a>
                    </div>
                </li>
                <li></li>
            </ul>
        </div>
    </div>

    <div class="main_content_wrap">
        <section class="main_bot">
            <p>�α��ִ� ī�װ�</p>
            <div>
                <div class="slide_wrap">
                    
                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img1.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img2.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img3.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img4.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img5.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img6.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img7.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img8.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                </div>
            </div>
        </section>

        <section class="main_bot">
            <p>�α��ִ� ī�װ�</p>
            <div>
                <div class="slide_wrap">
                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img1.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img2.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img3.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img4.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img5.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img6.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img7.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img8.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>
                </div>
            </div>
        </section>

        <section class="main_bot">
            <p>�α��ִ� ī�װ�</p>
            <div>
                <div class="slide_wrap">
                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img1.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img2.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img3.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img4.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img5.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img6.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img7.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
                    </a>

                    <a href="#" class="content_wrap">
                        <img src="./../images/test_img8.jpg" alt="">
                        <div class="gra"></div>
                        <p>�ڹٽ�ũ��Ʈ �������</p>
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