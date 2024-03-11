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

    </div>

</main>
</body>
<script>
    /* 로그인 되어있지 않은 사용자 -> 홈으로 리다이렉트 */
    document.addEventListener("DOMContentLoaded", function() {
        let accessToken = localStorage.getItem("accessTokenInfo");
        if (!accessToken) {
            alert("로그인이 필요한 페이지입니다.");
            window.location.href = "/"; // 로그인 페이지 URL로 변경하세요.
        }
    });
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
    function displayMatches(matches) {
        const matchesContainer = $('.matches');
        matchesContainer.empty(); // 기존 매치 내용을 지웁니다.

        matches.forEach(match => {
            // 각 매치 정보로 HTML 요소 생성
            var scoreColor = match.teamNo === match.winTeamNo ? 'black' :  'black';
            if (match.winTeamScoreAmount == match.loseTeamScoreAmount) {scoreColor = 'black'}
            var matchElement = $('<div/>', { class: 'rounded-shape' }).append(
                $('<div/>', { class: 'left-section' }).append(
                    $('<img/>', { src: '/resources/image/comp/' + match.matchType.toLowerCase() + '.png', alt: '이미지' }),
                    $('<p/>').text(match.matchCapacity + ' vs ' + match.matchCapacity)
                ),
                $('<div/>', { class: 'middle-section' }).append(
                    $('<p/>').text(match.teamName),
                    $('<p/>', { style: 'color:' + scoreColor }).text(match.winTeamScoreAmount + ' vs ' + match.loseTeamScoreAmount)
                ),
                $('<div/>', { class: 'right-section' }).append(
                    $('<p/>').text(match.matchLoc),
                    $('<p/>').text(match.matchDate)
                )
            ).click(function (){
                goHistoryDetail(match.matchHistoryNo);
            });

            // matchesContainer에 매치 요소 추가
            matchesContainer.append(matchElement);
        });
    }

    /* accessToken 으로부터 유저 정보 추출하는 함수 */
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

    function goHistoryDetail(matchHistoryNo){
        window.location.href = '/mypage/myMatchHistory/detail/' + matchHistoryNo;
    }
</script>
</html>
