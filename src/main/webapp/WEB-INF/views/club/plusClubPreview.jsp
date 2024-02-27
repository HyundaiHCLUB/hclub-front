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

</head>

<body>
<main class="main-container">
    <div style="display: flex">
        <img style="height: 50px;width: 50px;color: #46675c;margin-top: 65px;" onclick="history.back()" src="/resources/image/left-arrow.png">
        <p class="plus-title">미리보기</p>
    </div>
    <svg viewBox="0 0 205 3" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect width="100%" height="1" fill="#46675C"/>
    </svg>

    <img class="club-image" src="/resources/image/default-image.jpg">

    <div class="club-detail">
        <div class="circle_content">
            <p class="club-title">뚝섬유원지 러닝팟</p>
            <a href="#" class="content_button">액티비티</a>
        </div>
        <p class="club-preview">상세 내용</p>
        <p class="club-content">사람들이 뜁니다.
            잠시 멈춰 쓰레기를 줍더니, 또 뜁니다.
            가벼운 운동과 청소가 결합 된 환경정화 활동, 플로깅입니다.
            플로깅은 '이삭을 줍는다'는 스웨덴어와 영어의 '조깅'을 합친 말로, 2016년 스웨덴에서 시작돼 국내에서도 확산 중입니다.
            주말을 맞아 서울 송파구 주민들이 플로깅에 나섰습니다.
            요즘처럼 기온이 높을 땐 무리하게 뛰지 않고 천천히 걸으며 청소합니다.
            국내에서 플로깅은 '줍깅'이란 말로도 잘 알려져 있는데 쪼그려앉았다가 일어서는 동작이 하체 운동법인 스쾃과 비슷해 쓰레기를 많이 주울수록 운동 효과도 커지는 셈입니다.
        </p>
    </div>

    <a href="/club">
        <svg class="next_button" width="700" height="250" viewBox="0 0 350 50" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect width="350" height="50" rx="20" fill="#46675C"/>
            <path d="M166.548 23.8705H168.41V25.7325H166.548V23.8705ZM172.036 17.9625H173.898V26.7825H172.036V17.9625ZM173.24 21.6585H175.522V23.1845H173.24V21.6585ZM163.664 26.5305L163.454 25.0885C165.778 25.0885 168.844 25.0745 171.462 24.7525L171.602 26.0265C168.9 26.4885 165.932 26.5165 163.664 26.5305ZM165.106 27.3005H173.898V30.9125H172.036V28.7285H165.106V27.3005ZM163.79 18.9005H171.14V20.2305H163.79V18.9005ZM167.472 20.5385C169.376 20.5385 170.622 21.2805 170.622 22.4705C170.622 23.6605 169.376 24.4025 167.472 24.4025C165.554 24.4025 164.308 23.6605 164.308 22.4705C164.308 21.2805 165.554 20.5385 167.472 20.5385ZM167.472 21.7565C166.59 21.7565 166.072 21.9805 166.072 22.4705C166.072 22.9325 166.59 23.1845 167.472 23.1845C168.34 23.1845 168.858 22.9325 168.858 22.4705C168.858 21.9805 168.34 21.7565 167.472 21.7565ZM166.548 17.8505H168.41V19.5025H166.548V17.8505ZM185.391 17.9625H187.267V27.2725H185.391V17.9625ZM178.629 29.2045H187.589V30.6885H178.629V29.2045ZM178.629 26.3345H180.491V29.8065H178.629V26.3345ZM180.211 18.7745C182.199 18.7745 183.725 20.1465 183.725 22.0645C183.725 23.9685 182.199 25.3545 180.211 25.3545C178.223 25.3545 176.683 23.9685 176.683 22.0645C176.683 20.1465 178.223 18.7745 180.211 18.7745ZM180.211 20.3845C179.245 20.3845 178.503 21.0005 178.503 22.0645C178.503 23.1145 179.245 23.7305 180.211 23.7305C181.163 23.7305 181.905 23.1145 181.905 22.0645C181.905 21.0005 181.163 20.3845 180.211 20.3845Z" fill="white"/>
        </svg>
    </a>
</main>
</body>
</html>