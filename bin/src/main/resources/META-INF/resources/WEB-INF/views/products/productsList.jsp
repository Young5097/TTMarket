<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" id="productContainer">
    <div class="row row-cols-1 row-cols-md-1" id="productList">
        <c:forEach var="dto" items="${productList}">
            <div class="col mb-4">
                <div class="card">
                    <div class="row g-0">
                        <div class="col-md-4">
                        <a id="moveDetail" href="productDetail?product_num=${dto.product_num}">
                            <img src="images/${dto.pImage}" class="img-fluid rounded-start" alt="Product Image">
                        </a>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">${dto.pName}</h5>
                                <p class="card-text">${dto.pCategory}</p>
                                <p class="card-text">${dto.pLocation}</p>
                                <p class="card-text">
                                    <c:choose>
                                        <c:when test="${dto.pIsTransaction}">
                                            <c:out value="판매완료"></c:out>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="판매중"></c:out>
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script>
$(document).ready(function() {
    var page = 1;
    var loading = false;
    
    $(window).scroll(function() {
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100 && !loading) {
            loading = true;
            page++;
            $.ajax({
                url: '/main?page=' + page,
                success: function(data) {
                    if (data.trim().length == 0) {
                        loading = true; // No more data available
                    } else {
                        $('#productList').append(data);
                        loading = false;
                    }
                }
            });
        }
    });
});
</script>