<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="now" value="<%=new java.util.Date()%>"/>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href='<c:url value="/css/calender.css" />'>
</head>

<body>
    <div class="bigcal">
        <div class="years">
            <div class="yearsbox">
                <div id="prevbtn"><span>이전</span></div>
                <div class="year"><fmt:formatDate pattern="yyyy" value="${now}"/>년</div>
                <div class="month"><fmt:formatDate pattern="MM" value="${now}"/>월</div>
                <div id="nextbtn"><span>다음</span></div>
            </div>
        </div>
        <div class="dayofweek">
            <div class="dayname">일요일</div>
            <div class="dayname">월요일</div>
            <div class="dayname">화요일</div>
            <div class="dayname">수요일</div>
            <div class="dayname">목요일</div>
            <div class="dayname">금요일</div>
            <div class="dayname">토요일</div>
        </div>
        <div class="days">
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day"><span>1</span></div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
            <div class="day">1</div>
        </div>
    </div>
    <div class="ctmenu">
        <div class="ctcontent" id="createSd"><i class="far fa-calendar-plus"></i> 일정 등록</div>
    </div>
    <div class="sdmenu">
        <div class="sdcontent" id="deleteSd"><i class="far fa-calendar-times"></i> 일정 삭제</div>
        <div class="sdcontent" id="modifySd"><i class="far fa-calendar-alt"></i> 일정 수정</div>
    </div>
    	<!-- The Modal -->
	<div id="myModalForCreate" class="modal">
		<!-- Modal content -->
			<%@include file="/jsp/study/calenderwriteform.jsp"%>
	</div>
	
 	<div id="myModalForDetail" class="modal">
		<!-- Modal content -->
 			<%@include file="/jsp/study/calenderdetail.jsp"%> 
	</div> 

    <script src="<c:url value="/script/study/calender.js"/>"></script>
</body>

</html>