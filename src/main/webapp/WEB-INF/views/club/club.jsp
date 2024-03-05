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
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#total").click(function () {
                $("#hiddenList").slideToggle();
            });
        });

        var currentCategoryId;
        function setCategoryId(categoryId) {
            currentCategoryId = categoryId;
        }
        function getCurrentSelectedCategoryId() {
            return currentCategoryId;
        }

        $(document).ready(function () {
            categoryId = <%= request.getAttribute("categoryId") %>;
            getClubList(categoryId);
        });

            function getClubList(categoryId) {
                $.ajax({
                    url: "https://www.h-club.site/clubs/"+categoryId,
                    method: "GET",
                    success: function (response) {
                        if (response.success) {
                            var data = response.data;
                            $(".clubs").empty();
                            var clubList = document.getElementById("clubs");

                            for (var i = 0; i < data.length; i += 2) {
                                var group = data.slice(i, i + 2);

                                var clubHTML = '<div class="grid-container">';
                                group.forEach(function (item) {
                                    clubHTML += '<div class="grid-item"><div class="club-image-container">' +
                                        '<a href="/club/detail/' + item.clubNo + '"><img class="circle_recommend" src="' + item.clubImage + '"></a>' +
                                        '<span class="like-icon" data-club-id="' + item.clubNo + '"><i class="far fa-heart" style="color: #ffffff;"></i></span></div>' +
                                        '<div class="circle_content">' +
                                        '<p class="circle_name">' + item.clubName + '</p>' +
                                        '<a href="#" class="category_button">'+getCategoryName(item.categoryId)+'</a>' +
                                    '</div></div>';
                                });
                                clubHTML += '</div>';
                                $(".clubs").append(clubHTML);
                            }
                            updateLikedClubs();
                        } else {
                            console.error("Error:", response.message);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("Error fetching data:", error);
                    }
                });
            }

        function updateLikedClubs(){
            accessToken = localStorage.getItem("accessTokenInfo");

            $.ajax({
                //url: "http://localhost:8081/clubs/like/exist",
                url: "https://www.h-club.site/clubs/like/exist",
                method: "GET",
                headers: {
                    'accessTokenInfo': accessToken,
                },
                success: function (response) {
                    var likedClubs = response.data;
                    likedClubs.forEach(function (club) {
                        var clubNo = club.clubNo;
                        var isLiked = club.isLiked;

                        if (isLiked === 'Y') {
                            $('[data-club-id="' + clubNo + '"]').addClass('liked');
                            $('[data-club-id="' + clubNo + '"]').html('<i class="fa-solid fa-heart" style="color: #ff2e2e;"></i>');
                        } else {
                            $('[data-club-id="' + clubNo + '"]').addClass('unliked');
                            $('[data-club-id="' + clubNo + '"]').html('<i class="fa-regular fa-heart" style="color: #ffffff;"></i>');
                        }
                    });
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data:", error);
                }
            });
        }

        $(document).ready(function() {
            updateLikedClubs();
        });

        function toggleLikeButton(clubNo, isLiked) {
            var likeButton = $('[data-club-id="' + clubNo + '"]');

            if (isLiked === 'Y') {
                // 좋아요가 되어 있는 상태에서 클릭했을 때
                likeButton.removeClass('liked');
                likeButton.html('<i class="fa-regular fa-heart" style="color: #ffffff;"></i>');
            } else {
                // 좋아요가 되어 있지 않은 상태에서 클릭했을 때
                likeButton.addClass('liked');
                likeButton.html('<i class="fa-solid fa-heart" style="color: #ff2e2e;"></i>');
            }
        }

        function addLike(clubNo) {
            accessToken = localStorage.getItem("accessTokenInfo");

            $.ajax({
                //url: "http://localhost:8081/clubs/"+clubNo+"/like",
                url: "https://www.h-club.site/clubs/"+clubNo+"/like",
                method: "POST",
                headers: {
                    'accessTokenInfo': accessToken,
                },
                success: function (response) {
                    console.log("좋아요 추가 성공");
                },
                error: function (xhr, status, error) {
                    console.error("Error updating like status:", error);
                }
            });
        }

        function removeLike(clubNo) {
            accessToken = localStorage.getItem("accessTokenInfo");

            $.ajax({
                //url: "http://localhost:8081/clubs/"+clubNo+"/like",
                url: "https://www.h-club.site/clubs/"+clubNo+"/like",
                method: "DELETE",
                headers: {
                    'accessTokenInfo': accessToken,
                },
                success: function (response) {
                    console.log("좋아요 추가 성공");
                },
                error: function (xhr, status, error) {
                    console.error("Error updating like status:", error);
                }
            });
        }

        $(document).on('click', '.like-icon', function () {
            var clubNo = $(this).data('club-id');
            var isLiked = $(this).hasClass('liked') ? 'Y' : 'N';

            toggleLikeButton(clubNo, isLiked);
            if(isLiked === 'Y'){
                removeLike(clubNo)
            } else {
                addLike(clubNo)
            }
        });

        function getClubLikeList(categoryName) {
            $.ajax({
                url: "https://www.h-club.site/clubs/popular?category=" + categoryName,
                method: "GET",
                success: function (response) {
                    if (response.success) {
                        var data = response.data;
                        $(".clubs").empty();
                        var clubList = document.getElementById("clubs");

                        for (var i = 0; i < data.length; i += 2) {
                            var group = data.slice(i, i + 2);

                            var clubHTML = '<div class="grid-container">';
                            group.forEach(function (item) {
                                clubHTML += '<div class="grid-item"><div class="club-image-container">' +
                                    '<a href="/club/detail/' + item.clubNo + '"><img class="circle_recommend" src="' + item.clubImage + '"></a>' +
                                    '<span class="like-icon" data-club-id="' + item.clubNo + '"><i class="far fa-heart" style="color: #ffffff;"></i></span></div>' +
                                    '<div class="circle_content">' +
                                    '<p class="circle_name">' + item.clubName + '</p>' +
                                    '<a href="#" class="category_button">'+item.categoryName+'</a>' +
                                    '</div></div>';
                            });
                            clubHTML += '</div>';
                            $(".clubs").append(clubHTML);
                        }
                        updateLikedClubs();

                    } else {
                        console.error("Error:", response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data:", error);
                }
            });
        }

        function getClubRecentList(categoryName) {
            $.ajax({
                url: "https://www.h-club.site/clubs/recent/filter?category=" + categoryName,
                method: "GET",
                success: function (response) {
                    if (response.success) {
                        var data = response.data;
                        $(".clubs").empty();
                        var clubList = document.getElementById("clubs");

                        for (var i = 0; i < data.length; i += 2) {
                            var group = data.slice(i, i + 2);

                            var clubHTML = '<div class="grid-container">';
                            group.forEach(function (item) {
                                clubHTML += '<div class="grid-item"><div class="club-image-container">' +
                                    '<a href="/club/detail/' + item.clubNo + '"><img class="circle_recommend" src="' + item.clubImage + '"></a>' +
                                    '<span class="like-icon" data-club-id="' + item.clubNo + '"><i class="far fa-heart" style="color: #ffffff;"></i></span></div>' +
                                    '<div class="circle_content">' +
                                    '<p class="circle_name">' + item.clubName + '</p>' +
                                    '<a href="#" class="category_button">'+item.categoryName+'</a>' +
                                    '</div></div>';
                            });
                            clubHTML += '</div>';
                            $(".clubs").append(clubHTML);
                        }
                        updateLikedClubs();

                    } else {
                        console.error("Error:", response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data:", error);
                }
            });
        }

        function getCategoryName(categoryId) {
            switch (categoryId) {
                case 1:
                    return '요리';
                case 2:
                    return '재테크';
                case 3:
                    return '액티비티';
                case 4:
                    return '게임';
                case 5:
                    return '문화·예술';
                case 6:
                    return '외국어';
                case 7:
                    return '여행';
                case 8:
                    return '자기계발';
            }
        }
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
        .dropdown {
            position: relative;
            display: inline-block;
            margin-left: 770px;
            margin-top: 50px;
            margin-bottom: 20px;
        }

        .dropbtn {
            color: #000000;
            padding: 10px;
            font-size: 30px;
            border: none;
            cursor: pointer;
            background-color:transparent;
        }

        .arrow-icon {
            color: #333333;
            margin-left: 5px;
            transition: transform 0.3s;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            display: block;
            font-size: 24px;
            text-align: left;
            text-decoration: none;
        }

        .dropdown.open .arrow-icon {
            transform: rotate(180deg);
        }
    </style>
</head>
<body>
    <main class="main-container">
        <div class="category">
            <img id="total" src="/resources/image/category_total.png">
            <div class="category-item" onclick="getClubList(1), setCategoryId(1)">
                <img src="/resources/image/category_cooking.png">
            </div>
            <div class="category-item" onclick="getClubList(3), setCategoryId(3)">
                <img src="/resources/image/category_activity.png">
            </div>
            <div class="category-item" onclick="getClubList(7), setCategoryId(7)">
                <img src="/resources/image/category_travel.png">
            </div>
            <div class="category-item" onclick="getClubList(8), setCategoryId(8)">
                <img src="/resources/image/category_self.png">
            </div>
        </div>
        <ul id="hiddenList" class="totalList" style="display: none;">
                <div class="category">
                    <div class="category-item" onclick="getClubList(6), setCategoryId(6)">
                        <img src="/resources/image/category_foreign.png">
                    </div>
                    <div class="category-item" onclick="getClubList(4), setCategoryId(4)">
                        <img src="/resources/image/category_game.png">
                    </div>
                    <div class="category-item" onclick="getClubList(5), setCategoryId(5)">
                        <img src="/resources/image/category_culture.png">
                    </div>
                    <div class="category-item" onclick="getClubList(2), setCategoryId(2)">
                        <img src="/resources/image/category_money.png">
                    </div>
                </div>
            </ul>

        <div class="dropdown">
            <button class="dropbtn" id="filterButton">
                기본순
                <i class="arrow-icon fas fa-chevron-up"></i>
            </button>

            <div class="dropdown-content" id="filterOptions">
                <a href="#" onclick="changeFilter('기본순')">기본순</a>
                <a href="#" onclick="changeFilter('좋아요순')">좋아요순</a>
                <a href="#" onclick="changeFilter('새로 열린순')">새로 열린순</a>
            </div>
        </div>

        <script>
            var currentFilter = '기본순';

            function changeFilter(filter) {
                currentFilter = filter;
                document.getElementById('filterButton').innerText = filter + ' ';
                document.getElementById('filterButton').innerHTML +=
                    '<i class="arrow-icon fas fa-chevron-up"></i>';
                console.log(filter);
                var categoryId = getCurrentSelectedCategoryId();
                if(filter === '기본순'){
                    getClubList(categoryId)
                }
                else if(filter === '좋아요순'){
                    getClubLikeList(getCategoryName(categoryId));
                }
                else if(filter === '새로 열린순'){
                    getClubRecentList(getCategoryName(categoryId));
                }
            }

            document.getElementById('filterButton').addEventListener('click', function() {
                var dropdownContent = document.getElementById('filterOptions');
                var arrowIcon = document.querySelector('.arrow-icon');
                var dropdown = document.querySelector('.dropdown');

                if (dropdownContent.style.display === 'block') {
                    dropdownContent.style.display = 'none';
                    dropdown.classList.remove('open');
                } else {
                    dropdownContent.style.display = 'block';
                    dropdown.classList.add('open');
                }
            });

            document.addEventListener('click', function(event) {
                if (!event.target.matches('.dropbtn')) {
                    var dropdowns = document.getElementsByClassName('dropdown-content');
                    for (var i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.style.display === 'block') {
                            openDropdown.style.display = 'none';
                            document.querySelector('.dropdown').classList.remove('open');
                        }
                    }
                }
            });
        </script>

        <div class="clubs" id="clubs">
        </div>

        <div class="plus-club">
            <a href="/club/add">
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