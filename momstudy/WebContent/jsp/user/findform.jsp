<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/css/find.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/header.css"/>">
    
</head>
<body>
	<c:if test="${param.result} eq 'fail'" >
		
	</c:if>
    <fieldset>
            <div class="nav"></div>
            <div class="main">
                <div class="title">
                    아이디/비밀번호 찾기
                </div>
                <div class="find">
                    <div class="find-item">
                        <div class="find-item-title">
                            아이디 찾기 
                        </div>
                        <div class="find-item-content">
            				<form action="<c:url value="/user/findemail.do"/>" >
	                            <div class="find-item-inputbox">
	                                <input type="text" placeholder="이름" name="name">
	                            </div>
	                            <div class="find-item-inputbox">
	                                <input type="text" placeholder="휴대폰" name="phnum">
	                             </div>
	                      		
	                  			<c:choose>
								<c:when test="${empty param.name }">
		                            <div class="find-item-msg">
		                                 본인인증시 사용하였던 휴대전화로 가입 시 등록했던 이메일을 보내드립니다.
	    	                        </div>						
								</c:when>
								<c:when test="${empty user}">
		                            <div class="find-item-msg">
		                                 입력한 정보를 확인할수 없습니다.		                
	    	                        </div>						
								</c:when>
								<c:otherwise>
		                            <div class="find-item-msg">
		                           	인증되었습니다.
		                            <div>Email : ${user.email}</div>
		                            </div>
								</c:otherwise>
								</c:choose>
	                            <button class="find-item-button">
	                                눌러라                         
	                            </button>
                 		   </form>
                        </div>
                    </div>
                    <div class="find-item">
                        <div class="find-item-title">   
                            비밀번호 찾기
                        </div>
                        <div class="find-item-content">
                  			 <form action="<c:url value='/user/findpass.do'/>" method="post">
	                            <div class="find-item-inputbox">
	                                <input type="text" placeholder="이름" name="name">
	                            </div>
	                            <div class="find-item-inputbox">
	                                <input type="email" placeholder="이메일" name="email">
	                            </div>
	                        	<c:choose>
								<c:when test="${empty param.yyy }">
		                            <div class="find-item-msg">
		                                 본인인증 완료 후  가입 시 등록했던 이메일을 보내드립니다.
	    	                        </div>						
								</c:when>
								<c:when test="${empty user}">
		                            <div class="find-item-msg">
		                                 입력한 정보를 확인할수 없습니다.		                
	    	                        </div>						
								</c:when>
								<c:otherwise>
		                            <div class="find-item-msg">
		                           	인증되었습니다 전송된 이메일을 확인해주세요.
		                            </div>
								</c:otherwise>
								</c:choose>			
	                            <button class="find-item-button">
	                                눌러라
	                            </button>
       						</form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="foot">Copyright © 2019 trillion. All rights reserved.</div>
    </fieldset>
</body>
</html>