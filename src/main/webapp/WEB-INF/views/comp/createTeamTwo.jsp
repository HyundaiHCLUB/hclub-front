<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/comp/compCreateTeamTwo.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- jQuery -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- JS -->
    <script src="/resources/js/comp/compCreateTwo.js"></script>
    <title>CreateTeam2</title>
</head>
<body>
<main>
    <div class="team-caption-container">
        <div class="team-caption-image">
            <img src="" alt="">
        </div>
        <div class="team-captain-name">

            <p>팀장 이름</p>
            <div class="captain-caption">
                <img src="/resources/image/comp/star.png" alt="">
                <p>팀장</p>
            </div>
        </div>
    </div>

    <div class="team-border-line">

    </div>
    <div class="select-match-date-container">
        <div class="select-option-container">
            <img src="/resources/image/comp/team-create-date-icon.png" alt="">
            <span style="padding-left: 21px">날짜</span>
        </div>
        <div class="select-match-date">
            <input id="dateSelectInput" type="text" placeholder="날짜를 선택해주세요"/>


        </div>


    </div>
    <div class="select-match-time-container">
        <div class="select-option-container">
            <img src="/resources/image/comp/team-create-time-icon.png" alt="" style="margin-left: -13px">
            <span>시간</span>
        </div>
        <div class="select-match-time">
            <input id="timeSelectInput" type="text" placeholder="시간을 선택해주세요"/>
        </div>
    </div>
    <div class="select-product-container">
        <div class="select-option-container">
            <img src="/resources/image/comp/team-create-prize-icon.png" alt="" style="margin-left: -13px">
            <span>상품</span>
        </div>
        <div class="products"></div>
    </div>

    <div class="team-create-button-container">
        <div class="move-next-button">
            <button id="goBackButton">이전</button>
        </div>
        <div class="move-next-button">
            <button id="goNextButton">다음</button>
        </div>
    </div>
</main>

</body>
</html>
