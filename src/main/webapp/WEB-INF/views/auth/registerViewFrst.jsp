<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지 1</title>
<link rel="stylesheet" href="/resources/css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<style>
	#headr{
		margin: 100px 0px 50px 0px;
	}
	#title{
		text-align: center;
		font-size: 50px;
	}
	.form-label {
     	font-family: 'Arial', sans-serif;
        color: #333;
        margin-left: 20px;
        margin-bottom: 10px; 
        text-algin:center;
     }

     .form-label label {
         display: block;
         margin: 0px 0px 20px 20px;
         font-size: 30px; 
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
         background-color: ghostwhite;
      }

      .form-label input[type="text"]::placeholder {
         color: #aaa; 
      }
      #registerFrm{
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
</style>
<body>
<main>
<div id="header">

<h1 id="title">회원가입</h1>
</div>
	<div id="registerDiv">
		<form id="registerFrm">
		  <div class="form-label">
		     <label for="id">아이디</label>
		     <input type="text" id="id" name="id" placeholder="아이디"> <br/>
		     <label for="name">이름</label>
		     <input type="text" id="name" name="name" placeholder="이름"> <br/>
		     <label for="employeeNo">사번</label>
		     <input type="text" id="employeeNo" name="employeeNo" placeholder="사번"> <br/>
		     <label for="password">비밀번호</label>
		     <input type="password" id="password" name="password" placeholder="비밀번호"> <br/>
		     <label for="passwordConfirm">비밀번호 확인</label>
		     <input type="password" id="passwordConfirm" name="passwordConfirm" placeholder="비밀번호 확인"> <br/>
		  </div>
		  <div class="btnDiv">
		    <input id="confirmEmpYnBtn" class="btn-class" type="button" value="사원여부 조회"/>
		  	<input id="nextBtn" class="btn-class" type="button" value="다음"/>
		  </div>
		</form>
	</div>
</main>
</body>
</html>