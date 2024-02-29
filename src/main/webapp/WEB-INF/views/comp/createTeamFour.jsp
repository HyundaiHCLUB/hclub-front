<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/compCreateTeam.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>TeamCreated</title>
</head>
<style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;

    }
    .event-image {
        width: 95%;
        height: 40%;
        margin: 30px auto;
    }
    .event-image img {
        width: 100%;
        height: 100%;
    }
    .event-details {
        width: 90%;
        border-radius: 10px;
        padding: 20px;
        margin: 30px auto;
    }
    .event-details h2, .event-details p {
        margin: 10px 0; /* 위아래 여백 수정 */
    }
    .event-details h2 {
        color: #333; /* 제목 색상 설정 */
        font-size: 3em; /* 제목 글꼴 크기 설정 */
    }
    .event-details p {
        color: #666; /* 문단 색상 설정 */
        font-size: 24px; /* 문단 글꼴 크기 설정 */
    }
    .team-detail { /* 아이콘과 팀명 가로로 배치 */
        display: flex;
        align-items: center;
        gap: 30px; /* 아이콘과 <h2> 간격*/
        padding-left: 10px;
        padding-bottom: 10px;
        border-bottom: 1px solid black;
    }
    .team-detail img {
        width: 50px; /* 이미지 너비 조절 */
        height: auto; /* 이미지 높이를 자동으로 조절하여 비율 유지 */
    }
    .detail-component-header {
        margin-top: 20px;
        display: flex;
        align-items: center;
        font-size: 2em;
        gap: 10px;
    }

    /* Detail components container 스타일 */
    .details-container {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin: 30px auto;
        gap: 20px; /* 컴포넌트 간의 간격 조정 */
    }

    /* Detail component 개별 스타일 */
    .detail-component {
        flex-basis: 45%; /* flex 컨테이너 내에서 기본 크기 설정 */
        border-radius: 10px;
    }

    .detail-component-header {
        display: flex;
        align-items: center;
        gap: 10px; /* 아이콘과 텍스트 간격 */
    }

    .detail-component-header img {
        width: 48px; /* 헤더 아이콘 크기 조절 */
        height: 48px;
    }

    .detail-component h3 {
        font-size: 1.2em; /* 헤더 텍스트 크기 조절 */
        margin: 0; /* 기본 마진 제거 */
    }

    .detail-component p {
        margin-top: 10px; /* 헤더와 본문 사이의 상단 여백 */
        color: #666;
        font-size: 2em; /* 본문 텍스트 크기 조절 */
    }
    .button-container {
        width: 100%;
        display: flex;
        justify-content: center;
        margin-bottom: 30px;
    }
    .team-button {
        width: 85%;
        font-size: 2em;
        padding: 20px;
        border: none;
        border-radius: 10px;
        color: white;
        background-color: #46675C;
    }
</style>
<body>
<main>
    <div  class="event-image">
        <img src="/resources/image/comp/messi.png" alt="이벤트 이미지">
    </div>

    <!-- 이벤트 상세 정보 섹션 -->
    <div class="event-details">
        <div class="team-detail">
            <img src="/resources/image/comp/soccer.png"/>
            <h2>팀 이름</h2>
        </div>
        <!-- 장소 -->
        <div class="detail-component">
            <div class="detail-component-header">
                <img src="/resources/image/comp/comp_location.png">
                <h3>장소</h3>
            </div>
            <p>서울특별시 양천구 목동동로 111 양천구민회관</p>
        </div>
        <!-- 일시 & 레이팅-->
        <div class="details-container">
            <div class="detail-component">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/comp_calendar.png">
                    <h3>일시</h3>
                </div>
                <p>2023년 01월 16일 18:30</p>
            </div>

            <div class="detail-component">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/rating.svg">
                    <h3>레이팅</h3>
                </div>
                <p>1450</p>
            </div>
        </div>
        <!-- 게임 종류 & 상품-->
        <div class="details-container">
            <div class="detail-component">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/comp_gameType.png">
                    <h3>게임 종류</h3>
                </div>
                <p>3 vs 3</p>
            </div>

            <div class="detail-component">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/comp_trophy.png">
                    <h3>상품</h3>
                </div>
                <p>H-Cafe 50,000원권</p>
            </div>
        </div>
        <!-- 팀원 -->
        <div class="detail-component">
            <div class="detail-component-header">
                <img src="/resources/image/comp/comp_members.png">
                <h3>팀원</h3>
            </div>
            <p>차은우</p>
            <p>박형식</p>
            <p>송강</p>
        </div>
    </div>
    <div class="button-container">
        <button class="team-button">매칭하러가기</button>
    </div>
</main>
</body>
<script>
    /* 다음 페이지에 teamNo 넘겨주는거 가능한지 ? */
    var teamNo = 61; // 샘플 데이터
    document.addEventListener('DOMContentLoaded', function() {
        // Select the button by its class name
        var button = document.querySelector('.team-button');

        // Add a click event listener to the button
        button.addEventListener('click', function() {
            // Navigate to the /competition/matchDetail page
            window.location.href = '/competition/start/' + teamNo;
        });
    });
</script>
</html>
