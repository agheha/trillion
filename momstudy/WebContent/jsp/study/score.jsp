<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href='<c:url value="/css/score.css" />'>



<div class="container">
	<div class="inner">
		<div class="rating">
			<span class="rating-num" id="avg"> 0.0 </span>
			<div class="rating-stars">
				<span class="stars"><i class="icon-star"></i></span> <span class="stars"><i
					class="icon-star"></i></span> <span class="stars"><i class="icon-star"></i></span> <span
					class="stars"><i class="icon-star"></i></span> <span class="stars"><i
					class="icon-star"></i></span>
			</div>
			<div class="rating-users" id="total">
				<i class="icon-user"></i> 0 total
			</div>
		</div>

		<div class="histo">
			<div class="five histo-rate">
				<span class="histo-star"> <i class="active icon-star"></i> 5
				</span> <span class="bar-block"> <span id="bar-five" class="bar">
						<span class="cnt" index="5"></span>&nbsp;
				</span>
				</span>
			</div>

			<div class="four histo-rate">
				<span class="histo-star"> <i class="active icon-star"></i> 4
				</span> <span class="bar-block"> <span id="bar-four" class="bar">
						<span class="cnt" index="4"></span>&nbsp;
				</span>
				</span>
			</div>

			<div class="three histo-rate">
				<span class="histo-star"> <i class="active icon-star"></i> 3
				</span> <span class="bar-block"> <span id="bar-three" class="bar">
						<span class="cnt" index="3"></span>&nbsp;
				</span>
				</span>
			</div>

			<div class="two histo-rate">
				<span class="histo-star"> <i class="active icon-star"></i> 2
				</span> <span class="bar-block"> <span id="bar-two" class="bar">
						<span class="cnt" index="2"></span>&nbsp;
				</span>
				</span>
			</div>

			<div class="one histo-rate">
				<span class="histo-star"> <i class="active icon-star"></i> 1
				</span> <span class="bar-block"> <span id="bar-one" class="bar">
						<span class="cnt" index="1"></span>&nbsp;
				</span>
				</span>
			</div>
		</div>
	</div>
</div>

<script src="<c:url value="/script/study/score.js"/>"></script>