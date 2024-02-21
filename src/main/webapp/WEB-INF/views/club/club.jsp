<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/club.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>동아리</title>
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

    <style>
        .main-container {
            min-height: 100px;
        }

        .category {
            display: flex;
            justify-content: space-around;
            align-items: center;
            width: 100%;
        }

        .category-item {
            margin: 5px;
            justify-content: space-around;
            text-align: center;
        }
    </style>
    <script>
            function getClubList(categoryId) {
                $.ajax({
                    url: "https://www.h-club.site/club/"+categoryId,
                    method: "GET",
                    success: function (response) {
                        if (response.success) {
                            var data = response.data;
                            $(".matches").empty();
                            for (var i = 0; i < data.length; i += 2) {
                                var group = data.slice(i, i + 2);

                                var matchHTML = '<div class="grid-container">';
                                group.forEach(function (item) {
                                    matchHTML += '<div class="grid-item">' +
                                        '<img class="circle_recommend" src="'+item.clubImage+'">' +
                                        '<div class="circle_content">' +
                                        '<p>' + item.clubNo + '</p>' +
                                        '<p class="circle_name">' + item.clubName + '</p>' +
                                        '<p>동아리 지역: ' + item.clubLoc + '</p>' +
                                        '<a href="#" className="category_button">'+item.categoryId+'</a>' +
                                    '</div></div>';
                                });
                                matchHTML += '</div>';
                                $(".matches").append(matchHTML);
                            }
                        } else {
                            console.error("Error:", response.message);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("Error fetching data:", error);
                    }
                });
            }
    </script>
</head>

<body>
    <main class="main-container">
        <div class="category">
            <img id="total" src="/resources/image/category_total.png">
            <div class="category-item" onclick="getClubList(1)">
                <img src="/resources/image/category_cooking.png">
            </div>
            <div class="category-item" onclick="getClubList(3)">
                <img src="/resources/image/category_activity.png">
            </div>
            <div class="category-item" onclick="getClubList(7)">
                <img src="/resources/image/category_travel.png">
            </div>
            <div class="category-item" onclick="getClubList(8)">
                <img src="/resources/image/category_self.png">
            </div>
        </div>
        <ul id="hiddenList" class="totalList" style="display: none;">
                <div class="category">
                    <div class="category-item" onclick="getClubList(6)">
                        <img src="/resources/image/category_foreign.png">
                    </div>
                    <div class="category-item" onclick="getClubList(4)">
                        <img src="/resources/image/category_game.png">
                    </div>
                    <div class="category-item" onclick="getClubList(5)">
                        <img src="/resources/image/category_culture.png">
                    </div>
                    <div class="category-item" onclick="getClubList(2)">
                        <img src="/resources/image/category_money.png">
                    </div>
                </div>
            </ul>

        <div class="more-clubs">
            <p class="more-club">기본순</p>
            <img class="more-arrow" src="/resources/image/bottom-arrow.png">
        </div>

        <div class="matches">
        </div>
        <div class="grid-container">
            <div class="grid-item">
                <img class="circle_recommend" src="/resources/image/sample.png" alt="Example Image">
                <div class="circle_content">
                    <p class="circle_name">난쏘공</p>
                    <a href="#" class="category_button">액티비티</a>
                    <a href="#" class="content_button">추천</a>
                </div>
            </div>
            <div class="grid-item">
                <img class="circle_recommend" src="/resources/image/sample.png" alt="Example Image">
                <div class="circle_content">
                    <p class="circle_name">난쏘공</p>
                    <a href="#" class="category_button">액티비티</a>
                    <a href="#" class="content_button">추천</a>
                </div>
            </div>
        </div>
        <div class="grid-container">
            <div class="grid-item">
                <img class="circle_recommend" src="/resources/image/sample.png" alt="Example Image">
                <div class="circle_content">
                    <p class="circle_name">난쏘공</p>
                    <a href="#" class="category_button">액티비티</a>
                    <a href="#" class="content_button">추천</a>
                </div>
            </div>
            <div class="grid-item">
                <img class="circle_recommend" src="/resources/image/sample.png" alt="Example Image">
                <div class="circle_content">
                    <p class="circle_name">난쏘공</p>
                    <a href="#" class="category_button">액티비티</a>
                    <a href="#" class="content_button">추천</a>
                </div>
            </div>
        </div>
        <div class="grid-container">
            <div class="grid-item">
                <img class="circle_recommend" src="/resources/image/sample.png" alt="Example Image">
                <div class="circle_content">
                    <p class="circle_name">난쏘공</p>
                    <a href="#" class="category_button">액티비티</a>
                    <a href="#" class="content_button">추천</a>
                </div>
            </div>
            <div class="grid-item">
                <img class="circle_recommend" src="/resources/image/sample.png" alt="Example Image">
                <div class="circle_content">
                    <p class="circle_name">난쏘공</p>
                    <a href="#" class="category_button">액티비티</a>
                    <a href="#" class="content_button">추천</a>
                </div>
            </div>
        </div>
        <div class="grid-container">
            <div class="grid-item">
                <img class="circle_recommend" src="/resources/image/sample.png" alt="Example Image">
                <div class="circle_content">
                    <p class="circle_name">난쏘공</p>
                    <a href="#" class="category_button">액티비티</a>
                    <a href="#" class="content_button">추천</a>
                </div>
            </div>
            <div class="grid-item">
                <img class="circle_recommend" src="/resources/image/sample.png" alt="Example Image">
                <div class="circle_content">
                    <p class="circle_name">난쏘공</p>
                    <a href="#" class="category_button">액티비티</a>
                    <a href="#" class="content_button">추천</a>
                </div>
            </div>
        </div>

        <div class="plus-club">
            <a href="club/add">
               <svg width="160" height="160" viewBox="0 0 42 42" fill="none" xmlns="http://www.w3.org/2000/svg">
                 <circle cx="21" cy="21" r="20.25" fill="#46675C"/>
                 <path d="M21 12L21 30" stroke="white" stroke-width="1.2" stroke-linecap="round"/>
                 <path d="M30 21L12 21" stroke="white" stroke-width="1.2" stroke-linecap="round"/>
             </svg>
            </a>
        </div>
    </main>
</body>

</html>