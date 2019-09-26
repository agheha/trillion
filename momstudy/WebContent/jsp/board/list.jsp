<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href='<c:url value="/css/common.css" />'>
<link rel="stylesheet" href='<c:url value="/css/layout.css" />'>
<link rel="stylesheet" href='<c:url value="/css/header.css" />'>
<link rel="stylesheet" href='<c:url value="/css/study_layout.css" />'>
<link rel="stylesheet" href='<c:url value="/css/studyvote.css" />'>

        <link rel="stylesheet" 
              href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
              integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" 
              crossorigin="anonymous">
        <link rel="stylesheet" 
              href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">

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

        <section id="layout">
           <!-- jsp 작업 시 include로 변경 -->
           <div>
                <div class="profile">
                    <img src="<c:url value="/images/test_img2.jpg" />" alt="testImg">
                </div>
                <div class="left_list">
                    <div>
                        <p><a href="./study.jsp">스터디명</a></p>
                        <ul>
                            <!-- 스터디장 화면 다르게 보임 -->
                            <li><a href="./studymembers.html">멤버</a></li>
                            <li><a href="./studyvote.html">투표</a></li>
                            <li><a href="./studyschedule.html">일정</a></li>
                            <li><a href="./studyboard.html">게시판</a></li>
                        </ul>
                    </div>
                </div>
            </div>
   
            <div class="study_right_wrap">
                <div class="vote_title">
                    <p>스터디 게시판</p>
                    <div>
                        <input type="text" name="voteserach" />
                        <select name="vote" id="vote">
                            <option value="1">제목</option>
                            <option value="2">내용</option>
                            <option value="3">글쓴이</option>
                        </select>
                        <button>글등록</button>
                    </div>
                </div>
                <div class="board_list">
                        <c:if test="${empty list}">
                           <div>
                              <h2>게시글이 없습니다.</h2>
                           </div>
                        </c:if>
                        <c:forEach var="b" items="${list}">
                        <div>
                            <a href="<c:url value="/board/detail.do?no=${b.num}" />">
	                            <ul>
	                                <li>${b.num}</li>
	                                <li>${b.title}</li>
	                                <li>${b.email}</li>
	                                <li><fmt:formatDate pattern="yyyy-MM-dd" value="${b.regDate}" /></li>
	                            </ul>
                            </a>
                            </div>
                        </c:forEach>
                    </div>   
                 </div>
        </section>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#header").load("header.html");
            });
        </script>
    </body>
</html>