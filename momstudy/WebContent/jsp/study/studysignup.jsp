<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href='<c:url value="/css/signup_completed.css" />'>

	<div class="content">
        <div id="comp">${str.studyName}</div>
        <div id="que">스터디에 가입하시겠습니까?</div>
        <br/>
        <button class="signup" >가입</button> 
        <button class="close">취소</button>
    </div>
