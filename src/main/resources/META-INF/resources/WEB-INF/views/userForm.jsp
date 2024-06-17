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
              <form>
                <div>
                    <label for="userid">userid:</label>
                </div>
                <div>
                    <label for="password">passwd:</label>
                </div>
                 <div>
                    <label for="username">username:</label>
                </div>
                <div>
                    <button name="login" class="btn btn-success m-5" >signup</button>
                </div>
               </form> 
            </div>
        </div>
        </div>
    </div>
</body>
