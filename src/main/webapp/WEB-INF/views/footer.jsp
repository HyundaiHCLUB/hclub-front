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
    <div class="navbar_bottom_menu">
        <a href="/main">
            <div class="nav-item">
                <i class="fa-solid fa-house fa-4x"></i>
                <span>홈</span>
            </div>
        </a>
        <div class="nav-item">
            <i class="fa-solid fa-bag-shopping fa-4x"></i>
            <span><a href="/comp">경쟁</a></span>
        </div>

        <div class="nav-item">
            <i class="fa-solid fa-compass fa-4x"></i>
            <span><a href="/club">동아리</a></span>
        </div>


        <div class="nav-item">
            <i class="fa-solid fa-gift fa-4x"></i>
            <span>이벤트</span>
        </div>
        <div class="nav-item">
            <i class="fa-solid fa-user fa-4x"></i>
            <span>마이페이지</span>
        </div>
    </div>
</nav>
</body>
</html>