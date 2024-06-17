<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인홈페이지</title>
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet" >
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
</head>

<body>
	<div class="TodoApp">
    <div class="container">
            <div class="Login">
            <h1>회원가입화면</h1>
            <div class="signUpForm">
              <form:form method="post" modelAttribute="userDTO" 
              action="signup">
                <div>
                    <label for="userid">userid:</label>
                    <form:input type="text" path="userid"/>
                </div>
                <div>
                    <label for="password">passwd:</label>
                    <form:input type="text" path="passwd"/>
                </div>
                <div>
                    <label for="email">email:</label>
                    <form:input type="text" path="email"/>
                </div>
                 <div>
                    <label for="userName">userName:</label>
                    <form:input type="text" path="userName" />
                </div>
                <div>
                    <label for="userNickName">userNickName:</label>
                    <form:input type="text" path="userNickName" />
                </div>
                <div>
                    <label for="phoneNum">phoneNum:</label>
                    <form:input type="text" path="phoneNum" />
                </div>
                <div>
                    <label for="userAddress1">userAddress1:</label>
                    <form:input type="text" path="userAddress1"/>
                </div>
                <div>
                    <label for="userAddress2">userAddress2:</label>
                    <form:input type="text" path="userAddress2"/>
                </div>
                <div>
                    <button class="btn btn-success m-5">회원가입</button>
                </div>
               </form:form> 
            </div>
        </div>
        </div>
    </div>
</body>
