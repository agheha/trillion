<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet" href="../../css/admin_main.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/header.css">
<title>header</title>
</head>

<body>

	<header>
		<div class="header_top_wrap">
			<div>
				<a href="#">All About Study</a>
			</div>
			<div>
				<ul>
					<li><a href="#">로그인</a></li>
					<li>/</li>
					<li><a href="#">회원가입</a></li>
				</ul>
			</div>
		</div>
		<div class="header_bot_wrap">
			<div>
				<a href="#">마이페이지</a>
			</div>
			<div>
				<a href="#">스터디</a>
			</div>
			<div>
				<a href="#">자유게시판</a>
			</div>
			<div>
				<a href="#">후기게시판</a>
			</div>
			<div>
				<a href="#">문의하기</a>
			</div>
		</div>
	</header>

	<section class="background_wrap">
		<div class="background">
			<h1>All About Study</h1>
			<p>관리자페이지 입니다.</p>
		</div>
	</section>

	<section class="section2">
		<div id="content">
			<div id="responsive-admin-menu">

				<div id="logo"></div>

				<!--Menu-->
				<div id="menu">
					<a href="<c:url value="/jsp/admin/admin_main1.jsp"/>"><i
						class="icon">=</i><span>신고된사람</span></a> <a
						href="<c:url value="/jsp/admin/admin_main2.jsp"/>"><i
						class="icon">=</i><span> 신고된 글</span></a> <a
						href="<c:url value="/jsp/admin/admin_main3.jsp"/>"><i
						class="icon">=</i><span> 신고된 스터디</span></a> <a
						href="<c:url value="/jsp/admin/admin_main4.jsp"/>"><i
						class="icon">=</i><span>회원</span></a> <a
						href="<c:url value="/jsp/admin/admin_main5.jsp"/>"><i
						class="icon">=</i><span>스터디</span></a> <a
						href="<c:url value="/jsp/admin/admin_main6.jsp"/>"><i
						class="icon">=</i><span>게시판</span></a> <a
						href="<c:url value="/jsp/admin/admin_main7.jsp"/>"><i
						class="icon">=</i><span>카테고리</span></a>

				</div>
				<!--Menu-->
			</div>

			<div id="content-wrapper">

				<div class="box-area">

					<div class="box-wrap">
					