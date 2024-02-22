<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link rel="stylesheet" href="${path}/resources/css/main.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
    <style>
        .wrapper{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            height: 100vh;
        }
        .wrapper img{
            max-width: 100%;
            margin-bottom: 30px;
        }
        .wrapper p {
            font-size: 2.5em;
            font-weight: bold;
        }
        .btn-payment {
            margin-top: 40px; /* 버튼 위의 여백을 추가합니다. */
            padding: 15px 30px; /* 버튼의 내부 여백을 조정합니다. */
            background-color: #ff4500; /* 버튼의 배경색을 조정합니다. */
            color: white; /* 버튼의 텍스트 색상을 조정합니다. */
            border: none; /* 테두리를 제거합니다. */
            border-radius: 15px; /* 모서리를 둥글게 합니다. */
            cursor: pointer; /* 마우스를 올렸을 때 커서를 포인터로 변경합니다. */
            font-size: 3em; /* 폰트 크기를 조정합니다. */
        }
    </style>
</head>
<body>
<main>
    <div class="wrapper">
        <img src="/resources/image/comp/lose_team_result.png">
        <p>저런... 경기에서 지셨군요?</p>
        <p>다음 번엔 이기실 수 있을거에요! </p>
        <button class="btn-payment">결제하기</button>
    </div>
</main>
</body>
</html>