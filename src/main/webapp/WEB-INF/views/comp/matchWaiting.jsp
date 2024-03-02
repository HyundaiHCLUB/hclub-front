
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/compCreateTeam.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <title>Match Waiting</title>
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

    @keyframes spin {
        from { transform: rotate(0deg); }
        to { transform: rotate(360deg); }
    }

    .rotating-image {
        animation: spin 2s linear infinite;
    }
    .content {
        width: 60%;
        text-align: center;
    }
    profile-circle {
        width: 500px;
        height: 500px;
        margin: 100px auto 30px;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
        background-color: transparent;

    }
    .profile-circle img {
        width: 100%;
        height: auto;
    }

    .notice {
        margin-top: 150px;
    }
    .notice p {
        font-size: 2.5em;
    }

    .btn-test {
        font-size: 3em;
        margin-top: 200px;
        width: 500px;
        height: 100px;
    }
</style>
<body>
<main>
    <div class="content">

        <div class="profile-circle">
            <img src="/resources/image/comp/comp_loading_sample.svg" class="rotating-image">
        </div>
        <div class="notice">
            <p>상대 팀을 찾고 있습니다....</p>
            <p>매칭이 완료되면 알려드릴게요!</p>
        </div>

        <div>
            <button>경쟁 홈으로</button>
        </div>
    </div>

</main>
</body>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var stompClient = null;

        function connect() {
            console.log('연결 시도');
            var socket = new WebSocket('wss://13.209.23.148/ws');
            //var socket = new WebSocket('ws://localhost:8082/ws');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function (frame) {
                console.log('Connected: ' + frame);
                stompClient.subscribe('/topic/matches', function (message) {
                    showMatchResult(message.body);
                });
                stompClient.subscribe('/topic/failure', function (message) {
                    showFailureMessage(message.body);
                });

                // 연결 성공 후 addToQueue 호출
                addToQueue();
            });
        }

        function addToQueue() {
            var teamNo = localStorage.getItem('teamNo');
            var teamMemberNo = JSON.parse(localStorage.getItem('memberList'));
            var matchType = localStorage.getItem('matchType');
            var matchCapacity = localStorage.getItem('matchCapacity');
            var teamRating = localStorage.getItem('teamRating');

            console.log(teamNo);
            console.log(teamMemberNo);
            console.log(matchType);
            console.log(matchCapacity);
            console.log(teamRating);

            var matchingRequest = {
                teamNo: teamNo,
                teamMemberNo: teamMemberNo,
                matchType: matchType,
                matchCapacity: matchCapacity,
                teamRating: teamRating
            };

            // 웹소켓을 통해 데이터 전달
            stompClient.send("/app/addTeamToQueue", {}, JSON.stringify(matchingRequest));
        }

        function showMatchResult(matchResult) {
            console.log("매치 성공!", matchResult);
            var teamNumbers = matchResult.split(',');

            var team1No = parseInt(teamNumbers[0].trim());
            var team2No = parseInt(teamNumbers[1].trim());

            console.log("Team 1 No: " + team1No);
            console.log("Team 2 No: " + team2No);

            $.ajax({
                type: "POST",
                //url: "http://localhost:8082/comp/match",
                url: "https://www.h-club.site/comp/match",
                contentType: "application/json",
                data: JSON.stringify({
                    team1No: team1No,
                    team2No: team2No
                }),
                success: function (response) {
                    console.log("AJAX 요청 성공", response);
                    window.location.href = '/competition/success';
                },
                error: function (error) {
                    console.error("AJAX 요청 실패", error);
                }
            });

        }

        function showFailureMessage(message) {
            console.log("매치 실패!", message);
        }

        connect();
    });
</script>

</html>
