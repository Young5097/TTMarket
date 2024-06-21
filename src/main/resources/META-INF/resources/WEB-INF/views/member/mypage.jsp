<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <h2>마이 페이지</h2>
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
        <h4>주소</h4>
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
            <label for="userAddress2" class="col-sm-2 col-form-label">상세주소</label>
            <div class="col-auto">
                <input type="text" name="userAddress2" class="form-control" id="userAddress2" placeholder="상세주소를 입력해주세요." value="${userAddress2}">
            </div>
        </div>
        <br>
        <button type="submit" class="btn btn-primary mb-3" style="color: white; background-color: orange; border-color: unset;">저장</button>
        <hr>    
    </form>
    
    <hr>
    <h3>나의 상품 리스트</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>상품명</th>
                <th>카테고리</th>
                <th>설명</th>
                <th>가격</th>
                <th>수정/삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${productList}" var="product">
                <tr>
                    <td><a href="viewProductDetails?productId=${product.product_num}">${product.pName}</a></td>
                    <td>${product.pCategory}</td>
                    <td>${product.pExplain}</td>
                    <td>${product.pPrice}</td>
                    <td>
                        <button onclick="editProduct(${product.product_num})">수정</button>
                        <button onclick="deleteProduct(${product.product_num})">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="container-info">
		<h4>개인정보수정</h4>
    	<form class="row g-3 m-4">
				  <div class="row mb-3">
				    <label for="userid" class="col-sm-2 col-form-label">	아이디</label>
				    <div class="col-auto">
				      <input type="text" class="form-control" id="userid" name="userid" 
				       value="${login.userid}"
				       disabled="disabled">
				    </div>
				  </div>
		  	
		  <div class="col-12">
		    <button type="submit" class="btn btn-primary"
		    style="color: white; background-color: orange; border-color: unset;">update</button>
		    <button type="reset" class="btn btn-primary"
		    style="color: white; background-color: orange; border-color: unset;">cancel</button>
		  </div>
 		</form>
	</div>
</div>
>>>>>>> 6c5ef02b7df2d27eee0549cb8524fa3cf1420865
