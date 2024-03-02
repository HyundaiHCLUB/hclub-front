<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>H-Club</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/mypage.css">
    <link rel="stylesheet" href="/resources/css/compMain.css">
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
        }
        .user-info {
            margin-left: 20px;
        }
        .user-info h3 {
            font-size: 1.2em;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .user-info p {
            font-size: 1.1em;
            margin-top: 0;
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
            font-weight: bold;
            font-size: 1.5em;
        }
        .fas fa-user-circle icon {
            margin : auto 10px auto 30px;
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
            <p id="userRating"></p>
        </div>
    </div>
    <div class="mypage-menus">
        <div class="menu" onclick="location.href='/mypage/updateProfileView'">
            <i class="fa-solid fa-user"></i>
            <span>프로필 수정</span>
        </div>
        <div class="menu" onclick="location.href='/mypage/myClubs'">
            <i class="fa-solid fa-flag"></i>
            <span><a>내 동아리</a></span>
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
</main>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery CDN -->
<script src="https://kit.fontawesome.com/5ba1c6c3a8.js" crossorigin="anonymous"></script> <!-- font awesome icons-->
<script>
    $(document).ready(function() {
        // 로컬 스토리지에서 JWT 가져오기
        let accessToken = localStorage.getItem("accessTokenInfo");

        // 가져온 JWT를 사용하여 사용자 정보 가져오기
        getUserInfo(accessToken).then(memberInfo => {
            console.log("memberID : " + memberInfo.member_id);
            $('#userName').text(memberInfo.employeeName); // 이름 설정
            $('#userDept').text(memberInfo.employeeDept + ' (' + memberInfo.employeePosition + ')'); // 부서와 직급 설정
            $('#userRating').text('레이팅 ' + memberInfo.memberRating);
            $('.profile-pic').attr('src', memberInfo.memberImage);
        }).catch(error => {
            console.error('사용자 정보 가져오기 실패:', error);
        });
    });

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

</script>
</html>
