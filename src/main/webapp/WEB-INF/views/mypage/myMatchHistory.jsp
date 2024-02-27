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
        .rounded-shape {
            border-radius: 15px;
        }
        .middle-section p {
            font-size: 1.5em;
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
        <i class="fa-solid fa-trophy"></i>
        <h1>매치 히스토리</h1>
        <i class="fa-solid fa-trophy"></i>
    </div>
    <div class="matches">

        <% for (int i = 0; i < 5; i++ ) {%>
        <div class="rounded-shape">
            <div class="left-section">
                <img src="/resources/image/comp/soccer.png" alt="이미지" />
                <p>3 vs 3</p>
            </div>
            <div class="middle-section">
                <p>블루 드래곤즈</p>
            </div>
            <div class="right-section">
                <p>서울시 강남구 코트</p>
                <p>2024/03/04 16:03</p>
            </div>
        </div>
        <%} %>
    </div>

</main>
</body>
<script>
    $(document).ready(function() {
        // 로컬 스토리지에서 JWT 가져오기
        let accessToken = localStorage.getItem("accessTokenInfo");

        // 사용자의 기록을 가져오는 비동기 함수를 Promise로 감싸기
        getUserHistory(accessToken).then(history => {
            console.log('사용자 기록:', history);
            // 사용자 기록을 화면에 표시하는 함수 호출
            displayMatches(history);
        }).catch(error => {
            console.error('사용자 기록 가져오기 실패:', error);
        });

        // 가져온 JWT를 사용하여 사용자 정보 가져오기
        getUserInfo(accessToken).then(memberInfo => {
            console.log("memberID : " + memberInfo.member_id);
        }).catch(error => {
            console.error('사용자 정보 가져오기 실패:', error);
        });
    });

    // 사용자 기록을 가져오는 비동기 함수
    function getUserHistory(accessToken) {
        return new Promise((resolve, reject) => {
            $.ajax({
                type: 'GET',
                url: 'https://www.h-club.site/auth/mypage/history',
                headers: {
                    'Authorization': 'Bearer ' + accessToken,
                },
                success: function (response) {
                    console.log('히스토리 가져오기 성공 -> ' + response);
                    resolve(response); // 성공 시 response 객체를 resolve 합니다.
                },
                error: function (xhr, status, error){
                    console.error('히스토리 가져오기 실패:', error);
                    reject(error); // 실패 시 error 객체를 reject 합니다.
                }
            });
        });
    }


    function getUserInfo(accessToken) {
        return new Promise((resolve, reject) => {
            $.ajax({
                type: 'GET',
                url: 'https://www.h-club.site/auth/mypage/comp', // 배포판
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
    function displayMatches(matches) {
        const matchesContainer = $('.matches');
        matchesContainer.empty(); // 기존 매치 내용을 지웁니다.

        matches.forEach(match => {
            const matchElement = `
            <div class="rounded-shape">
                <div class="left-section">
                    <img src="/resources/image/comp/${match.matchType.toLowerCase()}.png" alt="이미지" />
                    <p>${match.score1} vs ${match.score2}</p>
                </div>
                <div class="middle-section">
                    <p>${match.teamName}</p>
                </div>
                <div class="right-section">
                    <p>${match.matchLoc}</p>
                    <p>${match.matchDate}</p>
                </div>
            </div>
        `;
            matchesContainer.append(matchElement);
        });
    }
</script>
</html>
