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
	<link rel="stylesheet" href='<c:url value="/css/review_board.css" />'>

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
		                <li><a href="" value=`${ct.categoryCode}`>${ct.categoryName}</a></li>
	                </c:forEach>
	            </ul>
	        </div>
	    </div>
	
		<div>
		   	<div class="btn_wrap">
		   		<form action="<c:url value="/review/selectStudy.do" />"  method="post">
		   			<button>등록</button>
		   		</form>
		   	</div>
		    <div class="board_cont_wrap">
		       	<c:if test="${empty list}">
		       		<div>게시물이 없습니다.</div>
		       	</c:if>
		       	<c:forEach var="rb" items="${list}">
			      	<div class="board_cont">
			      	
			      		<!-- ------------------------------ -->
			      		<!-- 스터디 파일이 생기면 추후에 경로만 변경해주면 됨 -->
				        <a href='<c:url value="/review/detailBoard.do?num="/>${rb.studyNum}' ">
			      		<!-- ------------------------------ -->
				        
				            <div class="cont_img">
				            
				            	<!-- ------------ -->
				            	<!-- 이미지경로 추후 추가 -->
				                <img src="./../images/test_img1.jpg" alt="">
				            	<!-- ------------ -->
				                
				            </div>
				           	<div class="cont_text">
				                <p>${rb.title}</p>
				                <span>${rb.content}</span>
				           	</div>
				       	</a>
			      	</div>
		        </c:forEach>
		    </div>	
    		<input class="more_btn" type="button" value="더보기" />
    	</div>
    </section>


    <script type="text/javascript">
       
    </script>
</body>
</html>