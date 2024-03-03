<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
    <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>메인 페이지</title>
    <script>
        var headerHeight = document.querySelector('header').offsetHeight;
        var footerHeight = document.querySelector('footer').offsetHeight;

        window.addEventListener('scroll', function () {
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
            function getHotClubList() {
                $.ajax({
                    //url: "http://localhost:8081/clubs/like",
                    url: "https://www.h-club.site/clubs/like",
                    method: "GET",
                    success: function (response) {
                        if (response.success) {
                            var data = response.data;
                            $(".hotClubs").empty();
                            data.forEach(function (item) {
                                var clubHTML =
                                    '<div class="grid-container">' +
                                    '<div class="grid-hot-item">' +
                                    '<a href="/club/detail/' + item.clubNo + '">' +
                                    '<img class="circle_recommend" src="' + item.clubImage + '">' +
                                    '</div>' +
                                    '<div class="grid-hot-item">' +
                                    '<div class="circle_hot_content">' +
                                    '<p class="circle_name">' + item.clubName + '</p>' +
                                        '<a href="#" class="category_button">'+item.categoryName+'</a>'+
                                    '<a href="#" class="content_button">인기</a>'+
                                    '</div>' +
                                        '<p class="club_info">' + item.clubInfo + '</p>' +
                                        '<p class="circle_hot_loc">'+ item.clubLoc +'</p>' +
                                    '<i class="fa-solid fa-users fa-1x" style="margin-top: 8px">10</i>' +
                                    '</a>' +
                                    '</div></div>'
                                    ;
                                $(".hotClubs").append(clubHTML);
                            });
                        } else {
                            console.error("Error:", response.message);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("Error fetching data:", error);
                    }
                });
            }

            function getInterestList() {
                accessToken = localStorage.getItem("accessTokenInfo");

                $.ajax({
                    url: "https://www.h-club.site/clubs/interest",
                    method: "GET",
                    headers: {
                        'accessTokenInfo': accessToken,
                    },
                    success: function (response) {
                        if (response.success) {
                            var data = response.data;
                            $(".interestClubs").empty();
                            var clubHTML = '<div class="grid-container">';
                            data.forEach(function (item) {
                                clubHTML += '<div class="grid-item">' +
                                    '<img class="circle_recommend" src="' + item.clubImage + '">' +
                                    '<div class="circle_content">' +
                                    '<p class="circle_name">' + item.clubName + '</p>' +
                                    '<a href="#" class="category_button">' + item.categoryName + '</a>' +
                                    '<a href="#" class="content_button">추천</a>' +
                                    '</div>' +
                                    '</div>'
                                ;
                            });
                            clubHTML += '</div>';
                            $(".interestClubs").append(clubHTML);

                        } else {
                            console.error("Error:", response.message);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("Error fetching data:", error);
                    }
                });
            }
            getHotClubList();
            getInterestList();
        });
    </script>
    <script>
        function getUserInfo(accessToken) {
            return new Promise((resolve, reject) => {
                $.ajax({
                    type: 'GET',
                    // url: 'http://localhost:8080/auth/mypage/info',   // 로컬
                    url: 'https://www.h-club.site/auth/mypage/info', // 배포판
                    headers: {
                        'Authorization': 'Bearer ' + accessToken, // accessToken 사용
                    },
                    success: function (response) {
                        console.log('사용자 정보:', response);
                        localStorage.setItem("name",response.employeeName);
                        resolve(response); // 성공 시 response 객체를 resolve 합니다.
                    },
                    error: function (xhr, status, error) {
                        console.error('사용자 정보 가져오기 실패:', error);
                        reject(error); // 실패 시 error 객체를 reject 합니다.
                    }
                });
            })
                .then(response => {
                    const subTitle = document.getElementById('sub-title');
                    const name = localStorage.getItem('name');
                    subTitle.textContent = name + '님을 위한 추천 동아리';
                    return response;
                })
                .catch(error => {
                    console.error('에러 발생:', error);
                });

        }
        ccessTokenInfo = localStorage.getItem("accessTokenInfo");
        getUserInfo(accessTokenInfo);
    </script>
</head>
<body>
<main>
    <div class="navbar_menu">
        <li><a href="/">투데이</a></li>
        <li><a href="/home/hot">인기 동아리</a></li>
        <li><a href="/home/district">지역별 동아리</a></li>
        <li><a href="">내 모임</a></li>
        <li><a href="#">#토너먼트</a></li>
    </div>

    <div class="slidebox">
        <input type="radio" name="slide" id="slide01" checked>
        <input type="radio" name="slide" id="slide02">
        <input type="radio" name="slide" id="slide03">
        <input type="radio" name="slide" id="slide04">
        <ul class="slidelist">
            <li class="slideitem">
                <div>
                    <label for="slide04" class="left"></label>
                    <label for="slide02" class="right"></label>
                    <a><img src="/resources/image/banner1.png"></a>
                </div>
            </li>
            <li class="slideitem">
                <div>
                    <label for="slide01" class="left"></label>
                    <label for="slide03" class="right"></label>
                    <a><img src="/resources/image/banner2.png"></a>
                </div>
            </li>
            <li class="slideitem">
                <div>
                    <label for="slide02" class="left"></label>
                    <label for="slide04" class="right"></label>
                    <a><img src="/resources/image/banner3.png"></a>
                </div>
            </li>
            <li class="slideitem">
                <div>
                    <label for="slide03" class="left"></label>
                    <label for="slide01" class="right"></label>
                    <a><img src="/resources/image/banner4.png"></a>
                </div>
            </li>
        </ul>
    </div>

    <div class="category">
        <div class="category-item">
            <a href="/club/1"><img src="/resources/image/category_cooking.png"></a>
        </div>
        <div class="category-item">
            <a href="/club/3"><img src="/resources/image/category_activity.png"></a>
        </div>
        <div class="category-item">
            <a href="/club/4"><img src="/resources/image/category_game.png"></a>
        </div>
        <div class="category-item">
            <a href="/club/5"><img src="/resources/image/category_culture.png"></a>
        </div>
    </div>
    <div class="category">
        <div class="category-item">
            <a href="/club/6"><img src="/resources/image/category_foreign.png"></a>
        </div>
        <div class="category-item">
            <a href="/club/7"><img src="/resources/image/category_travel.png"></a>
        </div>
        <div class="category-item">
            <a href="/club/8"><img src="/resources/image/category_self.png"></a>
        </div>
        <div class="category-item">
            <a href="/club/2"><img src="/resources/image/category_money.png"></a>
        </div>
    </div>

    <div class="title" style="width: 1100px">
        <div class="title-item">
            <p class="sub-title" id="sub-title"></p>
        </div>
    </div>

    <div class="interestClubs"></div>

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

    <div class="title">
        <div class="title-item">
            <p class="sub-title">취향저격! 인기 동아리</p>
        </div>

    </div>

    <div class="hotClubs">
    </div>

</main>
</body>
</html>