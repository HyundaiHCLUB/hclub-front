<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <style>
        body {
            margin: 0;
            font-family: 'Inter';
        }

        a {
            font-weight: bold;
            text-decoration-line: none;
            color: black;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 8px 12px;
        }

        .navbar_menu {
            display: flex;
            justify-content: center;
            list-style: none;
            padding-left: 0;
            font-size: 32px;
            font-weight: bold;
            margin-top: 16px;
            margin-bottom: 16px;
        }

        .navbar_menu li {
            margin: 0 10px;
        }

        .navbar_menu li:hover {
            background-color: #6FC173;
            border-radius: 4px;
        }

        .navbar_menu_font {
            font-size: 10px;
            display: flex;
            align-items: center;
        }

        .navbar_icons {
            display: flex;
            list-style: none;
        }

        .navbar_icons li {
            padding: 8px 12px;
        }

        .navbar_bottom_menu {
            list-style: none;
            padding: 0;
            display: flex;
            justify-content: space-around;
            align-items: center;
            margin: 20px 0;
        }

        .nav-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .navbar_bottom_menu span {
            margin-top: 5px;
            font-size: 20px;
        }

        .navbar_bottom_menu i {
            color: #333;
        }

        @media (max-width: 768px) {
            .navbar_bottom {
                position: fixed;
                bottom: 0;
                width: 100%;
                background-color: #fff;
                height: 140px;
                z-index: 1000;
            }

            .navbar_bottom_menu {
                justify-content: space-around;
                padding: 8px;
                box-sizing: border-box;
            }

            .nav-item {
                text-align: center;
                margin: 20px 0;
            }

            .navbar_bottom_menu span {
                font-size: 14px;
                margin-top: 3px;
            }

            .navbar_bottom_menu i {
                font-size: 24px;
            }
        }
    </style>
    <%--    <link rel="stylesheet" href="/resources/css/nav.css">--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
    <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
<nav class="navbar_bottom">
    <div class="navbar_bottom_menu">
        <div class="nav-item">
            <i class="fa-solid fa-house fa-4x"></i>
            <span>홈</span>
        </div>
        <div class="nav-item">
            <i class="fa-solid fa-bag-shopping fa-4x"></i>
            <span><a href="/comp">경쟁</a></span>
        </div>
        <div class="nav-item">
            <i class="fa-solid fa-compass fa-4x"></i>
            <span>동아리</span>
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
