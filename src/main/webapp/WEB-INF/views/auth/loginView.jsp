<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="/resources/css/main.css">
<style>
 	.form-label {
     	font-family: 'Arial', sans-serif;
        color: #333;
        margin-left: 20px;
        margin-bottom: 10px; 
        text-algin:center;
     }

     .form-label label {
         display: block;
         margin: 5px;
         font-size: 14px; 
         font-weight: bold;
         color: black;
     }

     .form-label input[type="text"], .form-label input[type="password"] {
	     font-size: 30px; 
     	 padding: 30px 30px; 
         border: 1px solid #ccc; 
       	 border-radius: 10px;
         width: 90%; 
         box-sizing: border-box;
         margin-bottom: 30px; 
         height:90px;
         background-color:#F6F6F6;
      }

      .form-label input[type="text"]::placeholder {
         color: #aaa; 
      }
      #loginFrm{
        margin:200px 0px 50px 20px;
      }
      .btn-class{
         font-size: 30px; 
     	 padding: 30px 30px;
         border: 1px solid #ccc; 
       	 border-radius: 35px; 
         width: 90%; 
         box-sizing: border-box; 
         height:100px;
         margin : 30px 0px 30px 0px;
         background-color: #46675C;
         font-weight:bold;
         color:white;
      }
      .btnDiv{
     	 text-align:center;
     	 margin: 100px 0px 50px 0px
      }
      #mainLogoDiv{
    	 display:flex; justify-content:center;
      }
      #logo{
	      width: 50%;
	      margin: 150px 0px 0px 0px;
      }
</style>
</head>
<body>
<main>
	<div id="mainLogoDiv">
		<img id="logo" src="/resources/image/logo.png">
	</div>
	<div id="loginDiv">
		<form id="loginFrm">
		  <div class="form-label">
		     <input type="text" id="userId" name="userId" placeholder="아이디"> <br/>
		     <input type="text" id="userPw" name="userPw" placeholder="비밀번호"> <br/>
		  </div>
		  <div class="btnDiv">
		  	<input id="loginButton" class="btn-class" type="button" value="로그인"/>
		    <input class="btn-class" type="button" value="회원가입"/>
		  </div>
		</form>
	</div>
</main>
</body>
<script>
$(document).ready(function() {
    $('#loginButton').click(function() {
        var username = $('#userId').val();
        var password = $('#userPw').val();

        $.ajax({
            type: 'POST',
            url: 'https://www.h-club.site/auth/login',
            contentType: 'application/json',
            data: JSON.stringify({ username: username, password: password }),
            success: function(response) { 
                 accessTokenInfo = response.accessToken;
                 getUserInfo2(accessTokenInfo);
            },
            error: function(xhr, status, error) {
                console.error('로그인 실패:', error);
                // 여기에 로그인 실패 시의 처리를 추가할 수 있습니다.
            }
        });
    });
});

function getUserInfo2(accessToken) { // refreshToken이 아닌 accessToken으로 변경
    $.ajax({
        type: 'POST',
        url: 'https://www.h-club.site/auth/test',
        headers: {
            'Authorization': 'Bearer ' + accessToken // accessToken 사용
        },
        success: function(memberInfo) {
            console.log('사용자 정보:', memberInfo);
        },
        error: function(xhr, status, error) {
            console.error('사용자 정보 가져오기 실패:', error);
        }
    });
}
</script>
</html>