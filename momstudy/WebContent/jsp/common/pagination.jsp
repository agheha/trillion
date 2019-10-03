<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<style>
.ulcontent {
	width: max-content;
	margin: auto;
	list-style-type: none;
}

.lis {
	width: 20px;
	height: 20px;
	float: left;
	padding: 10px;
	text-align: center;
}

.lis:hover {
	color: rgb(12, 209, 209);
}
</style>
</head>
<body>
	<div class="ulcontent">
		<ul>
			<li class="lis"><button><<</button></li>
			<li class="lis"><button><</button></li>
			<li class="lis">1</li>
			<li class="lis">2</li>
			<li class="lis">3</li>
			<li class="lis">4</li>
			<li class="lis">5</li>
			<li class="lis"><button>></button></li>
			<li class="lis"><button>>></button></li>
		</ul>
	</div>
</body>
</html>