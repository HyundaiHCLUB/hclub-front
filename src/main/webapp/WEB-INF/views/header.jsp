<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
        .navbar_icons{
            display: flex;
            list-style: none;
        }
        .navbar_icons li{
            padding: 8px 12px;
        }

        .navbar_bottom_menu {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: space-around;
            align-items: center;
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

        }
    </style>
<%--    <link rel="stylesheet" href="/resources/css/nav.css?after">--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
<nav class="navbar">
    <div class="navbar_logo">
        <a href="home/home"><img src="/resources/image/logo.png"></a>
    </div>
    <div class="navbar_icons">
        <li><i class="fa-solid fa-magnifying-glass fa-2x"></i></li>
        <li><i class="fa-regular fa-heart fa-2x"></i></li>
        <li><i class="fa-regular fa-bell fa-2x"></i></li>
    </div>
</nav>
<div class="navbar_menu">
    <span class="navbar_menu_font">
        <li><a href="home/home.jsp"> 투데이</a></li>
        <li><a href="">인기 동아리</a></li>
    <li><a href=""><h1>신규 동아리</h1></a></li>
    <li><a href=""><h1>오늘의 랭킹</h1></a></li>
    <li><a href=""><h1>내 모임</h1></a></li>
    </span>
</div>
</body>
</html>
