<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
<style>
    .container {
        width: 600px; /* 가로 길이 조정 */
    }
    .form-control {
        width: 100%;
    }
    .login-title {
        font-family: 'Arial', sans-serif;
        font-size:32px;
        color: orange;
    }
    .login-btn {
        color: white; 
        background-color: orange; 
        border-color: unset;
    }
</style>
</head>
<body>
<div class="d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <form action="auth" method="post" class="p-5 border rounded-3 bg-light">
                    <div class="form-group mb-4 text-center">
                        <p class="login-title">땡땡마켓</p>
                    </div>
                    <div class="form-group mb-3 row">
                        <label for="userid" class="col-sm-3 col-form-label text-end">아이디</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="userid" name="userid">
                        </div>
                    </div>
                    <div class="form-group mb-3 row">
                        <label for="passwd" class="col-sm-3 col-form-label text-end">비밀번호</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control" id="passwd" name="passwd">
                        </div>
                    </div>
                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn login-btn me-2">로그인</button>
                        <a class="btn login-btn me-2" href="signup">회원가입</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
