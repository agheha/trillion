<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
	function check_form() {

		var form = document.regiform;
		if (!form.agree_chk.checked) {
			form.agree_chk.focus();
			alert("회원약관에 동의하셔야 다음단계로 이동합니다.");
			return false;
		}

		form.submit();
	}
</script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<!-- css -->
<link rel="stylesheet" href="./../css/common.css">
<link rel="stylesheet" href="./../css/terms.css">

<!-- jquery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<title>terms</title>
</head>
<body>
	<header id="header"></header>

	<!-- 각페이지마다 background가 바뀌어야 하는 처리 필요 -->
	<section class="background_wrap">
		<div class="background">
			<h1>회원가입</h1>
			<p>약관에 동의해 주세요.</p>
		</div>
	</section>


	<section>
		<div class="main">
			<form name="agree_chk" action="loginform.do">
				<div class="form_layout">
					<div>
						<div class="form-item-checkbox">
							<label> <input class="check" type="checkbox" name="agree_chk">
								서비스 이용약관 동의 (필수)
							</label>
						</div>
						<div class="form-item-box"></div>
					</div>
					<div>
						<div class="form-item-checkbox">
							<label> <input class="check" type="checkbox" name="agree_chk">
								개인정보보호를 위한 이용자 동의 (필수)
							</label>
						</div>
						<div class="form-item-box"></div>
					</div>
				</div>
				<div class="form-item-checkbox">
					<label> <input class="check" type="checkbox" name="agree_chk">
						만 14세 이상입니다. (필수)
					</label>
				</div>
				<div class="form-item-all">
					<label> <input class="checkall" type="checkbox" id="terms">
						전체동의하기
					</label>
				</div>
				<div class="form-item-btn">
					<button class="login_submit_btn">다음</button>
				</div>
			</form>
		</div>
	</section>


	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("header.html");
		});
	</script>
</body>
</html>