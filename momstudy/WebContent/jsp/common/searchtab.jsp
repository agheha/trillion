<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<section>
	<div>카테고리</div>
	<div>
		
	</div>
</section>
<section class="content-block content-1-8">
    <div class="container">
     	<form name="codeForm" action="#" method="post">
     		<!-- results의 value 값으로 컨트롤러에 넘길 값 -->
     		<input type="hidden" id="results" name="address" />
        	<ul class="nav nav-tabs text-center address1" role="tablist" id="myTab">
        		<c:forEach items="${bigAList}" varStatus="status" var="address">
		       		<li class="active01">
		            	<a href="#tab${status.count}" role="tab" 
		               	   data-toggle="tab">${address.addressDetail}</a>
		        	</li>
        		</c:forEach>
        	</ul>
        
     <div class="tab-content">
	 	<div class="tab-pane fade in active" id="tab1">
        	<div class="row">
            	<ul class="address2">
            	<c:if test="${empty address}">
					<span>지역을 선택하세요.</span>
				</c:if>              	
                </ul>
            </div>
        </div>
     	<div class="selected">
     		선택된 지역 : 
     		<span id="select-box">
     			<c:if test="${not empty addressList}">
     				<c:forEach items="${addressList}" var="address" varStatus="status">
     					<span class="selected-add" id="det${address.addressCode}" onClick="deleteRegion(${address.addressCode});">${address.addressDetail} ${address.addressDetail2}</span>
     				</c:forEach>
     			</c:if>
     		</span>
     	</div>
    	<button id="sbtn" type="button">검색</button>
     	</form>
</section>
<script src='<c:url value="/script/study/searchtab.js" />'></script>
