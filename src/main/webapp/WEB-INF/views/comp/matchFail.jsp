<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link rel="stylesheet" href="${path}/resources/css/main.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
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
            margin-top: 40px;
            padding: 15px 30px;
            background-color: #ff4500;
            color: white;
            border: none;
            border-radius: 15px;
            cursor: pointer;
            font-size: 3em;
        }
    </style>
    <script>
        function compHome() {
            window.location.href = '/competition';
        }
    </script>
</head>
<body>
<main>
    <div class="wrapper">
        <img src="/resources/image/comp/lose_heendy.png">
        <p>저런... 매칭에 실패하셨군요!</p>
        <p>다음에 다시 시도해 보세요</p>
        <input type="button" class="btn-payment" onclick="compHome()" value="돌아가기">
    </div>
</main>

</body>
</html>
