<!-- 작성자 : 김동욱 -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/comp/compCreateTeam.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- jquery -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script src="/resources/js/comp/compCreateOne.js"></script>
    <title>CreateTeam</title>
</head>
<body>
<main>
    <div class="select-game-type-container">
        <div class="rounded-shape-gametype" data-game-type="SOCCER" onclick="selectGameType(this)">
            <div class="round-shape">
                <img src="/resources/image/comp/soccer.png"/>
            </div>
        </div>
        <div class="rounded-shape-gametype" data-game-type="BASKETBALL" onclick="selectGameType(this)">
            <div class="round-shape">
                <img src="/resources/image/comp/basketball.png"/>
            </div>
        </div>
        <div class="rounded-shape-gametype" data-game-type="BOWLING" onclick="selectGameType(this)">
            <div class="round-shape">
                <img src="/resources/image/comp/bowling.png"/>
            </div>
        </div>
        <div class="rounded-shape-gametype" data-game-type="DART" onclick="selectGameType(this)">
            <div class="round-shape">
                <img src="/resources/image/comp/dart.png"/>
            </div>
        </div>
    </div>
    <!-- 파일 업로드 -->
    <input type="file" id="fileInput" style="display: none;" multiple>

    <div class="plus-button"></div>
    <div class="image-upload-container"
    ></div>

    <div class="team-name-container">
        <div class="input-icon-container">
            <input type="text" id="teamNameInput" class="search-input" placeholder="팀 이름">
            <img src="/resources/image/comp/pencil.png" alt="팀 이름" class="search-icon" id="saveTeamName">
        </div>
    </div>
    <div class="game-type-select">
        <div class="game-type-select-container">
            <img src="/resources/image/comp/gametype.png" alt="">
            <span> 게임 종류를 선택하세요.</span>


        </div>
    </div>
    <div class="game-type-num">

    </div>
    <div class="team-mate-add-container">
        <div class="select-option-container-1">
            <img src="/resources/image/comp/team-create-member-icon.png" alt="" style="width:100px;height:100px">
            <span style="">팀원</span>
        </div>
        <div class="team-mate-search" style="position: relative">
            <input type="text" id="memberSearchInput" placeholder="팀원을 검색하세요"/>
            <div class="search-results-dropdown" style="position: absolute"></div>
        </div>
    </div>
    <div class="team-mate-list-container">
        <ul id="teamMateList"></ul>
    </div>

    <div class="location-add-container">
        <div class="select-option-container">
            <img src="/resources/image/comp/team-create-loc-icon-1.png" alt="">
            <span style="margin-left: 10px;">장소</span>
        </div>
        <div class="team-mate-search">
            <input id="locationSearchInput" type="text" placeholder="장소를 입력해주세요"/>

        </div>
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
