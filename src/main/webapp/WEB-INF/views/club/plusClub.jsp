<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/club.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>동아리 개설</title>
    <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script>
        var headerHeight = document.querySelector('header').offsetHeight;
        var footerHeight = document.querySelector('footer').offsetHeight;

        window.addEventListener('scroll', function() {
            var scrollY = window.scrollY || document.documentElement.scrollTop;

            if (scrollY > headerHeight) {
                document.body.style.paddingTop = headerHeight + 'px';
                document.querySelector('header').classList.add('fixed');
            } else {
                document.body.style.paddingTop = 0;
                document.querySelector('header').classList.remove('fixed');
            }

            var scrollBottom = window.innerHeight + scrollY;
            var documentHeight = document.documentElement.offsetHeight;
            if (documentHeight - scrollBottom < footerHeight) {
                document.body.style.paddingBottom = footerHeight + 'px';
                document.querySelector('footer').classList.add('fixed-bottom');
            } else {
                document.body.style.paddingBottom = 0;
                document.querySelector('footer').classList.remove('fixed-bottom');
            }
        });
    </script>
    <script>
        $(document).ready(function () {
            $("#total").click(function () {
                $("#hiddenList").slideToggle();
            });
        });
    </script>
</head>

<body>
<main class="main-container">
    <p class="plus-title">어떤 종류의 모임인가요?</p>
    <div class="category-container">
        <svg width="140" height="140" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M29.8818 9.2258L21.0803 0.455149C20.793 0.165458 20.4024 0.00174518 19.9944 1.38718e-05C19.5864 -0.00171744 19.1944 0.158674 18.9046 0.445917L18.8954 0.455149L10.1247 9.2258H1.53871C1.13062 9.2258 0.739242 9.38791 0.450678 9.67647C0.162114 9.96504 0 10.3564 0 10.7645V38.4613C0 38.8694 0.162114 39.2608 0.450678 39.5493C0.739242 39.8379 1.13062 40 1.53871 40H38.4678C38.8758 40 39.2672 39.8379 39.5558 39.5493C39.8444 39.2608 40.0065 38.8694 40.0065 38.4613V10.7645C40.0065 10.3564 39.8444 9.96504 39.5558 9.67647C39.2672 9.38791 38.8758 9.2258 38.4678 9.2258H29.8818ZM20.0032 3.71721L25.5118 9.2258H14.4946L20.0032 3.71721ZM36.929 36.9226H3.07742V12.3032H36.929V36.9226ZM12.3097 21.5355C11.4935 21.5355 10.7107 21.2112 10.1336 20.6341C9.55649 20.057 9.23226 19.2742 9.23226 18.4581C9.23226 17.6419 9.55649 16.8591 10.1336 16.282C10.7107 15.7049 11.4935 15.3806 12.3097 15.3806C13.1259 15.3806 13.9086 15.7049 14.4857 16.282C15.0629 16.8591 15.3871 17.6419 15.3871 18.4581C15.3871 19.2742 15.0629 20.057 14.4857 20.6341C13.9086 21.2112 13.1259 21.5355 12.3097 21.5355ZM33.8516 33.8452H10.771L15.3871 24.6129L19.2339 32.3064L26.1581 18.4581L33.8516 33.8452Z" fill="#585C5D"/>
        </svg>
        <div class="category_content">
            <p class="category_name">문화·예술</p>
            <p>전시·영화·뮤지컬·공연·박물관·연극 등</p>
        </div>
    </div>
</main>
</body>
</html>