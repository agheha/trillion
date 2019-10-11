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
    <link rel="stylesheet" href='<c:url value="/css/calendermini.css" />'>
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
            <section id="schedule" class="schedule"></section>
            <section id="schedule1" class="schedule"></section>
            <section id="schedule2" class="schedule"></section>
        </div>
    </div>
    <script src="<c:url value="/script/study/calender.js"/>"></script>
</body>

</html>