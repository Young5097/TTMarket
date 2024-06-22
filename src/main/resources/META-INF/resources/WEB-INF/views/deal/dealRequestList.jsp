<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #title_list {
        font-size: 25px; 
        font-weight: bold; 
        color: orange;
        margin-top:20px;
    }
    
    td, th {
        font-size: 14px;
    }
</style>
<script>
    $(document).ready(function() {
        $(".checkDealSeller").click(function(e) {
            e.preventDefault();
            
            var productNum = $(this).data("product-num");
            var buyerNick = $(this).data("buyer-nick");
            
            if (confirm("정말로 이 상품을 삭제하시겠습니까?")) {
	            $.ajax({
	                url: "selectBuyer",
	                method: "POST",
	                data: {
	                    product_num: productNum,
	                    buyer_nick: buyerNick
	                },
	                success: function(response) {
	                	if(reponse="success") {
	                		alert("거래가 확정되었습니다");
	                    	window.location.reload();
	                	} else {
	                        alert("삭제 실패");
	                    }
	                },
	                error: function(xhr, status, error) {
	                    console.error("Error while selecting buyer: " + error);
	                }
	            });
            }
        });
        
	    $(".back").on("click", function() {
	        window.location.href = "mypage"; 
	    });
    });
    
</script>

<div class="container">
    <div id="requsetProductForm">
        <p id="title_list">거래신청내역</p>
        <table class="table table-bordered table-hover">
            <thead class="table-control">
                <tr>
                    <th scope="col">구매희망자</th>
                    <th scope="col">신청날짜</th>
                    <th scope="col">거래단계</th>
                    <th scope="col">거래확정/거래확인</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${dealList}" var="deal">
                    <tr>
                        <td>${deal.buyer_nick}</td>
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
                            <div class="btn-group">
                                <button class="btn btn-sm checkDealSeller" 
                                        style="font-size: 12px; color:white; background-color: orange; margin-right:5px"
                                        data-product-num="${deal.product_num}"
                                        data-buyer-nick="${deal.buyer_nick}">
                                    거래확정
                                </button>
                                <button class="btn btn-sm checkDealComplete" 
                                        style="font-size: 12px; color:white; background-color: orange;">
                                    거래완료
                                </button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
		<button class="btn btn-sm back" style="font-size: 12px; color:white; background-color: orange;">
		    돌아가기
		</button>
    </div>
</div>

