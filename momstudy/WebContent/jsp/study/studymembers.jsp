<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href='<c:url value="/css/common.css" />'>
<link rel="stylesheet" href='<c:url value="/css/layout.css" />'>
<link rel="stylesheet" href='<c:url value="/css/header.css" />'>
<link rel="stylesheet" href='<c:url value="/css/study_layout.css" />'>
<link rel="stylesheet" href='<c:url value="/css/memberinfo.css" />'>
<link rel="stylesheet" href='<c:url value="/css/studymanage.css" />'>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">

<title>스터디</title>

<!-- jquery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

</head>
<body>
	<header id="header">
		<%--헤더 인클루드 --%>
		<%@include file="/jsp/common/header.jsp"%>

	</header>

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>스터디</h1>
			<p>--------------</p>
		</div>
	</section>

	<section id="layout">
		<!-- jsp 작업 시 incluide로 변경 -->
		<%--사이드바 인클루드 --%>
		<%@include file="/jsp/common/sidebar.jsp"%>



		<div class="study_right_wrap">
			<table class="apply_user">
				<thead>
					<tr>
						<h3 class="stm_title">신청한 유저들 목록</h3>
						<th>이름</th>
						<th>나이</th>
						<th>별명</th>
						<th>성별</th>
						<th>가입일</th>
						<th>수락</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>김뜨루</td>
						<td>21</td>
						<td>참</td>
						<td>여</td>
						<td>2018-12-31</td>
						<td>
							<!-- 가입신청 수락버튼이 row마다 생성되어야 함-->
							<div>
								<button class="agr_button">수락</button>
								<button class="agr_button">거절</button>
							</div>
						</td>
					</tr>
					<tr>
						<td>채채</td>
						<td>21</td>
						<td>채채채채채인지</td>
						<td>여</td>
						<td>2018-12-31</td>
						<td>
							<!-- 가입신청 수락버튼이 row마다 생성되어야 함-->
							<div>
								<button class="agr_button">수락</button>
								<button class="agr_button">거절</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="study_member">
				<thead>
					<tr>
						<h3 class="stm_title">스터디원 목록</h3>
						<th>이름</th>
						<th>나이</th>
						<th>별명</th>
						<th>성별</th>
						<th>가입일</th>
						<th>체크</th>
					</tr>
				</thead>
				<div class="stdmem_td">
					<tbody>
						<tr class="tr_row">
							<td class="study_leader"><span><i
									class="fas fa-crown"></i></span>주영만</td>
							<td>31</td>
							<td>민짱</td>
							<td>남</td>
							<td>2018-12-31</td>
							<td><input type="checkbox" /></td>
						</tr>
						<tr class="tr_row">
							<td>신용한</td>
							<td>30</td>
							<td>곰신</td>
							<td>남</td>
							<td>2019-01-01</td>
							<td><input type="checkbox" /></td>
						</tr>
						<tr class="tr_row">
							<td>강유진</td>
							<td>29</td>
							<td>뱅뱅뱅</td>
							<td>여</td>
							<td>2019-08-10</td>
							<td><input type="checkbox" checked /></td>
						</tr>
						<tr class="tr_row">
							<td>박정훈</td>
							<td>27</td>
							<td>빙숑</td>
							<td>남</td>
							<td>2019-06-21</td>
							<td><input type="checkbox" /></td>
						</tr>
						<tr class="tr_row">
							<td>권정진</td>
							<td>26</td>
							<td>보이드</td>
							<td>남</td>
							<td>2019-08-10</td>
							<td><input type="checkbox" checked /></td>
						</tr>
						<tr class="tr_row">
							<td>두영준</td>
							<td>25</td>
							<td>맛있는게제일조아</td>
							<td>남</td>
							<td>2019-08-10</td>
							<td><input type="checkbox" checked /></td>
						</tr>
						<tr class="tr_row">
							<td>이네열</td>
							<td>20</td>
							<td>천상천하유아</td>
							<td>남</td>
							<td>2019-04-27</td>
							<td><input type="checkbox" /></td>
						</tr>
					</tbody>
				</div>
			</table>
			<div class="smt_buttons">
				<button class="stm_button">강퇴</button>
			</div>
		</div>
	</section>


	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<p>회원 사진</p>
			<p>이메일</p>
			<p>평점</p>
			<p>가입목록</p>
		</div>

	</div>

	<script>
		// Get the modal
		var modal = document.getElementById("myModal");

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("header.html");

			// add event listener
			// get elements
			let dataRows = document.getElementsByClassName('tr_row');

			// make func
			function onClickModal() {
				var modal = document.getElementById("myModal");

				// Get the modal
				var modal = document.getElementById("myModal");

				// Get the <span> element that closes the modal
				var span = document.getElementsByClassName("close")[0];

				// When the user clicks on <span> (x), close the modal
				span.onclick = function() {
					modal.style.display = "none";
				}

				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
					if (event.target == modal) {
						modal.style.display = "none";
					}
				}
				modal.style.display = "block";

				// 클릭한 row 의 id 값 참조해서 데이터 주입하는 작업
				// ajax 사용하거나 이미 가져온 데이터 활용하거나 선택

			}

			// add event listener
			for (let i = 0; i < dataRows.length; i++) {
				dataRows[i].addEventListener('click', onClickModal, false);
			}
		});
	</script>
</body>