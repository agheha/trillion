<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value="/css/usermodal.css"/>">

<div id="myModal" class="modal">

	<!-- Modal content -->
	<div class="modal-content">
		<span class="close">x</span>
		<p>비밀번호를 입력해주세요</p>
		<div>
			<label for="passchk">현재 비밀번호</label> 
			<input type="password" id="passchk" />
		<div>
		<div>
			<button id="btn" class="oneBtn">확인</button>
		</div>
	</div>

</div>