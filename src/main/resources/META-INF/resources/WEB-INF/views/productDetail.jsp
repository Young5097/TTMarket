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
    <jsp:include page="products/productDetail.jsp" flush="true" />
</div>
</body>
</html>
