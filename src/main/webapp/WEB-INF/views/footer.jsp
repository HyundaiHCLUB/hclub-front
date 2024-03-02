<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/nav.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
    <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
<nav class="navbar_bottom">
    <div class="navbar_bottom_menu" style="height:100px;">
        <a href="/">
            <div class="nav-item">
                <i class="fa-solid fa-house fa-4x"></i>
                <span>홈</span>
            </div>
        </a>
        <a href="/competition">
            <div class="nav-item">
                <i class="fa-solid fa-bag-shopping fa-4x"></i>
                <span>경쟁</span>
            </div>
        </a>
        <a href="/club">
            <div class="nav-item">
                <i class="fa-solid fa-compass fa-4x"></i>
                <span>동아리</span>
            </div>
        </a>
        <a href="/mypage/myFavorites">
            <div class="nav-item">
                <i class="fa fa-heart fa-4x"></i>
                <span>즐겨찾기</span>
            </div>
        </a>

        <div class="nav-item" onclick="checkLoginAndRedirect()">
            <i class="fa-solid fa-user fa-4x"></i>
            <span>마이페이지</span>
        </div>

    </div>

</nav>
</body>
<script>

    function checkLoginAndRedirect() {
        const accessTokenInfo = localStorage.getItem('accessTokenInfo');
        const isLoggedIn = accessTokenInfo !== null; // 토큰이 있으면 true, 없으면 false
        if (isLoggedIn) {
            // 로그인이 되어 있으면 마이페이지로 이동
            window.location.href = '/mypage';
        } else {
            // 로그인이 되어 있지 않으면 경고 메시지 표시
            alert("로그인이 필요한 기능입니다");
            return;
        }
    }

</script>
</html>