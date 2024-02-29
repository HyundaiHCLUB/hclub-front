
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/compCreateTeam.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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

        <div class="btn-test">
            <button>test</button>
        </div>
        <div>
            <button>경쟁 홈으로</button>
        </div>
    </div>
</main>
</body>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Select the button by its class name
        var button = document.querySelector('.btn-test');

        // Add a click event listener to the button
        button.addEventListener('click', function() {
            // Navigate to the /competition/matchDetail page
            window.location.href = '/competition/success';
        });
    });
</script>
</html>
