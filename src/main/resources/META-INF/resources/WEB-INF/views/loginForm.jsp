<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인홈페이지</title>
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css"  rel="stylesheet" >
</head>

<body>
<div class="d-flex justify-content-center align-items-center vh-100">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8"> <!-- 박스 크기를 키우기 위해 col-md-8로 변경 -->
                <form action="auth" method="post" class="p-5 border rounded-3 bg-light">
                    <div class="form-group mb-4 text-center"> <!-- 제목 중앙 정렬 -->
                        <h1>땡땡마켓</h1>
                    </div>
                    <div class="form-group mb-3 row">
                        <label for="userid" class="col-sm-3 col-form-label text-end">아이디</label> <!-- 텍스트 정렬 -->
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="userid" name="userid">
                        </div>
                    </div>
                    <div class="form-group mb-3 row">
                        <label for="passwd" class="col-sm-3 col-form-label text-end">비밀번호</label> <!-- 텍스트 정렬 -->
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="passwd" name="passwd">
                        </div>
                    </div>
                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary me-2">로그인</button>
                        <a class="btn btn-primary me-2" href="signup">회원가입</a> <!-- 회원가입 버튼을 secondary로 변경 -->
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>