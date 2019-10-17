<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	

<section class="content-block content-1-8">
    <div class="container">
     	<form name="codeForm" action="#" method="post">
     		<!-- results의 value 값으로 컨트롤러에 넘길 값 -->
     		<input type="hidden" id="results" name="address" />
        	<ul class="nav nav-tabs text-center address1" role="tablist" id="myTab">
        		<!-- 
        		<div class="tab">
        			<c:forEach items="${bigAList}" varStatus="status" var="address">
	  					<button class="tablinks active01" onclick="openCity(event, '${address.addressDetail}')"data-toggle="tab">${address.addressDetail}</button>
					</c:forEach>
				</div>
        		 -->
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
            	<!-- 
            		<div id="London" class="tabcontent">
  						<h3>London</h3>
  						<p>London is the capital city of England.</p>
					</div>
            	 -->
            	<c:if test="${empty address}">
					<span>지역을 선택하세요.</span>
				</c:if>              	
                </ul>
            </div>
        </div>
        <div class="disTab">
        	<div>
		     	<div class="selected">
		     		<div>
			     		선택된 지역 : 
		     		</div>
		     		<div id="select-box">
		     			<c:if test="${not empty addressList}">
		     				<c:forEach items="${addressList}" var="address" varStatus="status">
		     					<span class="selected-add" id="det${address.addressCode}" onClick="deleteRegion(${address.addressCode});">${address.addressDetail} ${address.addressDetail2}</span>
		     				</c:forEach>
		     			</c:if>
		     		</div>
		     	</div>
        	</div>
        	<div>
		    	<button id="sbtn" type="button">검색</button>
        	</div>
        </div>
     	</form>
</section>
<script src='<c:url value="/script/study/searchtab.js" />'></script>
