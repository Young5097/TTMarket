<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
    #enrollContainer {
        margin-top: 20px;
    }
    .form-label {
        color: orange;
    }
    .btn-custom {
        color: white;
        background-color: orange;
        border-color: unset;
        margin-bottom: 30px;
    }
    #pExplain {
    	height: 250px;
    }
</style>
<script>
	$(document).ready(function() {
		var product_num = "${productDTO.product_num}";
		
		$("#update").on("click", function() {
			$.ajax({
				method: "post",
				url: "updateProduct",
				date: { proudct_num: product_num},
				success: function(reponse) {
					alert("수정이 완료되었습니다.")
				},
                error: function(xhr, status, error) {
                    console.log("요청 실패", error);
                }
			});
		});
	});
</script>

<div class="container" id="enrollContainer">
    <h2>상품수정</h2>
    <br>
    <form:form action="updateProduct" modelAttribute="productDTO" method="post" enctype="multipart/form-data">
    	<!-- product_num 보내기 -->
    	<input type="hidden" id="product_num" name="product_num" value="${productDTO.product_num}">
        <div class="row mb-3">
            <label for="pName" class="col-sm-3 col-form-label">상품명</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="pName" name="pName" value="${productDTO.pName}" required>
            </div>
        </div>
        <div class="row mb-3">
            <label for="pCategory" class="col-sm-3 col-form-label">카테고리</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="pCategory" name="pCategory" value="${productDTO.pCategory}" required>
            </div>
        </div>
        <div class="row mb-3">
            <label for="pExplain" class="col-sm-3 col-form-label">상품설명</label>
            <div class="col-sm-6">
                <textarea class="form-control" id="pExplain" name="pExplain">${productDTO.pExplain}</textarea>
            </div>
        </div>
        <div class="row mb-3">
            <label for="pPrice" class="col-sm-3 col-form-label">가격</label>
            <div class="col-sm-6">
                <input type="number" class="form-control" id="pPrice" name="pPrice" value="${productDTO.pPrice}" required>
            </div>
        </div>
        <div class="row mb-3">
            <label for="sample4_postcode" class="col-sm-3 col-form-label">거래장소</label>
            <div class="col-sm-4">
                <input type="text" name="post" class="form-control" id="sample4_postcode" placeholder="우편번호" disabled="disabled">
            </div>
            <div class="col-sm-2">
                <button type="button" class="btn btn-custom mb-3" onclick="sample4_execDaumPostcode()">주소찾기</button>
            </div>
        </div>
        <div class="row mb-3">
            <label for="pLocation" class="col-sm-3 col-form-label"></label>
            <div class="col-sm-6">
                <input type="text" name="pLocation" class="form-control" id="pLocation" value="${productDTO.pLocation}">
                <span id="guide" style="color:#999"></span>
            </div>
        </div>
        <div class="row mb-3">
            <label for="pLocation2" class="col-sm-3 col-form-label"></label>
            <div class="col-sm-6">
                <input type="text" name="pLocation2" class="form-control" id="pLocation2" value="${productDTO.pLocation2}">
            </div>
        </div>
        
        <div class="row mb-3">
            <label for="multipartFile" class="col-sm-3 col-form-label">이미지</label>
            <div class="col-sm-6">
                <input type="file" class="form-control" id="multipartFile" name="multipartFile">
                <p style="font-size:14px; color:red; text-align: left">수정을 원치않으면 건너뛰세요</p>
            </div>
        </div>
        
        <div class="row justify-content-center">
            <div class="col-sm-6 text-center">
                <button type="submit" class="btn btn-custom" id="update">수정</button>
                <a class="btn btn-custom me-2" href="main">취소</a>
            </div>
        </div>
    </form:form>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullRoadAddr = data.roadAddress;
                var extraRoadAddr = '';

                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraRoadAddr !== '') {
                    fullRoadAddr += ' (' + extraRoadAddr + ')';
                }

                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById('pLocation').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                if (data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                } else if (data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>