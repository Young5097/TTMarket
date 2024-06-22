<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript">
    $(document).ready(function() {
        $(".removeProduct").on("click", function() {
            var product_num = $(this).data("product-num");
            
            // 확인 창을 띄우기
            if (confirm("정말로 이 상품을 삭제하시겠습니까?")) {
                $.ajax({
                    method: "post",
                    url: "removeProductController",
                    data: { product_num: product_num },
                    success: function(response) {
                        if (response === "success") {
                            alert("삭제가 완료되었습니다.");
							location.reload();
                        } else {
                            alert("삭제 실패");
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log("요청 실패", error);
                    }
                });
            } else {
                // 사용자가 취소를 선택한 경우 처리할 내용
                console.log("사용자가 삭제를 취소했습니다.");
            }
        });     
    });
</script>
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
	                <th scope="col">제목</th>
	                <th scope="col">카테고리</th>
	                <th scope="col">가격</th>
	                <th scope="col">거래완료여부</th>
	                <th scope="col">수정/삭제</th>
	                <th scope="col">거래신청확인</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach items="${productList}" var="productDTO">
	                <tr>
	                    <td>
	                    	<a href="productDetail?product_num=${productDTO.product_num}" class="text-decoration-none" style="color: black; font-size: 14px;">
	                    		${productDTO.pName}
	                    	</a>
	                    </td>
	                    <td>${productDTO.pCategory}</td>
	                    <td>${productDTO.pPrice}</td>
	                    <td>
	                    	<c:choose>
	                    		<c:when test="${productDTO.pIsTransaction}">
	                    			<c:out value="거래완료"></c:out>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<c:out value="거래중"></c:out>
	                    		</c:otherwise>
	                    	</c:choose>
	                    </td>
	                    <td>
	                    	<c:if test="${!productDTO.pIsTransaction}">
	                        	<button class="btn btn-sm btn-primary" style="font-size: 12px;" onclick="location.href='updateProduct?product_num=${productDTO.product_num}'">수정</button>
	                        </c:if>
	                        <button class="btn btn-sm btn-danger removeProduct" style="font-size:12px;"
	                        		data-product-num="${productDTO.product_num}">삭제</button>
	                    </td>
	                    <td>
	                    	<form action="dealRequestList" method="post">
	                    		<input type="hidden" name="product_num" value="${productDTO.product_num}" />
	                    		<input type="hidden" name="userNickname" value="${productDTO.userNickname}" />
		                    	<button class="btn btn-sm btn-warning" id="dealRequest" style="font-size:12px;color:white">신청내역</button>
	                    	</form>
	                    </td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</div><br>	
	
 	<div id="selectDealInfo">
	    <p id="title_list">거래신청내역</p>
	    <table class="table table-bordered table-hover">
	        <thead class="table-control">
	            <tr>
	                <th scope="col">제목</th>
	                <th scope="col">판매자</th>
	                <th scope="col">신청날짜</th>
	                <th scope="col">거래단계</th>
	                <th scope="col">거래확인</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach items="${dealRequestList}" var="deal">
	                <tr>
	                    <td>
	                    	<a href="productDetail?product_num=${deal.product_num}" class="text-decoration-none" style="color: black; font-size: 14px;">
	                    		${deal.pName}
	                    	</a>
	                    </td>
	                    <td>
	                    	${deal.seller_nick}
	                    </td>
	                    <td>
	                    	<fmt:formatDate value="${deal.requestDealDate}" pattern="yyyy-MM-dd"/>
	                    </td>
	                    <td>
	                    	<c:choose>
                                <c:when test="${empty deal.select_buyer}">대기중</c:when>
                                <c:when test="${not empty deal.select_buyer}">거래확정</c:when>
                            </c:choose>
	                    </td>
	                    <td>
	                        <button class="btn btn-sm btn checkDealComplete" style="font-size: 12px; color:white; background-color: orange;"
	                        		data-product-num="${deal.product_num}">거래완료</button>
	                    </td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</div>
	<br><br>
</div>





