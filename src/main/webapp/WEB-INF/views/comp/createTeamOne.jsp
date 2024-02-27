<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/compCreateTeam.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>CreateTeam</title>
</head>
<body>
<main>
    <div class="select-game-type-container">
        <div class="rounded-shape-gametype selected-game-type" data-game-type="SOCCER" onclick="selectGameType(this)">
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

    <div class="plus-button"></div>
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
        <p>팀원</p>
        <div class="team-mate-search">
            <input type="text" id="memberSearchInput" placeholder="팀원을 검색하세요"/>
            <button id="searchMemberButton">검색</button>
        </div>
    </div>

    <div class="location-add-container">
        <p>장소</p>
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
<script>

    document.addEventListener('DOMContentLoaded', function () {

        let gameType = 'SOCCER';
        
        window.selectGameType = function (element) {
            // 모든 gameType div 요소를 찾음
            var allGameTypes = document.querySelectorAll('.rounded-shape-gametype');

            // 모든 gameType div 요소에 대해 selected-game-type 클래스 제거
            allGameTypes.forEach(function(gameType) {
                gameType.classList.remove('selected-game-type');
                gameType.style.backgroundColor = "#DBDBDB"; // 기본 배경 색상으로 설정
            });

            // 클릭한 요소에만 selected-game-type 클래스 추가 및 색상 변경
            element.classList.add('selected-game-type');
            element.style.backgroundColor = "#46675C"; // 여기서 원하는 색상으로 변경

            // Save the selected game type
            var selectedGameType = element.getAttribute('data-game-type');
            console.log("Selected Game Type:", selectedGameType);
            gameType = selectedGameType;

            // Update the game-type-num div based on the selected game type
            updateGameTypeNum(selectedGameType);
        };

        function updateGameTypeNum(gameType) {
            var gameTypeNumDiv = document.querySelector('.game-type-num');
            gameTypeNumDiv.innerHTML = ''; // Clear existing content

            let gameFormats = [];
            switch (gameType) {
                case 'SOCCER':
                    gameFormats = ['3 vs 3', '5 vs 5', '6 vs 6', '11 vs 11'];
                    break;
                case 'BASKETBALL':
                    gameFormats = ['1 vs 1', '2 vs 2', '3 vs 3', '5 vs 5'];
                    break;
                case 'BOWLING':
                    gameFormats = ['1 vs 1', '2 vs 2', '3 vs 3', '4 vs 4'];
                    break;
                case 'DART':
                    gameFormats = ['1 vs 1', '2 vs 2', '3 vs 3', '4 vs 4'];
                    break;
                // Add more cases as needed
            }

            gameFormats.forEach(function (format) {
                var div = document.createElement('div');
                div.textContent = format;
                div.className = 'game-format-option'; // Assign a class for styling
                div.onclick = function () {
                    var siblings = gameTypeNumDiv.querySelectorAll('.game-format-option');
                    siblings.forEach(function (sibling) {
                        sibling.classList.remove('selected');
                    });
                    div.classList.add('selected');
                };
                gameTypeNumDiv.appendChild(div);
            });
        }


        var saveButton = document.getElementById('saveTeamName');
        var teamNameInput = document.getElementById('teamNameInput');

        // Function to enable/disable editing
        function toggleEdit() {
            if (teamNameInput.disabled) {
                teamNameInput.disabled = false;
                teamNameInput.focus();
            } else {
                var teamName = teamNameInput.value;
                console.log("Team Name Saved:", teamName);
                teamNameInput.disabled = true;
            }
        }

        // Add click event listener to the image to toggle editing
        saveButton.addEventListener('click', toggleEdit);

        //팀원 검색
        var memberSearchInput = document.getElementById('memberSearchInput');
        var searchMemberButton = document.getElementById('searchMemberButton');
        searchMemberButton.addEventListener('click', function () {
            var memberName = memberSearchInput.value;
            if (memberName.length > 0) { // 빈 문자열로 요청을 보내지 않도록 함
                searchMemberByName(memberName);
            }
        });


        function displaySearchResults(data) {
            // This function should update your HTML to display the search results.
            // For example, if data is an array of member objects, you could iterate
            // through them and append them to a list under the search input.
            console.log(data); // Log data for debugging. Replace this with actual display logic.
        }

    });
    // 이전
    document.addEventListener('DOMContentLoaded', function () {
        var goBackButton = document.getElementById('goBackButton');
        goBackButton.addEventListener('click', function () {
            window.history.back();
        });
    });
    // 다음 페이지 이동
    document.addEventListener('DOMContentLoaded', function () {
        var goNextButton = document.getElementById('goNextButton');
        goNextButton.addEventListener('click', function () {
            window.location.href = '/competition/create/2';
        });
    });
</script>
</body>
</html>
