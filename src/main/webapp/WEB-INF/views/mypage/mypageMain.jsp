<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link rel="stylesheet" href="${path}/resources/css/main.css">
    <link rel="stylesheet" href="${path}/resources/css/mypage.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>마이페이지</title>
    <style>
        #wrapper {
            display: flex;
            flex-direction: column;
        }
        body {
            font-family: 'Arial', sans-serif;
            font-size: 1.5em;
            margin: 0;
            padding: 0;
            background-color: #ffffff
        }
        span:active {
            color: #4CAF50;
        }

        .profile-header {
            width: 80%;
            height: 400px;
            margin: 10px auto 50px;
            display: flex;
            align-items: center;
            /*border: 2px solid #E2FFD4;*/
            /*background-color: #E2FFD4;*/
            border-radius: 5%;
            padding-left: 30px;
            font-size: 36px;
        }

        .profile-pic {
            width: 250px;
            height: 250px;
            border-radius: 50%;
            margin: auto 30px;
        }

        .mypage-menus {
            margin-top: 30px;
            padding-bottom: 30px;
            width: 100%;
        }
        .menu {
            display: flex;
            align-items: center;
            width: 70%;
            height: 120px;
            padding: 20px;
            padding-left: 50px;
            background-color: #E2FFD4;
            border-radius: 30px;
            margin: 40px auto;
            font-size: 2em;
        }
        .menu span {
            margin-top: auto;
            margin-bottom: auto;
            margin-left: 50px;
            font-weight: bold;
        }
        .fas fa-user-circle icon {
            margin : auto 10px auto 30px;
        }



    </style>
</head>
<body>
<main>
<div id="wrapper">
            <div class="mypage-top-menu">
                <img src="/resources/image/left-arrow.png"
                onclick="window.history.back()"/>
            </div>
            <div class="profile-header">
                <img src="/resources/image/sample.png" alt="프로필 이미지" class="profile-pic">
                <div class="user-info">
                    <h3>김은채</h3>
                    <p>IT 인프라 사업부 (선임)</p>
                </div>
            </div>
            <div class="mypage-menus">
                <div class="menu" onclick="location.href='/mypage/updateProfileView'">
                    <i class="fa-solid fa-user"></i>
                    <span>프로필 수정</span>
                </div>
                <div class="menu">
                    <i class="fa-regular fa-flag"></i>
                    <span><a>내가 개설한 동아리</a></span>
                </div>
                <div class="menu">
                    <i class="fa-solid fa-heart"></i>
                    <span><a>즐겨찾기</a></span>
                </div>
                <div class="menu" onclick="location.href='/mypage/myMatchHistoryView'">
                    <i class="fa-solid fa-trophy"></i>
                    <span>매치 히스토리</span>
                </div>
            </div>
        </div>
</main>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery CDN -->
<script src="https://kit.fontawesome.com/5ba1c6c3a8.js" crossorigin="anonymous"></script> <!-- font awesome icons-->
<script>

</script>
</html>