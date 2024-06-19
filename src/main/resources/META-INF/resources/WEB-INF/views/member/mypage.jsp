<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="container-info">
		<h4>개인정보수정</h4>
    	<form class="row g-3 m-4">
				  <div class="row mb-3">
				    <label for="userid" class="col-sm-2 col-form-label">	아이디</label>
				    <div class="col-auto">
				      <input type="text" class="form-control" id="userid" name="userid" 
				       value="${login.userid}"
				       disabled="disabled">
				    </div>
				  </div>
		  	
		  <div class="col-12">
		    <button type="submit" class="btn btn-primary"
		    style="color: white; background-color: orange; border-color: unset;">update</button>
		    <button type="reset" class="btn btn-primary"
		    style="color: white; background-color: orange; border-color: unset;">cancel</button>
		  </div>
 		</form>
	</div>
</div>