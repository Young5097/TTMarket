<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#productImage {
		max-width:500px; 
		max-height:500px;
		object-fit: cover;
		margin-top:15px;
	}
	#map-container {
		width:500px; 
		height:400px; 
		margin: 0 auto;
	}
</style>
<script type="text/javascript">
    $(document).ready(function() {
        var product_num = "${productDTO.product_num}";
        var userNickname = "${productDTO.userNickname}";

        $("#putDeal").on("click", function() {
            $.ajax({
                method: "post",
                url: "putDeal",
                data: { product_num: product_num, userNickname: userNickname },
                success: function(response) {
                    alert("거래신청이 완료되었습니다.")
                },
                error: function(xhr, status, error) {
                    console.log("요청 실패", error);
                }
            });
        });
    });
</script>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-lg-20">
            <div class="card">
                <img id="productImage" src="images/${productDTO.pImage}" class="card-img-top img-fluid mx-auto d-block" alt="${productDTO.pName}">
                <div class="card-body">
                    <h2 class="card-title">${productDTO.pName}</h2>
                    <p class="card-text">${productDTO.userNickname}</p>
                    <p class="card-text"><span style="color: #888">${productDTO.pCategory}</span> ${productDTO.formattedDate}</p>
                    <hr>
                    <p class="card-text">${productDTO.pExplain}</p>
                    <hr>
                    <p class="card-text"><strong>직거래 희망위치</strong></p>
                    <p class="card-text">${productDTO.pLocation}</p>
                    <div id="map-container"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col text-center">
        	<button class="btn btn-primary mb-4" id="putDeal">거래신청</button>
            <button class="btn btn-primary mb-4" onclick="history.back()">뒤로가기</button>
        </div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d0911bc3afefeb5f65c984f96a4283e&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map-container'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	console.log(geocoder)
	// 주소로 좌표를 검색합니다
	
	geocoder.addressSearch('${productDTO.pLocation}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        if ('${productDTO.pLocation2}') {
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0; font-size: 14px;">${productDTO.pLocation2}</div>'
		        });
		        infowindow.open(map, marker);
	        }
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
</script>