<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- menu.jsp -->
<style>
	.container {
		width:800px;
	}
</style>
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                	<!-- 검색창 -->
					<nav class="navbar navbar-light bg-light">
					  <div class="container-fluid">
					    <form class="d-flex">
					      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
					       <button class="btn btn-sm btn-outline-secondary" type="button">Search</button>
					    </form>
					  </div>
					</nav>
					
                </ul>
                <ul class="navbar-nav">
					<li class="nav-item">
					    <a class="nav-link btn btn-sm btn-primary" href="enrollProduct" style="background-color:orange; border-color: white;">
					        <span class="text-white">판매등록</span>
					    </a>
					</li>
                </ul>
            </div>
        </div>
    </nav>
</header>
