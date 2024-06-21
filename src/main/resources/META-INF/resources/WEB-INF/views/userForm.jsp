<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet" >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        
    		// 비번 확인
		    $("#passwd2").on("keyup", function(){
		        var passwd = $("#passwd").val();
		        var passwd2 = $(this).val();
		        var mesg = "비번일치";
		        if(passwd != passwd2){
		            mesg = "비밀번호가 일치하지 않습니다.";
		        }
		        $("#pwdcheck").text(mesg);
		    });
    		
	        // nickname 중복체크
	        $("#userNicknameCheckBtn").on("click", function() {
	            // AJAX 요청 보내기
	            $.ajax({
	                method: "get",
	                url: "/TTMarket/userNicknameCheck", // 서버에서 처리할 URL
	                dataType: 'text', // 응답 데이터 타입
	                data: {
	                    userNickname: $("#userNickName").val() // 입력된 닉네임 값 가져오기
	                },
	                success: function(data, status, xhr){
	                    // 요청 성공 시 실행될 함수
	                    console.log("data:", data); // 서버에서 받은 데이터 출력
	                    $("#userNicknameCheck").text(data); // userNicknameCheck 요소에 결과 텍스트 업데이트
	                    if (data.trim() === "사용 가능한 닉네임입니다.") {
	                        $("#userNicknameCheck").removeClass("check-custom").addClass("check-available");
	                    } else {
	                        $("#userNicknameCheck").removeClass("check-available").addClass("check-custom");
	                    }
	                },
	                error: function(xhr, status, error){
	                    // 요청 실패 시 실행될 함수
	                    console.log("error:", error); // 오류 메시지 출력
	                }
	            });

	        });

	     // id 중복체크
	        $("#idDupulicatedcheckBtn").on("click", function(){
	            // AJAX 요청 보내기
	            $.ajax({
	                method: "get",
	                url: "/TTMarket/idCheck", // 서버에서 처리할 URL
	                dataType: 'text', // 응답 데이터 타입
	                data: {
	                    userid: $("#userid").val() // 입력된 아이디 값 가져오기
	                },
	                success: function(data, status, xhr){
	                    // 요청 성공 시 실행될 함수
	                    console.log("data:", data); // 서버에서 받은 데이터 출력
	                    $("#idcheck").text(data); // idcheck 요소에 결과 텍스트 업데이트
	                    
	                    // 결과에 따라 텍스트 색상 클래스 적용
	                    if (data.trim() === "사용 가능한 아이디입니다.") {
	                        $("#idcheck").removeClass("check-custom").addClass("check-available");
	                    } else {
	                        $("#idcheck").removeClass("check-available").addClass("check-custom");
	                    }
	                },
	                error: function(xhr, status, error){
	                    // 요청 실패 시 실행될 함수
	                    console.log("error:", error); // 오류 메시지 출력
	                }
	            });
	        });
	     
    });
</script>
<style>
    .error {
        color: red; 
        font-size: 12px; 
        font-weight: normal; 
    }
    
	.check-custom {
	    color: red;
	}
	
	.check-available {
	    color: black;
	}

	.container {
		width: 800px;
		margin: 0 auto;
		padding: 20px;
		border: 1px solid #ddd;
		border-radius: 10px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		background-color: #f9f9f9;
	}

	.Login {
		display: flex;
		justify-content: center;
		align-items: center;
		min-height: 100vh;
	}

	.signUpForm {
		width: 100%;
	}

	.btn-custom {
		color: white; 
		background-color: orange; 
		border-color: unset;
	}

	.fs-5 {
		font-size: 1.25rem;
	}
</style>

<div class="container">
    <div class="Login">
        <div class="signUpForm">
            <form:form class="row g-3 m-4" method="post" modelAttribute="userDTO" action="signup">
            	<h2>회원가입</h2>
				<div class="row mb-3">
				    <label for="userid" class="col-sm-2 col-form-label">아이디</label>
				    <div class="col-auto">
				        <form:input type="text" class="form-control" name="userid" path="userid" id="userid"
				        placeholder="4자 이상, 20자 이하"/>
				        <form:errors path="userid" cssClass="error"></form:errors>
				    </div>
				    <div class="col-auto">
				        <button type="button" class="btn btn-primary mb-3 btn-custom" id="idDupulicatedcheckBtn" 
				        style="color: white; background-color: orange; border-color: unset;" >아이디중복</button>
				    </div>
				    <div class="col-sm-3">
				        <span id="idcheck" class="fs-5 check-custom"></span>
				    </div>
				</div>


                <div class="row mb-3">
                    <label for="password" class="col-sm-2 col-form-label">비밀번호</label>
                    <div class="col-auto">
                        <form:input type="password" class="form-control" path="passwd" id="passwd" name="passwd" 
                        placeholder="4자 이상, 20자 이하"/>
                        <form:errors path="passwd" cssClass="error"></form:errors>
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="passwd2" class="col-sm-2 col-form-label">비밀번호확인</label>
                    <div class="col-auto">
                        <form:input type="password" class="form-control" name="passwd2" id="passwd2" path="passwd2" />
                        <form:errors path="passwd2" cssClass="error"></form:errors>
                    </div>
                    <div class="col-sm-3">
                        <span id="pwdcheck" class="fs-5"></span>
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="email" class="col-sm-2 col-form-label">이메일</label>
                    <div class="col-auto">
                        <form:input type="text" class="form-control" id="email" path="email" 
                        placeholder="sample@sample.com"/>
                        <form:errors path="email" cssClass="error"></form:errors>
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="userName" class="col-sm-2 col-form-label">이름</label>
                    <div class="col-auto">
                        <form:input type="text" class="form-control" path="userName" id="userName" name="userName" />
                        <form:errors path="userName" cssClass="error"></form:errors>
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="userNickName" class="col-sm-2 col-form-label">닉네임</label>
                    <div class="col-auto">
                        <form:input type="text" class="form-control" path="userNickName" id="userNickName" name="userNickName" 
                        placeholder="2글자이상"/>
                        <form:errors path="userNickName" cssClass="error"></form:errors>
                    </div>  
				    <div class="col-auto">
				        <button type="button" class="btn btn-primary mb-3 btn-custom" id="userNicknameCheckBtn" 
				        style="color: white; background-color: orange; border-color: unset;" >닉네임중복</button>
				    </div>
				    <div class="col-sm-3">
				        <span id="userNicknameCheck" class="fs-5 check-custom"></span>
				    </div>                                   
                </div>

                <div class="row mb-3">
                    <label for="phoneNum" class="col-sm-2 col-form-label">전화번호</label>
                    <div class="col-auto">
                        <form:input type="text" class="form-control" id="phoneNum" path="phoneNum" placeholder="'-' 을 넣어주세요."/>
                        <form:errors path="phoneNum" cssClass="error"></form:errors>
                        <span id="phonecheck" class="error fs-5"></span>
                    </div>                 
                </div>

                <hr>
                <div class="row mb-3">
                    <div class="col-auto">
                        <label for="sample4_postcode" class="visually-hidden">post</label>
                        <input type="text" name="post" class="form-control" id="sample4_postcode" placeholder="우편번호">
                    </div>
                    <div class="col-auto">
                        <button type="button" class="btn btn-primary mb-3" onclick="sample4_execDaumPostcode()" style="color: white; background-color: orange; border-color: unset;">우편번호 찾기</button>
                    </div>
                </div>

                <div class="col-sm-5">
                    <label for="sample4_roadAddress" class="visually-hidden">도로명주소</label>
                    <input type="text" name="userAddress1" class="form-control" id="userAddress1" placeholder="도로명주소">
                </div>
                <div class="col-sm-5">
                    <label for="sample4_jibunAddress" class="visually-hidden">지번주소</label>
                    <input type="text" name="addr2" class="form-control" id="sample4_jibunAddress" placeholder="지번주소">
                    <span id="guide" style="color:#999"></span>
                </div>

                <div>
                    <label for="userAddress2" class="col-sm-2 col-form-label">상세주소</label>
                    <div class="col-auto">
                        <input type="text" name="userAddress2" class="form-control" id="userAddress2" placeholder="상세주소를 입력해주세요.">
                    </div>
                </div>
                <hr>

                <div>
                    <button class="btn btn-success m-5 " style="color: white; background-color: orange; border-color: unset;">회원가입</button>
                </div>
                
            </form:form>
        </div>
    </div>
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
                document.getElementById('userAddress1').value = fullRoadAddr;
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
