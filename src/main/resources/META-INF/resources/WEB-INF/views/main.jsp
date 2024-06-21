<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
    }

    body {
        display: flex;
        justify-content: center;
    }

    .App {
        text-align: center;
        font-size: 20px;
        width: 800px;
    }

    label, input, button {
        margin: 10px;
        padding: 5px;
    }

    footer {
        bottom: 0;
        position: absolute;
        width: 90%;
        height: 40px;
    }
</style>

<link rel="stylesheet" href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<div class="App">
    <jsp:include page="common/top.jsp" flush="true" />
    <jsp:include page="common/search.jsp" flush="true" />
	<div id="productListContainer">
        <%@ include file="products/productsList.jsp" %>
    </div>
</div>
<script>

$(document).ready(function() {
    $('#searchForm').submit(function(event) {
        event.preventDefault(); // 기본 form 제출 방지

        var keyword = $('#searchInput').val().trim();
        if (keyword.length > 0) {
            $.ajax({
                url: '/TTMarket/search?keyword=' + encodeURIComponent(keyword),
                type: 'GET',
                success: function(data) {
                    $('#productList').html(data); // 검색 결과로 product list 업데이트
                },
                error: function(xhr, status, error) {
                    console.error('AJAX request error:', status, error);
                }
            });
        }
    });
});

</script>

</body>
</html>


