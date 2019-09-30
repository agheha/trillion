<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">


        <!-- css -->
        <link rel="stylesheet" href="./../common.css">
        <link rel="stylesheet" href="./../certified.css">
        <link rel="stylesheet" href="./../header.css">

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
                <h1>인증</h1>
                <p>비밀번호 찾기 인증센터입니다.</p>
            </div>
        </section>

        <!-- 아이디 및 비밀번호를 잘못 입력 시 -->
        <!-- 오류를 띄워주는 영역이 추가될 예정 -->
        <section>
            <div class="fieldset">
                <form action="<c:url value='/user/certified.do'/>"method="post">
                    <input type="hidden" name="name" value = ${user.name}>
                    <input type="hidden" name="email" value = ${user.email}>
                    <div>
                        <input  type="text" id="id" placeholder="인증번호" name="certified" autocomplete="off">
                    </div>
                 	<div>
                        <input class="submit_btn" type="submit" />
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