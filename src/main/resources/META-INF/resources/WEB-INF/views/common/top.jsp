<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
	.container {
		width:800px;
		display: fixed;
	}
	#xxx {
		border: 1px solid #ddd;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	.nav-link {
		font-size: 18px; 
		font-weight: bold; 
		color: orange;
	}
</style>
<header class="border-bottom border-light border">
  <div class="container" id="xxx">
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
                      <a class="nav-link" href="logout" style="color: red;">logout</a>
                  </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                  <li class="nav-item">
                      <a class="nav-link" href="mypage">mypage</a>
                  </li>
                 </sec:authorize>
            </ul>

          </nav>
      </div>
  </div>
</header>

