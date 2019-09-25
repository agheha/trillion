<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>스터디</title>

        <!-- jquery -->
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

    </head>
    <body>
        <header id="header"></header>

        <!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
        <section class="background_wrap">
            <div class="background">
                <h1>스터디</h1>
                <p>--------------</p>
            </div>
        </section>


        <script type="text/javascript">
            $(document).ready(function() {
                $("#header").load("header.html");
            });
        </script>
    </body>
</html>