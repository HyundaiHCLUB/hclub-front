<!-- 작성자 : 송원선 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>H-Club</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/mypage.css">
    <link rel="stylesheet" href="/resources/css/comp/compMain.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/5ba1c6c3a8.js" crossorigin="anonymous"></script> <!-- font awesome icons-->
    <style>
        .profile-header {
            width: 80%;
            height: 400px;
            margin: 10px auto 50px;
            display: flex;
            align-items: center;
            border-radius: 5%;
            font-size: 36px;
        }

        .profile-pic {
            width: 250px;
            height: 250px;
            border: 8px solid #6FC173;
            border-radius: 50%;
            margin: auto 30px;
            object-fit: cover;
        }

        .user-info {
            margin-left: 20px;
        }

        .user-info h3 {
            font-size: 1.2em;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .user-info p {
            font-size: 1.1em;
            margin-top: 0;
        }

        #userName {
            font-size: 1.8em;
        }

        #userDept {
            font-size: 1em;
            margin-bottom: 30px;
        }

        .mypage-menus {
            margin: 0 auto;
            padding: 20px;
            width: 80%;
            background-color: #F1F5E8;
            border-radius: 30px;
        }

        .menu {
            display: flex;
            align-items: center;
            width: 70%;
            height: 120px;
            padding: 20px;
            background-color: #F1F5E8;
            border-radius: 30px;
            margin: 60px auto;
            font-size: 2.2em;
        }

        .menu span {
            margin-top: auto;
            margin-bottom: auto;
            margin-left: 50px;
            font-weight: 500;
            font-size: 1.5em;
        }

        .fas fa-user-circle icon {
            margin: auto 10px auto 30px;
        }

        .user-rating {
            display: flex; /* Flexbox 레이아웃 사용 */
            align-items: center; /* 세로축(center)을 기준으로 자식 요소들을 가운데 정렬 */
            gap: 10px; /* 이미지와 텍스트 사이에 10px의 간격을 줌 */
        }

        .user-rating img {
            width: 40px;
            height: 40px;
        }

        #userRating {
            line-height: 40px; /* Set line-height equal to the height of the image for vertical alignment */
            margin: 0; /* Remove default margin */
            display: flex; /* Use flex to align text */
            align-items: center; /* Align text to the center vertically */
            height: 40px; /* Ensure the div height matches the image height */
            font-weight: 500;
            color: #0061f7;
        }

        .logout {
            width: 80%;
            height: 400px;
            margin: 10px auto 50px;
            display: flex;
            align-items: center;
            border-radius: 5%;
            font-size: 36px;
        }

        .btn-logout {
            width: 100%;
            height: 150px;
            border-radius: 10px;
            background: #507A4DFF;
            border: none;
            color: white;
            font-size: 1.4em;
        }
    </style>
</head>
<body>
<main>
    <div class="mypage-top-menu">
        <img src="/resources/image/left-arrow.png"
             onclick="window.history.back()"/>
    </div>
    <div class="profile-header">
        <img src="" class="profile-pic">
        <div class="user-info">
            <h3 id="userName"></h3>
            <p id="userDept"></p>
            <div class="user-rating">
                <img src="/resources/image/comp/rating.svg"/>
                <p style="margin-bottom: 0; margin-right: 10px;">레이팅 </p>
                <p id="userRating"></p>
            </div>
        </div>
    </div>
    <div class="mypage-menus">
        <div class="menu" onclick="location.href='/mypage/updateProfileView'">
            <i class="fa-solid fa-user"></i>
            <span>프로필 수정</span>
        </div>
        <div class="menu" onclick="location.href='/mypage/myProceedingMatch'">
            <i class="fa-solid fa-flag"></i>
            <span><a>진행중인 매치</a></span>
        </div>

        <div class="menu" onclick="location.href='/mypage/myGifts'">
            <i class="fa-solid fa-gift"></i>
            <span><a>받은 선물함</a></span>
        </div>
        <div class="menu" onclick="location.href='/mypage/myMatchHistoryView'">
            <i class="fa-solid fa-trophy"></i>
            <span>매치 히스토리</span>
        </div>
    </div>
    <div class="logout">
        <button class="btn-logout" onclick="logOut()">로그아웃</button>
    </div>
</main>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery CDN -->
<script src="https://kit.fontawesome.com/5ba1c6c3a8.js" crossorigin="anonymous"></script> <!-- font awesome icons-->
<script>
    /* 로그인 되어있지 않은 사용자 -> 홈으로 리다이렉트 */
    document.addEventListener("DOMContentLoaded", function () {
        let accessToken = localStorage.getItem("accessTokenInfo");
        if (!accessToken) {
            alert("로그인이 필요한 페이지입니다.");
            window.location.href = "/"; // 로그인 페이지 URL로 변경하세요.
        }
    });
    $(document).ready(function () {
        // 로컬 스토리지에서 JWT 가져오기
        let accessToken = localStorage.getItem("accessTokenInfo");
        let defaultImage = '/resources/image/default_image.png';

        // 가져온 JWT를 사용하여 사용자 정보 가져오기
        getUserInfo(accessToken).then(memberInfo => {
            console.log("memberID : " + memberInfo.member_id);
            $('#userName').text(memberInfo.employeeName); // 이름 설정
            $('#userDept').text(memberInfo.employeeDept + ' (' + memberInfo.employeePosition + ')'); // 부서와 직급 설정
            // $('#userRating').text('레이팅 ' + memberInfo.memberRating);
            $('#userRating').text(memberInfo.memberRating);
            let userProfileImage = memberInfo.memberImage || defaultImage;
            $('.profile-pic').attr('src', userProfileImage);
        }).catch(error => {
            console.error('사용자 정보 가져오기 실패:', error);
        });
    });

    function logOut() {
        localStorage.removeItem("accessTokenInfo")
        location.href = "https://www.h-club.site/login/loginView";
    }

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

    document.querySelector('.btn-logout').addEventListener('click', function () {
        localStorage.clear();

        window.location.href = '/login/loginView'; // 예시: 로그인 페이지로 리다이렉트
    });
</script>
</html>
