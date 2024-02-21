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
<nav class="navbar">
    <div class="navbar_logo">
        <a href="/"><img src="/resources/image/logo.png"></a>
    </div>
    <div class="navbar_icons">
        <li><i class="fa-solid fa-magnifying-glass fa-3x"></i></li>
        <li><i class="fa-regular fa-heart fa-3x"></i></li>
        <li><i class="fa-regular fa-bell fa-3x"></i></li>
    </div>
</nav>
</body>
<script>
	let accessTokenInfo ="";
</script>
</html>
