<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#imgDiv {
		margin-top:10px;
		margin-bottom:10px;		
	}
    #img {
        max-width: 200px;
        max-height: 200px;
        object-fit: cover;
        display: block; /* 이미지를 블록 요소로 설정하여 부모 요소(card)의 크기에 맞게 조정 */
        margin: 0 auto; /* 가로 중앙 정렬을 위해 왼쪽과 오른쪽 여백을 자동으로 설정 */
    }
    .card-body {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100%; /* 부모 요소(card)의 높이를 100%로 설정 */
    }
    .card-text {
        font-size: 15px;
        margin-top: 1px;
        margin-bottom: 1px;
    }
    .card-text2 {
        font-size: 20px;
        margin-top: 3px;
        margin-bottom: 0;
    }
    .status-text {
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        font-weight: bold; 
        color: green; 
        height: 200px; /* 이미지 높이와 동일하게 설정 */
    }
</style>
<div class="container" id="productContainer">
    <div class="row row-cols-1 row-cols-md-1" id="productList">
        <c:forEach var="dto" items="${productList}">
            <div class="col mb-4">
                <div class="card">
                    <div class="row g-0">
                        <div class="col-md-4" id="imgDiv">
                            <a id="moveDetail" href="productDetail?product_num=${dto.product_num}">
                                <img src="images/${dto.pImage}" class="img-fluid rounded-start fixed-size-img" id="img" alt="Product Image">
                            </a>
                        </div>
                        <div class="col-md-5">
                            <div class="card-body">
                                <h5 class="card-title"><strong>${dto.pName}</strong></h5>
                                <p class="card-text">${dto.pCategory}</p>
                                <p class="card-text">${dto.pLocation}</p>
                                <p class="card-text2">${dto.pPrice}원</p>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex align-items-center justify-content-center">
                            <div class="status-text">
                                <c:choose>
                                    <c:when test="${dto.pIsTransaction}">
                                        <c:out value="판매완료"></c:out>
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="판매중"></c:out>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
