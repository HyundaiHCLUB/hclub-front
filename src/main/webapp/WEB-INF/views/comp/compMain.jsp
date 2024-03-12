<!-- 작성자 : 김동욱 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>H-Club</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/comp/compMain.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
<script src="/resources/js/comp/compMain.js"></script>
<body>
<main>


    <div class="comp-select">
        <div class="comp-select-container" onclick="navigateToCompetition()">
            <p style="color: #46675c">목록</p>
        </div>

        <div class="comp-select-container" onclick="navigateToTodayRanking()">
            <p>랭킹</p>
        </div>
    </div>
    <div class="half-screen-line"></div>
    <div class="custom-select-container">
        <select class="sport-select">
            <option value="ALL">종목 선택</option>
            <option value="SOCCER">축구</option>
            <option value="BASKETBALL">농구</option>
            <option value="BOWLING">볼링</option>
            <option value="DART">다트</option>
        </select>

        <!-- 추가된 custom-select 2개 -->
        <select class="date-select">

        </select>

        <select class="match-type-select">
            <option value="">인원 선택</option>

        </select>
    </div>

    <div class="custom-search-container">
        <select class="order-select">
            <option value="dates">시간순</option>
            <option value="rating">레이팅순</option>

        </select>
        <input type="text" class="search-input" placeholder="팀명으로 검색해보세요">
        <img src="/resources/image/comp/magnifying_glass.png" alt="Search Icon" class="search-icon">
    </div>

    <div class="matches">

    </div>

    <div class="add-button">

        <svg width="160" height="160" viewBox="0 0 42 42" fill="none"
             xmlns="http://www.w3.org/2000/svg">
            <circle cx="21" cy="21" r="20.25" fill="#46675C"/>
            <path d="M21 12L21 30" stroke="white" stroke-width="1.2" stroke-linecap="round"/>
            <path d="M30 21L12 21" stroke="white" stroke-width="1.2" stroke-linecap="round"/>
        </svg>

    </div>

</main>
</body>
</html>
