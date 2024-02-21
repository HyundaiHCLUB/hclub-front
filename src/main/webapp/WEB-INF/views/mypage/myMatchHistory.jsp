<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>H-Club</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="${path}/resources/css/mypage.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/5ba1c6c3a8.js" crossorigin="anonymous"></script> <!-- font awesome icons-->
    <style>
    </style>
</head>
<body>
<main>
    <div class="mypage-top-menu">
        <img src="/resources/image/left-arrow.png"
             onclick="window.history.back()"/>
    </div>
    <div class="mypage-header">
        <i class="fa-solid fa-trophy"></i>
        <h1>매치 히스토리</h1>
        <i class="fa-solid fa-trophy"></i>
    </div>
    <div class="matches">

        <% for (int i = 0; i < 20; i++ ) {%>
        <div class="rounded-shape">
            <div class="left-section">
                <img src="/resources/image/comp/soccer.png" alt="이미지" />
                <p>3 ON 3</p>
            </div>
            <div class="middle-section">
                <p>블루 드래곤즈</p>
            </div>
            <div class="right-section">
                <p>서울시 강남구 코트</p>
                <p>2024/03/04 16:03</p>
            </div>
        </div>
        <%} %>
    </div>

</main>
</body>
</html>
