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

<link rel="stylesheet" href='<c:url value="/css/searchtab.css"/>' >
<link rel="stylesheet" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>" >

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title>search tab</title>
</head>
<body>

<section class="content-block content-1-8">
    <div class="container">
     	<form name="codeForm" action="<c:url value='/study/studyrecruitmentlist.do'/>" >
     		<!-- results의 value 값으로 컨트롤러에 넘길 값 -->
     		<input type="hidden" id="results" name="code" />
        	<ul class="nav nav-tabs text-center address1" role="tablist" id="myTab">
        		<c:forEach items="${bigAList}" varStatus="status" var="address">
		       		<li class="active01">
		            	<a href="#tab${status.count}" role="tab" 
		               	   data-toggle="tab">${address.addressDetail}</a>
		        	</li>
        		</c:forEach>
        	</ul>
        
     <div class="tab-content">
	 	<div class="tab-pane fade in active" id="tab1">
        	<div class="row">
            	<ul class="address2">
                	<span>지역을 선택하세요.</span>
                </ul>
            </div>
        </div>
     </div>
     	<div class="selected">
     		선택된 지역 : <span id="select-box"></span>
     	</div>
    </div>
    	<button id="sbtn">검색</button>
     	</form>
</section>
<script src='<c:url value="/script/study/searchtab.js" />'></script>
</body>
</html>