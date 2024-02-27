<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>받은 선물함</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/mypage.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/5ba1c6c3a8.js" crossorigin="anonymous"></script> <!-- font awesome icons-->
    <style>
        .product-card {
            display: flex;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            margin: 30px auto;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: 0.3s;
            height: 220px;
            width: 75%;
        }

        .product-image {
            height: 200px; /* Example fixed height */
            width: 50%;
            object-fit: cover;
        }

        .product-details {
            padding-left: 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            width: 100%;
        }

        .product-title {
            font-size: 2em;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .product-date {
            font-size: 1em;
            color: #666;
        }

        .product-price {
            font-size: 1.5em;
            color: #333;
            margin-top: 5px;
        }

        .mypage-header i {
            color: black;
        }

        .mypage-subheader {
            width: 80%;
        }
        .mypage-subheader h2 {
            font-size: 3em;
            font-weight: bold;
            color: #333;
            width: fit-content;
            padding-right: 30px;
            margin-top: 100px;
            margin-left: 10%;
        }
        .product-category {
            padding: 10px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 35%; /* New category width */
            border-left: 1px solid #ddd; /* Separating line if needed */
            font-weight: bold;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
<main>
    <div class="mypage-top-menu">
        <img src="/resources/image/left-arrow.png"
             onclick="window.history.back()"/>
    </div>

    <div class="mypage-header">
        <i class="fa-regular fa-flag"></i>
        <h1>내 동아리</h1>
        <i class="fa-regular fa-flag"></i>
    </div>
    <!-- 가입 완료된 동아리 -->
    <div class="mypage-subheader">
        <h2>가입 완료</h2>
    </div>
    <div class="approved-clubs">
        <!-- 샘플데이터 -->
        <div class="product-card">
            <img src="/resources/image/sample3.png" alt="사진" class="product-image">
            <div class="product-details">
                <div class="product-title">난쏘공</div>
                <div class="product-date"> 개설일 </div>
                <div class="product-price">2023-04-12</div>
            </div>
            <div class="product-category">
                <div class="category-title">카테고리명</div>
            </div>
        </div>
    </div>
   <!-- 승인 대기중인 동아리-->
    <div class="mypage-subheader">
        <h2>승인 대기중</h2>
    </div>
    <div class="waiting-clubs">
        <!-- 샘플데이터 -->
        <div class="product-card">
            <img src="/resources/image/sample3.png" alt="사진" class="product-image">
            <div class="product-details">
                <div class="product-title">난쏘공</div>
                <div class="product-date"> 개설일 : <span>2023-04-12 </span></div>
                <div class="product-price"> 활동 지역 <h4>서울시 강남구 테헤란로123</h4></div>
            </div>
            <div class="product-category">
                <div class="category-title">카테고리명</div>
            </div>
        </div>
    </div>


</main>
</body>
<script>
    var memberId;

    $(document).ready(function() {
        // 로컬 스토리지에서 JWT 가져오기
        let accessToken = localStorage.getItem("accessTokenInfo");
        // 가져온 JWT를 사용하여 사용자 정보 가져오기
        getUserInfo(accessToken).then(memberInfo => {
            memberId = memberInfo.member_id;
            console.log("memberID : " + memberId);
        }).catch(error => {
            console.error('사용자 정보 가져오기 실패:', error);
        });
        // 동아리 목록 ajax 요청
        $.ajax({
            type: 'GET',
            url: 'https://www.h-club.site/auth/mypage/clubs',
            dataType: 'json',
            headers: {
                'Authorization': 'Bearer ' + accessToken, // accessToken 사용
            },
            success: function (response) {
                console.log('사용자 정보:', response);
                displayClubs(response); // 동아리 목록 표시 함수 호출
            },
            error: function (xhr, status, error) {
                console.error('사용자 정보 가져오기 실패:', error);
            }
        });
    });

    /* accessToken 으로 유저 정보 받아오는 함수 */
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
                    resolve(response); // 성공 시 response 객체를 resolve 합니다.
                },
                error: function (xhr, status, error) {
                    console.error('사용자 정보 가져오기 실패:', error);
                    reject(error); // 실패 시 error 객체를 reject 합니다.
                }
            });
        });
    }

    /* 동아리 목록을 화면에 표시하는 함수 */
    function displayClubs(clubs) {
        clubs.forEach(club => {
            // 각 동아리 정보로 HTML 요소 생성
            var clubCard = $('<div/>', { class: 'product-card' }).append(
                $('<img/>', { src: club.clubImage, alt: '사진', class: 'product-image' }),
                $('<div/>', { class: 'product-details' }).append(
                    $('<div/>', { class: 'product-title', text: club.clubName }),
                    $('<div/>', { class: 'product-date' }).append(
                        '개설일 : ', $('<span/>', { text: club.createdAt })
                    ),
                    $('<div/>', { class: 'product-price' }).append(
                        '활동 지역 ', $('<h4/>', { text: club.clubLoc })
                    )
                ),
                $('<div/>', { class: 'product-category' }).append(
                    $('<div/>', { class: 'category-title', text: club.categoryName })
                )
            );

            // useYN 값에 따라 적절한 위치에 동아리 카드 추가
            if (club.useYN === 'Y') {
                $('.approved-clubs').append(clubCard);
            } else if (club.useYN === 'N') {
                $('.waiting-clubs').append(clubCard);
            }
        });
    }


</script>
</html>
