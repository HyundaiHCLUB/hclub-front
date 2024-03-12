<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/comp/compCreateTeamThree.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="/resources/js/comp/compCreateThree.js"></script>
    <title>TeamCreated</title>
</head>

<body>
<main>
    <div class="team-image">
        <img src="" alt="팀 이미지">
    </div>

    <!-- 이벤트 상세 정보 섹션 -->
    <div class="event-details">
        <div class="team-detail">
            <img src="/resources/image/comp/soccer.png"/>
            <h2>팀 이름</h2>
        </div>
        <!-- 장소 -->
        <div class="details-container">
            <div class="detail-component-loc">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/team-loc-icon.png">
                    <h3>장소</h3>
                </div>
                <p>경기 장소</p>
            </div>
            <div class="detail-component-rating">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/team-rating-icon.png">
                    <h3>레이팅</h3>
                </div>
                <p>레이팅</p>
            </div>
        </div>
        <!-- 일시 & 레이팅-->
        <div class="details-container">
            <div class="detail-component-date">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/team-date-icon.png">
                    <h3>일시</h3>
                </div>
                <p>경기 일시</p>
            </div>


        </div>
        <!-- 게임 종류 & 상품-->
        <div class="details-container">
            <div class="detail-component-gametype">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/team-capa-icon.png">
                    <h3>게임 종류</h3>
                </div>
                <p>2 vs 2</p>
            </div>

            <div class="detail-component-goods">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/team-prize-icon.png">
                    <h3>상품</h3>
                </div>
                <p>상품</p>
            </div>
        </div>
        <!-- 팀원 -->
        <div class="detail-component-team-mate">
            <div class="detail-component-header">
                <img src="/resources/image/comp/team-member-icon.png">
                <h3>팀원</h3>
            </div>

        </div>
    </div>
    <div class="button-container">
        <button class="team-button">팀 생성</button>
    </div>

</main>
<script>


</script>
</body>

</html>
