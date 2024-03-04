<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Elegant Dashboard | Dashboard</title>
  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/svg/logo.svg" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.min.css">
</head>
<script src="${pageContext.request.contextPath}/resources/plugins/chart.min.js"></script>
<!-- Icons library -->
<script src="${pageContext.request.contextPath}/resources/plugins/feather.min.js"></script>
<!-- Custom scripts -->
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>


<script>


</script>
  <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        #loginDiv {
            border: 1px solid #ccc;
            width: 400px; /* 수정된 부분 */
            padding: 30px; /* 수정된 부분 */
            margin: 200px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .inputBas {
            margin: 10px;
            padding: 15px; /* 수정된 부분 */
            width: calc(100% - 20px);
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }
        .inputBas:focus {
            border-color: dodgerblue;
        }
        .inputBas::placeholder {
            color: #aaa;
        }
        .submitBtn {
            width: 100%;
            background-color: #46675c;
            color: #fff;
            border: none;
            padding: 15px; /* 수정된 부분 */
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .submitBtn:hover {
            background-color: #007bb5;
        }
    </style>
<body>
  <div class="layer"></div>
<!-- ! Body -->
<a class="skip-link sr-only" href="#skip-target">Skip to content</a>
<div class="page-flex">
  <!-- ! Sidebar -->
<%@ include file="../adminView/adminSideBar.jsp" %>
<!-- MainContents -->
 <div class="main-wrapper">
   <!-- ! Main nav -->
   <nav class="main-nav--bg">
   <div class="container main-nav">
	   <div class="main-nav-start">
	  
	   </div>  
	</div>
   </nav>
   <div class="container">
    <div class="row">
    	<div class="col-lg-9">  
          <div class="users-table table-wrapper">
	          <div id="loginDiv">
			  	<form id="loginFrm">
			        <div>
			             <input type="text" name="id" id="userId" class="inputBas" placeholder="아이디를 입력하세요">
			        </div>
			        <div>
			         	<input type="password" name="pass" id="userPw" class="inputBas" placeholder="비밀번호를 입력하세요">
			        </div>
			        <div>
			        	<input type="button" class="submitBtn" value="로그인" onclick="adminLogin()">
			         </div>
			       </form>
			    </div>
            </div>
    	</div>
    </div>
     
    <%@ include file="/WEB-INF/views/common/modal.jsp" %> 
  </div>
 <script>
 $(document).ready(function() {
 
 });
 
function adminLogin() { 
    if(!validateForm())
   	 return false;

    var username = $('#userId').val();
    var password = $('#userPw').val();

   $.ajax({
       type: 'POST',
	   url: 'https://www.h-club.site/auth/login',
	   //url: '/test/auth/login',
       contentType: 'application/json',
       data: JSON.stringify({ username: username, password: password }),
       success: function(response) { 
    	    sessionStorage.setItem("accessAdminTokenInfo", response.accessToken);
            //getUserInfo2(response.accessToken);
            pageLocFlag = true;
            //$("#sidebarLocation").show();
            if(pageLocFlag){
           	    //로그인 완료시 관리자 메인페이지로 이동
            	location.href='/dashboard/clubAdminPage' ;
            }
            
       },
       error: function(xhr, status, error) {
        	setModalMsg("관리자 로그인에 실패했습니다. 아이디 혹은 비밀번호를 확인해주세요.");
            getModalMesage(); 
       }
   });
}
function validateForm() {
    var username = $('#userId').val();
    var password = $('#userPw').val();

    if (username.trim() === '') {
    	setModalMsg("아이디를 입력해주세요");
        getModalMesage();
        $('#userId').focus();
        return false;
    }

    if (password.trim() === '') {
    	setModalMsg("비밀번호를 입력해주세요");
        getModalMesage(); 
        $('#userPw').focus();
        return false;
    }

    return true;
}
 </script>
</body>
</html>