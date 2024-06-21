<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#fixForm {
		border: 1px solid #ddd;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	#title_update {
		margin:20px;
		font-size: 25px; 
		font-weight: bold; 
		color: orange;
	}
	#title_update2 {
		margin:10px;
		font-size: 18px; 
		font-weight: bold; 
		color: orange;
	}
	
	#title_list {
		font-size: 25px; 
		font-weight: bold; 
		color: orange;
	}
	
	td, th {
		font-size: 14px;
	}
</style>
<div class="container">
	<div id="fixForm">
	    <p id="title_update">회원정보 수정</p>
	    <form action="updateUserInfo" method="post">
	        <div class="row mb-3">
	            <label for="userid" class="col-sm-2 col-form-label">아이디</label>
	            <div class="col-auto">
	                <input type="text" class="form-control" name="userid" id="userid" value="${userid}" disabled="disabled"/>
	            </div>
	        </div>
	        <div class="row mb-3">
	            <label for="userNickName" class="col-sm-2 col-form-label">닉네임</label>
	            <div class="col-auto">
	                <input type="text" class="form-control" id="userNickName" name="userNickName" value="${userNickname}" disabled="disabled"/>             
	            </div>
	        </div>
	        <div class="row mb-3">
	            <label for="phoneNum" class="col-sm-2 col-form-label">전화번호</label>
	            <div class="col-auto">
	                <input type="text" class="form-control" id="phoneNum" name="phoneNum" value="${phoneNum}"/>
	            </div>                 
	        </div>       
	        <div class="row mb-3">
	            <label for="email" class="col-sm-2 col-form-label">이메일</label>
	            <div class="col-auto">
	                <input type="text" class="form-control" id="email" name="email" value="${email}"/>
	            </div>
	        </div>         
	        <hr>
	        <p id="title_update2">주소</p>
	        <div class="row mb-3">
	            <div class="col-auto">
	                <label for="sample4_postcode" class="visually-hidden">post</label>
	                <input type="text" name="post" class="form-control" id="sample4_postcode" placeholder="우편번호">
	            </div>
	            <div class="col-auto">
	                <button type="button" class="btn btn-primary mb-3" onclick="sample4_execDaumPostcode()" 
	                style="color: white; background-color: orange; border-color: unset;">우편번호 찾기</button>
	            </div>
	        </div>
	
	        <div class="col-sm-5">
	            <label for="sample4_roadAddress" class="visually-hidden">도로명주소</label>
	            <input type="text" name="userAddress1" class="form-control" id="userAddress1" placeholder="도로명주소" value="${userAddress1}">
	        </div>
	        <div class="col-sm-5">
	            <label for="sample4_jibunAddress" class="visually-hidden">지번주소</label>
	            <input type="text" name="addr2" class="form-control" id="sample4_jibunAddress" placeholder="지번주소">
	            <span id="guide" style="color:#999"></span>
	        </div>
	
	        <div>
	        	<p id="title_update2">상세주소</p>
	            <!--<label for="userAddress2" class="col-sm-2 col-form-label">상세주소</label>-->
	            <div class="col-auto">
	                <input type="text" name="userAddress2" class="form-control" id="userAddress2" placeholder="상세주소를 입력해주세요." value="${userAddress2}">
	            </div>
	        </div>
	        <br>
	        <button type="submit" class="btn btn-primary mb-3" style="color: white; background-color: orange; border-color: unset;">저장</button>   
	    </form>
    </div>
    <br>
    <div id="myProductForm">
	    <p id="title_list">판매내역</p>
	    <table class="table table-bordered table-hover">
	        <thead class="table-control">
	            <tr>
	                <th scope="col">상품명</th>
	                <th scope="col">카테고리</th>
	                <th scope="col">가격</th>
	                <th scope="col">수정/삭제/거래확인</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach items="${productList}" var="product">
	                <tr>
	                    <td><a href="productDetail?product_num=${product.product_num}" class="text-decoration-none" style="color: black; font-size: 14px;">${product.pName}</a></td>
	                    <td>${product.pCategory}</td>
	                    <td>${product.pPrice}</td>
	                    <td>
	                        <button class="btn btn-sm btn-primary" style="font-size: 12px;" onclick="location.href='updateProduct?product_num=${product.product_num}'">수정</button>
	                        <button class="btn btn-sm btn-danger" style="font-size: 12px;" onclick="deleteProduct(${product.product_num})">삭제</button>
	                        <button class="btn btn-sm btn" style="font-size: 12px; color:white; background-color: orange;" onclick="deleteProduct(${product.product_num})">거래확인</button>
	                    </td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</div>
	
	<div id="myProductForm">
	    <p id="title_list">판매내역</p>
	    <table class="table table-bordered table-hover">
	        <thead class="table-control">
	            <tr>
	                <th scope="col">상품명</th>
	                <th scope="col">카테고리</th>
	                <th scope="col">가격</th>
	                <th scope="col">수정/삭제</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach items="${productList}" var="product">
	                <tr>
	                    <td><a href="productDetail?product_num=${product.product_num}" class="text-decoration-none" style="color: black; font-size: 14px;">${product.pName}</a></td>
	                    <td>${product.pCategory}</td>
	                    <td>${product.pPrice}</td>
	                    <td>
	                        <button class="btn btn-sm btn-primary" style="font-size: 12px;" onclick="location.href='updateProduct?product_num=${product.product_num}'">수정</button>
	                        <button class="btn btn-sm btn-danger" style="font-size: 12px;" onclick="deleteProduct(${product.product_num})">삭제</button>
	                    </td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	    <br><br>    
	</div>
</div>





