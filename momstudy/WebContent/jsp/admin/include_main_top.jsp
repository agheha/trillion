<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet" href="./../css/admin_main.css">
<link rel="stylesheet" href="./../css/admin_study.css">
<link rel="stylesheet" href="./../css/admin_user.css">
<link rel="stylesheet" href="./../css/admin_user_detail.css">
<link rel="stylesheet" href="./../css/admin_category.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./../css/common.css">
<link rel="stylesheet" href="./../css/Layer_Pop_up.css">
<link rel="stylesheet" href="./../css/Layer_Pop_up1.css">
<script type="text/javascript" src="<c:url value='/script/admin/popUp.js'/>"></script>
<script type="text/javascript" src="<c:url value='/script/admin/popUp1.js'/>"></script>
<title>header</title>
</head>

<body>

  <header id="header">
    		<%@include file="/jsp/common/header.jsp"%>
    </header>

	<section class="section2">
		<div id="content">
		
			<div id="responsive-admin-menu">

				<div id="logo"></div>

				<!--Menu-->
				<div id="menu">
					<a href="<c:url value="/admin/reportuser.do"/>"><i
						class="icon">=</i><span>신고된사람</span></a> <a
						href="<c:url value="/admin/reportboard.do"/>"><i
						class="icon">=</i><span> 신고된 글</span></a> <a
						href="<c:url value="/admin/reportstudy.do"/>"><i
						class="icon">=</i><span> 신고된 스터디</span></a> <a
						href="<c:url value="/admin/user.do"/>"><i
						class="icon">=</i><span>회원</span></a> <a
						href="<c:url value="/admin/study.do"/>"><i
						class="icon">=</i><span>스터디</span></a> <a
						href="<c:url value="/admin/admincategory.do"/>"><i
						class="icon">=</i><span>카테고리</span></a>

				</div>
				<!--Menu-->
			</div>

			<div id="content-wrapper">

				<div class="box-area">

					<div class="box-wrap">
					