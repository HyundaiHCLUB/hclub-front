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
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
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
        $(document).ready(function() {
            accessToken = localStorage.getItem("accessTokenInfo");
            console.log(accessToken)
            var categoryId = getCategoryId(sessionStorage.getItem('selectedCategory'));
            var clubLoc = sessionStorage.getItem('clubLoc');
            var clubAddress = sessionStorage.getItem('clubAddress');
            var clubTitle = sessionStorage.getItem('clubTitle');
            var clubInfo = sessionStorage.getItem('clubInfo');
            var clubFile = localStorage.getItem('clubFile');
            var clubFileName = localStorage.getItem('clubFileName'); // 파일 이름 가져오기

            console.log(categoryId);
            console.log(clubTitle);
            console.log(clubInfo);
            console.log(clubFile);
            console.log(clubFileName);

            document.querySelector('.club-title').innerText = clubTitle;
            document.querySelector('.content_button').innerText = sessionStorage.getItem('selectedCategory');
            document.querySelector('.club-content').innerText = clubInfo;

            var clubImage = document.querySelector('.club-image');
            if (clubFile) {
                clubImage.src = clubFile;
            } else {
                clubImage.src = "/resources/image/default-image.jpg";
            }

            var clubRequest = {
                clubName: clubTitle,
                clubImage: 'aa',
                clubInfo: clubInfo,
                clubLoc: clubLoc,
                categoryId: categoryId,
                creatorYn: 'Y',
                clubAddress: clubAddress
            }

            var formData = new FormData();
            formData.append("clubRequest", new Blob([JSON.stringify(clubRequest)], {type: "application/json"}));
            var fileBlob = dataURLtoFile(clubFile, clubFileName);
            formData.append('image', fileBlob, clubFileName);

            $('.next_button').on('click', function () {
                $.ajax({
                    url: 'https://www.h-club.site/clubs',
                    type: 'POST',
                    headers: {
                        'accessTokenInfo': accessToken,
                    },
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        console.log('통신 성공', response);
                    },
                    error: function (error) {
                        console.error('통신 실패', error);
                    }
                });
            });
        });

        function dataURLtoFile(dataURL, fileName) {
            var arr = dataURL.split(','), mime = arr[0].match(/:(.*?);/)[1],
                bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
            while (n--) {
                u8arr[n] = bstr.charCodeAt(n);
            }
            return new File([u8arr], fileName, { type: mime });
        }
    </script>

    </script>

    <script>
        function getCategoryId(categoryName) {
            switch (categoryName) {
                case '요리':
                    return 1;
                case '재테크':
                    return 2;
                case '액티비티':
                    return 3;
                case '게임':
                    return 4;
                case '문화·예술':
                    return 5;
                case '외국어':
                    return 6;
                case '여행':
                    return 7;
                case '자기계발':
                    return 8;
            }
        }
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
            <p class="club-title"></p>
            <a href="#" class="content_button"></a>
        </div>
        <p class="club-preview">상세 내용</p>
        <p class="club-content"></p>
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