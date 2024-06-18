<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <div class="row row-cols-1 row-cols-md-1">
        <c:forEach var="dto" items="${productList}">
            <div class="col mb-1">
                <div class="card">
                    <img src="images/items/${dto.pImage}.gif" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${dto.pName}</h5>
                        <p class="card-text">${dto.pCategory}</p>
                        <p class="card-text">${dto.pLocation}</p>
                        <p class="card-text">
                        	<c:choose>
                        		<c:when test="${dto.pIsTransaction}"><c:out value="판매완료"></c:out></c:when>
                        		<c:when test="${!dto.pIsTransaction}"><c:out value="판매중"></c:out></c:when>
                        	</c:choose>
                        </p>
                        <a href="#" class="btn btn-primary">상세 보기</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
