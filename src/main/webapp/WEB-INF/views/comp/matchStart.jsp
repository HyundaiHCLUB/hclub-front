
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/compCreateTeam.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Match Start</title>
</head>
<style>
    body, html {
        height: 100%;
        margin: 0;
        padding: 0;

    }

    main {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100%;
    }

    .content {
        width: 60%;
        text-align: center;
    }

    .profile-circle {
        border: 5px solid #FFD700; /* 금색 테두리 */
        border-radius: 50%; /* 원형 테두리 */
        width: 500px;
        height: 500px;
        margin: 0 auto 30px;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
    }

    .profile-circle img {
        width: 100%;
        height: auto;
    }

    .buttons {
        display: flex;
        flex-direction: column;
    }

    button {
        background-color: #4CAF50; /* 초록색 버튼 */
        border: none;
        color: white;
        padding: 30px 64px;
        text-align: center;
        text-decoration: none;
        font-size: 3em;
        margin: 10px auto; /* 중앙 정렬을 위해 수정 */
        cursor: pointer;
        border-radius: 20px; /* 버튼 둥근 모서리 */
        width: 70%;
    }
    button.start-match {
        margin-top: 50px;
        margin-bottom: 20px;
    }
    button.end-match {
        background-color: #f44336; /* 빨간색 버튼 */
    }

    /* 추가적인 반응형 디자인, 호버 효과 등을 위한 스타일이 필요하면 여기에 추가하세요. */



</style>
<body>
<main>
<div class="content">

    <div class="profile-circle">
        <img src="/resources/image/comp/start_match.svg" alt="Player">
    </div>
    <div class="buttons">
        <button class="start-match">매치 시작</button>
        <button class="end-match">매치 종료</button>
    </div>
</div>
</main>
</body>
<script>
    // DOM이 완전히 로드된 후에 실행됩니다.
    document.addEventListener('DOMContentLoaded', function() {
        // 'start-match' 클래스를 가진 버튼을 찾습니다.
        var startMatchButton = document.querySelector('.start-match');

        // 버튼에 클릭 이벤트 리스너를 추가합니다.
        startMatchButton.addEventListener('click', function() {
            // '/competition/waiting' URL로 이동합니다.
            window.location.href = '/competition/waiting';
        });
    });
    /**
     * 매칭 시도 할 때 프론트에서 아래의 데이터 형식으로 요청을 보냄.
     teamMemberNo(팀멤버들 id)와 teamNo,matchType,matchCapacity, teamRating (팀 정보)를 반환하는
     Api가 필요할 것 같습니다요
     var matchingRequest = {
        teamNo: teamNo,
        teamMemberNo: teamMemberNo,
        matchType: matchType,
        matchCapacity: matchCapacity,
        teamRating: teamRating
     };
     * */
</script>
</html>
