<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#enrollContainer {
		margin-top: 20px;
	}
</style>
<div class="container" id="enrollContainer">
    <h2>상품 등록</h2>
    <br>
    <form action="enrollProduct" modelAttribute="productDTO"
    	method="post" enctype="multipart/form-data">
        <div class="row mb-3">
            <label for="pName" class="col-sm-3 col-form-label">상품명</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="pName" name="pName" required>
            </div>
        </div>
        <div class="row mb-3">
            <label for="pCategory" class="col-sm-3 col-form-label">카테고리</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="pCategory" name="pCategory" required>
            </div>
        </div>
        <div class="row mb-3">
            <label for="pExplain" class="col-sm-3 col-form-label">상품설명</label>
            <div class="col-sm-6">
                 <input type="text" class="form-control" id="pExplain" name="pExplain" style="height: 200px;">
            </div>
        </div>
        <div class="row mb-3">
            <label for="pPrice" class="col-sm-3 col-form-label">가격</label>
            <div class="col-sm-6">
                <input type="number" class="form-control" id="pPrice" name="pPrice" required>
            </div>
        </div>
        <div class="row mb-3">
            <label for="pLocation" class="col-sm-3 col-form-label">위치</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="pLocation" name="pLocation" required>
            </div>
        </div>
         
        <div class="row mb-3">
            <label for="multipartFile" class="col-sm-3 col-form-label">이미지</label>
            <div class="col-sm-6">
                <input type="file" class="form-control" id="multipartFile" name="multipartFile">
            </div>
        </div>
        
		<div class="row justify-content-center">
		    <div class="col-sm-6 text-center">
		         <button type="submit" class="btn btn-primary">등록</button>
		         <a class="btn btn-primary me-2" href="main">취소</a>
		    </div>
		</div>

    </form>
</div>