<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/mypage.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>즐겨찾기</title>
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
        document.addEventListener('DOMContentLoaded', function() {
            const subTitle = document.getElementById('sub-title');
            const name = localStorage.getItem('name');
            subTitle.innerHTML = name+`님의 즐겨찾기 <i class="fa-solid fa-heart" style="color: #EF7353;"></i>`;

            // 페이지 로딩 시 문화예술 카테고리 선택
            var defaultCategory = "문화·예술";
            $('.category:contains(' + defaultCategory + ')').click();
        });

        $(document).ready(function () {
            $('.grid-container').on('click', '.category', function () {
                // 기존 선택된 카테고리 스타일 제거
                $('.category').removeClass('selected');

                accessToken = localStorage.getItem("accessTokenInfo");
                var categoryName = $(this).find('span').text();
                console.log(categoryName);

                $(this).addClass('selected');

                $.ajax({
                    type: 'GET',
                    url: 'https://www.h-club.site/clubs/like/category',
                   //url: 'http://localhost:8081/clubs/like/category',
                    data: { categoryName: categoryName },
                    headers: {
                        'accessTokenInfo': accessToken,
                    },
                    success: function (response) {
                        if (response.success) {
                            var data = response.data;
                            $(".likeList").empty();
                            data.forEach(function (item) {
                                var clubHTML =
                                    '<div class="grid-container-like">' +
                                    '<div class="grid-hot-item">' +
                                    '<a href="/club/detail/' + item.clubNo + '">' +
                                    '<img class="circle_recommend" src="' + item.clubImage + '">' +
                                    '</div>' +
                                    '<div class="grid-hot-item">' +
                                    '<div class="circle_hot_content">' +
                                    '<p class="circle_name">' + item.clubName + '</p>' +
                                    '<a href="#" class="category_button">'+item.categoryName+'</a>'+
                                    '</div>' +
                                    '<p class="circle_hot_loc">'+ item.clubLoc +'</p>' +
                                    '<i class="fa-solid fa-users fa-1x" style="margin-top: 8px">10</i>' +
                                    '</a>' +
                                    '</div></div>'
                                ;
                                $(".likeList").append(clubHTML);
                            });
                        } else {
                            console.error("Error:", response.message);
                        }
                    },
                });
            });
        });
    </script>

    <style>
        .grid-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 4px;
            margin-left: 50px;
        }

        .category {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 4px;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
            width: 70%;
            transition: background-color 0.3s, border-width 0.3s;

        }

        .category i {
            font-size: 28px;
            margin-bottom: 10px;
        }

        .category span {
            font-size: 24px;
        }

        .category:hover {
            background-color: #F1F5E8;
        }
    </style>
</head>

<body>
<main class="main-container">
    <div class="grid-container">
        <div class="category">
            <i class="fas fa-paint-brush"></i>
            <span>문화·예술</span>
        </div>
        <div class="category">
            <i class="fas fa-bicycle"></i>
            <span>액티비티</span>
        </div>
        <div class="category">
            <i class="fas fa-utensils"></i>
            <span>요리</span>
        </div>
        <div class="category">
            <i class="fas fa-plane"></i>
            <span>여행</span>
        </div>
        <div class="category">
            <i class="fas fa-gamepad"></i>
            <span>게임</span>
        </div>
        <div class="category">
            <i class="fas fa-book"></i>
            <span>자기계발</span>
        </div>
        <div class="category">
            <i class="fas fa-language"></i>
            <span>외국어</span>
        </div>
        <div class="category">
            <i class="fas fa-chart-line"></i>
            <span>재테크</span>
        </div>
    </div>

    <div class="title">
        <div class="title-item">
            <p class="sub-title" id="sub-title"></p>
        </div>
    </div>

    <div class="likeList"></div>
</main>
</body>
</html>