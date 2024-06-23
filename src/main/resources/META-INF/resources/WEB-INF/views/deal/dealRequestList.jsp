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
            
            if (confirm("해당 희망자와 거래를 확정하시겠습니까?")) {
	            $.ajax({
	                url: "selectBuyer",
	                method: "POST",
	                data: {
	                    product_num: productNum,
	                    buyer_nick: buyerNick
	                },
	                success: function(response) {
	                	if(reponse==="success") {
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
        
        $(".checkDealComplete").on("click", function(e) {     
        	e.preventDefault();
        	
        	var product_num = $(this).data("product-num");
        	var seller_nick = $(this).data("seller-nick");
        	var select_buyer = $(this).data("select-buyer");
        	var buyer_check = $(this).data("buyer-check");
        	
        	if (confirm("거래를 완료하시겠습니까?")) {
                $.ajax({
                    method: "POST",
                    url: "dealCompleteSeller",
                    data: { product_num: product_num,
                    		seller_nick: seller_nick,
                    		select_buyer: select_buyer,
                    		buyer_check: buyer_check.toString()
                    	},
                    success: function(response) {
                        if (response==="success") {
                            alert("거래가 완료되었습니다.");
							// window.location.reload();
                        } else if (response==="fail1") {
                            alert("거래확정이 되지 않았습니다. 거래확정여부를 확인 해주세요");
                        } else if (response==="fail2") {
                        	alert("구매자가 거래완료여부가 확인되지 않았습니다. 구매자의 구매확정전까지 기다려주세요.")
                        } else if (response==="fail3") {
                        	alert("이미 판매완료 되었습니다.")
                    	}
                    },
                    error: function(xhr, status, error) {
                        console.log("요청 실패", error);
                    }
                });
            } else {
                console.log("사용자가 삭제를 취소했습니다.");
            }
        }); // 거래완료
        
	    $(".back").on("click", function() {
	        window.location.href = "mypage"; 
	    }); // 마이페이지로 돌아가기
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
                                <c:when test="${empty deal.select_buyer}">
                                	<span style="color: red; font-weight:bold">
	                                	<c:out value="대기중"></c:out>
	                                </span>
                                </c:when>
                                <c:when test="${not empty deal.select_buyer and !deal.isCheckedDeal}">
                                	<span style="color: orange; font-weight:bold">
	                                	<c:out value="거래확정"></c:out>
	                                </span>
                                </c:when>
                                <c:when test="${not empty deal.select_buyer and deal.isCheckedDeal}">
                                	<span style="color: green; font-weight:bold">
	                                	<c:out value="거래완료"></c:out>
	                                </span>
                                </c:when>
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
                                <button class="btn btn-sm checkDealComplete" style="font-size: 12px; color:white; background-color: orange;"
                                		data-product-num="${deal.product_num}"
	                        			data-seller-nick="${deal.seller_nick}"
	                        			data-select-buyer="${deal.select_buyer}"
	                        			data-buyer-check="${deal.buyer_check}">			
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

