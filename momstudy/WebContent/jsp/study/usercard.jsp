<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href='<c:url value="/css/usercard.css" />'>
<div class="card">
	<div class="cardimg">
		<div class="userimg"></div>
		<div class="userId">
			<span class="id" id="username"></span>
		</div>
	</div>
	<div class="score">
		<div id="scorecontent">
			<%@include file="/jsp/study/score.jsp"%>
		</div>
		<div class="inputscore" id="inputscore">
			<form action="" name="scoreForm">
				<span>별점주기 </span> <select name="score" id="scoresle">
					<option value="1">1점</option>
					<option value="2">2점</option>
					<option value="3">3점</option>
					<option value="4">4점</option>
					<option value="5">5점</option>
				</select>
				<button type="button" id="sbtn">전송</button>
			</form>
		</div>
	</div>
</div>
<script src="<c:url value="/script/study/usercard.js"/>"></script>