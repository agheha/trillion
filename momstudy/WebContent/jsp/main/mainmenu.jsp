<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main_wrap">
		<div class="main_content">
			<div>
				<div class="main_memberCnt">
					<div>
						<h2>회원 :</h2>
						<p>
							<span>1,000,000</span>명
						</p>
					</div>
					<div>
						<h2>스터디 :</h2>
						<p>
							<span>300,000</span>개
						</p>
					</div>
				</div>

				<!-- 사이트 이름 or 로고 -->
				<h1 class="main_title">MomStudy</h1>


				<div class="under_line"></div>

				<!-- 스터디의 모든것 -->
				<div class="login">
					<c:choose>
						<c:when test="${empty user}">
							<a href="<c:url value="/user/loginform.do"/>">
								<p class="main_title_cont">로그인하기</p>
							</a>
						</c:when>
						<c:otherwise>
							<p class="main_title_cont">${user.name}님환영합니다.</p>
							<a href="<c:url value="/user/logout.do"/>">
								<p class="main_title_cont">로그아웃</p>
							</a>
						</c:otherwise>
					</c:choose>
				</div>


				<div>
					<input type="text" placeholder="스터디를 검색 해 보세요.">
				</div>

			</div>
		</div>

		<ul class="main_menu">
			<li></li>
			<li>
				<div>
					<a href="<c:url value="/user/mypage.do"/>"> <i
						class="fas fa-address-card"></i> 마이페이지
					</a>
				</div>
			</li>
			<li>
				<div>
					<a href='<c:url value="/study/studyrecruitmentlist.do" />'> <i
						class="fas fa-book-reader"></i> 스터디찾기
					</a>
				</div>
			</li>
			<li>
				<div>
					<a href='<c:url value="/boardfree/freelist.do" />'> <i
						class="fas fa-chalkboard-teacher"></i> 자유게시판
					</a>
				</div>
			</li>
			<li>
				<div>
					<a href="<c:url value="/review/list.do"/>"> <i
						class="fas fa-object-group"></i> 후기게시판
					</a>
				</div>
			</li>
			<li>
				<div>
					<a href="inquire_board.html"> <i class="fas fa-question"></i>
						문의하기
					</a>
				</div>
			</li>
			<li></li>
		</ul>
	</div>
</body>
</html>