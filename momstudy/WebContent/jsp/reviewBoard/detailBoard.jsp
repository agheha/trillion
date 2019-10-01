<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

	<link rel="stylesheet" href='<c:url value="/css/common.css" />'>
	<link rel="stylesheet" href='<c:url value="/css/layout.css" />'>
	<link rel="stylesheet" href='<c:url value="/css/header.css" />'>
	<link rel="stylesheet" href='<c:url value="/css/studyboard_detail.css" />'>

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
        integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<title>후기게시판</title>
</head>
<body>
	<header id="header"></header>
 
    <!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
    <section class="background_wrap">
        <div class="background">
            <h1>후기게시판</h1>
            <p>--------------</p>
        </div>
    </section>
    
    <section id="layout">
	    <div>
	        <div class="left_list">
	            <ul>
	            	<c:forEach var="ct" items="${cList}">
		                <li><a href="" value=`${ct.categoryCode}` onclick="" >${ct.categoryName}</a></li>
	                </c:forEach>
	            </ul>
	        </div>
	    </div>
	
		<div>
		   	<div class="board_cont_wrap">
		    	<div class="board_title">
                    <p>${rBoard.title}</p>
                    <div>
                        <span>${name}</span>
                        <span>${rBoard.regDate}</span>
                    </div>
                </div>

                <div class="image_wrap">
                	
                </div>
        
                <div class="board_cont">
					${rBoard.content}
                </div>
                
                <div class="score_wrap">
                	${rBoard.score}
                </div>
				
				<div>세션 이메일 : ${user.email }</div>
				<div>글쓴이 : ${rBoard.email }</div>
				
                <div class="buttons">
                	<c:choose>
                		<c:when test="${user.email eq rBoard.email}">
		                	<button type="button" onclick="location.href='<c:url value="/review/updateForm.do?num=${rBoard.num}"/>'">수정</button>
		                    <button type="button" onclick="location.href='<c:url value="/review/delete.do"/>'">삭제</button>
                		</c:when>
                		<c:otherwise>
		                	<button type="button" onclick="location.href='<c:url value="/review/list.do"/>'">목록으로</button>
                		</c:otherwise>
                	</c:choose>
                </div>
		    </div>	
    	</div>
    </section>


    <script type="text/javascript">
       
    </script>
</body>
</html>