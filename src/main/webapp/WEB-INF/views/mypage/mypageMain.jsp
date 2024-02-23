<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="${path}/resources/css/main.css">
    <link rel="stylesheet" href="${path}/resources/css/mypage.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>마이페이지</title>
    <style>
        span:active {
            color: #4CAF50;
        }

        .profile-header {
            width: 80%;
            height: 400px;
            margin: 10px auto 50px;
            display: flex;
            align-items: center;
            /*border: 2px solid #E2FFD4;*/
            /*background-color: #E2FFD4;*/
            border-radius: 5%;
            font-size: 36px;
        }

        .profile-pic {
            width: 250px;
            height: 250px;
            border-radius: 50%;
            margin: auto 30px;
        }
        .user-info {
            margin-left: 20px;
        }
        .user-info h3 {
            font-size: 1.5em;
            margin-bottom: 20px;
        }
        .user-info p {
            font-size: 1.1em;
            margin-top: 0;
        }
        .mypage-menus {
            margin: 30px auto;
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
            padding-left: 50px;
            background-color: #F1F5E8;
            border-radius: 30px;
            margin: 40px auto;
            font-size: 2em;
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
                <img src="/resources/image/sample.png" alt="프로필 이미지" class="profile-pic">
                <div class="user-info">
                    <h3 id="userName"></h3>
                    <p id="userDept"></p>
                </div>
            </div>
            <div class="mypage-menus">
                <div class="menu" onclick="location.href='/mypage/updateProfileView'">
                    <i class="fa-solid fa-user"></i>
                    <span>프로필 수정</span>
                </div>
                <div class="menu" onclick="location.href='/mypage/myClubs'">
                    <i class="fa-regular fa-flag"></i>
                    <span><a>내 동아리</a></span>
                </div>
                <div class="menu" onclick="location.href='/mypage/myFavorites'">
                    <i class="fa-solid fa-heart"></i>
                    <span><a>즐겨찾기</a></span>
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
            console.log("memberID : " + memberInfo.memberId);
            $('#userName').text(memberInfo.employeeName); // 이름 설정
            $('#userDept').text(memberInfo.employeeDept + ' (' + memberInfo.employeePosition + ')'); // 부서와 직급 설정
        }).catch(error => {
            console.error('사용자 정보 가져오기 실패:', error);
        });
    });

    function getUserInfo(accessToken) {
        return new Promise((resolve, reject) => {
            $.ajax({
                type: 'GET',
                /* 테스트시 각자 설정한 auth 서버 포트번호로 대체하세요 */
                url: 'http://localhost:8080/auth/mypage/info',
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