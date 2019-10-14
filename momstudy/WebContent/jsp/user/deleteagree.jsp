<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href='<c:url value="/css/signup_completed.css" />'>

	<div id="content">
		<input type="hidden" name="stdnum" value="${str.studyNum}"/>
		<div id="que">스터디를 탈퇴하시겠습니까?</div>
		<br/>
		<button type="button" id="signup" onclick="agree()">확인</button>
		<button class="closer">취소</button>
    </div>
	
	
    <script>
    	function agree() {
    		let divEle =  document.querySelector("#content");
    		let cancells = document.querySelectorAll("input[name='cancell']")
    		console.dir(cancells)
    		divEle.innerHTML = "<div id='que'>탈퇴되었습니다</div>"
    		cancells = JSON.stringify(cancells)
    		let xhr = new XMLHttpRequest();
    		xhr.onreadystatechange = e => {
    			if (xhr.readyState === 4) {
    				if (xhr.status === 200) {
    					setTimeout(() => {
    						location.href="/momstudy/user/studydeleteform.do"
    					}, 2000);
    				} 
    			}
    		}
    		xhr.open("POST", "/momstudy/user/studydelete.do")
    		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    		xhr.send("cancell="+cancells);
  			
    		
    	}
    </script>
    <script src="<c:url value="/script/study/studysignup.js"/>"></script>		