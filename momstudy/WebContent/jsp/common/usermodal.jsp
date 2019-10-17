<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value="/css/usermodal.css"/>">

<div id="mymodal" class="modal">

	<!-- Modal content -->
	<div class="modal-content">
		<span>현재 비밀번호를 입력하세요</span>
		<span class="close">x</span>
		<div>
			<label for="passchk">현재 비밀번호</label> <input type="password"
				id="passchk" />
			 <span id="msg" class="alert_wrap" style="opacity:0;">아이디와 비밀번호를 다시 확인해 주세요</span>
		</div>
		<div>
			<button id="upbtn" class="oneBtn">확인</button>
		</div>

	</div>
</div>