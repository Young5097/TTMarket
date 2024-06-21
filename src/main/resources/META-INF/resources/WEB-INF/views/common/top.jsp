<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
	.container {
		width:800px;
	}
</style>
<header class="border-bottom border-light border">
  <div class="container">
      <div class="row">
          <nav class="navbar navbar-expand-lg">
              <div class="collapse navbar-collapse">
                  <ul class="navbar-nav">
                      <li class="nav-item">
                          <a class="nav-link" href="main" 
                          style="color: orange;">땡땡마켓</a>
                      </li>
                  </ul>
              </div>

            <ul class="navbar-nav">
                  <sec:authorize access="isAuthenticated()">
                  <li class="nav-item">
                      <a class="nav-link" href="logout" style="color: red;">로그아웃</a>
                  </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                  <li class="nav-item">
                      <a class="nav-link" href="mypage">마이페이지</a>
                  </li>
                 </sec:authorize>
            </ul>

          </nav>
      </div>
  </div>
</header>

