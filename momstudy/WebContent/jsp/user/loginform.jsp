<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">


        <!-- css -->
        <link rel="stylesheet" href="./../css/common.css">
        <link rel="stylesheet" href="./../css/login.css">
        <link rel="stylesheet" href="./../css/header.css">

        <!-- jquery -->
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        
        <title>Login</title>
    </head>
    <body>
        <header id="header"></header>

        <!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
        <section class="background_wrap">
            <div class="background">
                <h1>로그인</h1>
                <p>로그인 페이지입니다.</p>
            </div>
        </section>

        <!-- 아이디 및 비밀번호를 잘못 입력 시 -->
        <!-- 오류를 띄워주는 영역이 추가될 예정 -->
        <section>
            <div class="fieldset">
                <form action="<c:url value="/user/login.do"/>"method="post">
                    <div>
                        <input  type="email" id="id" placeholder="이메일" name="email">
                    </div>
                    <div>
                        <input class="form_login"type="password" id="pass" placeholder="비밀번호" name="pass"> 
                    </div>
                 	<div>
                 		<button>로그인</button>
                 	</div>
                    <div>
                        <a href="findform.do">아이디/비밀번호 찾기</a>
                        <a href="<c:url value="/user/termsform.do"/>">회원가입</a>
                    </div>
                </form>
            </div>      
        </section>


        <script type="text/javascript">
            $(document).ready(function() {
                $("#header").load("header.html");
            });
        </script>
    </body>
</html>