<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/css/questionwrite.css"/>">
</head>
<body>
	<div id="form-main">
		<div id="form-div">
			<p class="email">
				<input name="email" type="text"
					class="validate[required,custom[email]] feedback-input" id="email"
					placeholder="Title" />
			</p>

			<p class="text">
				<textarea name="text"
					class="validate[required,length[6,300]] feedback-input"
					id="comment" placeholder="Comment"></textarea>
			</p>


			<div class="submit">
				<input type="button" value="SEND" id="button-blue" style="text-align: center"/>
				<div class="ease"></div>
			</div>
		</div>
	</div>
</body>
</html>