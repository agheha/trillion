<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href='<c:url value="/css/signup_completed.css" />'>

	<div id="content">
		<input type="hidden" name="stdnum" value="${str.studyNum}"/>
		<div id="comp">${str.studyName}</div>
		<div id="que">스터디에 가입하시겠습니까?</div>
		<br/>
		<button type="button" id="signup" onclick=sign(${str.studyNum})>가입</button>
		<button class="closer">취소</button>
    </div>

    <script>
    	function sign(no) {
    		alert("신청되었습니다. 스터디장의 승인 후 가입이 완료됩니다.");
    		location.href = "applyforparticipation.do?studynum=" + no;
    	}
    </script>