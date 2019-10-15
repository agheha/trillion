<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href='<c:url value="/css/signup_completed.css" />'>

	<div id="content">
		<input type="hidden" name="stdnum" value="${str.studyNum}"/>
		<div id="que">스터디를 탈퇴하시겠습니까?</div>
		<br/>
		<button type="button" id="signup" onclick="agree()">확인</button>
		<button class="closer" onclick="return clean()">취소</button>
    </div>
	
	<script>
	function clean() {
		modal.style.display="none"
	}
	</script>
    <script src="<c:url value="/script/user/deletestudy.js"/>"></script>	
    <script src="<c:url value="/script/study/studysignup.js"/>"></script>	
    	