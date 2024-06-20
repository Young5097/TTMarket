<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-lg-20">
            <div class="card text-center">
                <img src="images/${productDTO.pImage}" class="card-img-top img-fluid mx-auto d-block" style="max-width:400px; height:auto;" alt="${productDTO.pName}">
                <div class="card-body">
                    <h2 class="card-title">${productDTO.pName}</h2>
                    <p class="card-text">${productDTO.userNickname}</p>
                    <p class="card-text"><span style="color: #888">${productDTO.pCategory}</span> ${productDTO.formattedDate}</p>
                    <hr>
                    <p class="card-text">${productDTO.pExplain}</p>
                    <hr>
                    <p class="card-text"><strong>직거래 희망위치</strong></p>
                    <p class="card-text"><strong>상세위치</strong> ${productDTO.pLocation2}</p>
                    <p class="card-text">${productDTO.pLocation}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col text-center">
            <button class="btn btn-primary mb-4" onclick="history.back()">뒤로가기</button>
        </div>
    </div>
</div>
