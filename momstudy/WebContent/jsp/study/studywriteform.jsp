<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- css -->
<link rel="stylesheet" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/css/header.css"/>">
<link rel="stylesheet" href="<c:url value="/css/studywrite.css"/>">

	<form name="myForm" action="studywrite.do" method="post" onsubmit="return chknull();" id="studyWriteForm">
	<input type="hidden" value="" name="num">
		<div class="wcotents">
			<div class="name">
				<span id="sname">스터디 등록</span>
			</div>
			<div class="sn">
				<div class="inner">
					<div>
						<span class="items">이름</span>
					</div>
					<div>
						<input type="text" name="name" placeholder="스터디 이름을 입력해주세요.">
					</div>
				</div>
			</div>
			<div class="sn">
				<div class="inner">
					<div>
						<span class="items">카테고리</span>
					</div>
					<div>
						<select name="category">
							<option value="">선택</option>
							<c:forEach items="${cList}" var="category">
								<option value="${category.categoryCode}">${category.categoryName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="sn">
				<div class="inner">
					<div>
						<span class="items">지역</span>
					</div>
					<div>
						<select name="address1">
							<option value="">선택</option>
							<c:forEach items="${bigAList}" var="addr">
								<option value="${addr.addressDetail}">${addr.addressDetail}</option>
							</c:forEach>
						</select> <select name="address2">
							<option>선택</option>
						</select>
					</div>
				</div>
			</div>
			<div class="sn" id="Ysn">
				<button class="inbutton closer" id="clsmodbtn" onclick="clsStudyMd()" type="button" >취소</button>
				<button class="inbutton" id="studyWriteBtn">만들기</button>

			</div>
		</div>
	</form>
	 
	<script src="<c:url value="/script/study/studywriteform.js"/>"></script>
	 



