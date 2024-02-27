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


</main>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        let gameType = '';

        window.selectGameType = function (element) {
            // Remove the class from any previously selected game type
            var previouslySelected = document.querySelector('.selected-game-type');
            if (previouslySelected) {
                previouslySelected.classList.remove('selected-game-type');
            }

            // Add the class to the clicked game type
            element.classList.add('selected-game-type');

            // Save the selected game type
            var selectedGameType = element.getAttribute('data-game-type');
            console.log("Selected Game Type:", selectedGameType); // Example action: log to console
            gameType = selectedGameType;

            // Update the game-type-num div based on the selected game type
            updateGameTypeNum(selectedGameType);
        };

        function updateGameTypeNum(gameType) {
            var gameTypeNumDiv = document.querySelector('.game-type-num');

            if (gameType === 'SOCCER') {
                gameTypeNumDiv.innerHTML = '<div>3 vs 3</div><div>5 vs 5</div><div>6 vs 6</div><div>11 vs 11</div>';
            } else {
                gameTypeNumDiv.innerHTML = ''; // Clear or update with other game types' info as needed
            }
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
    });


</script>
</body>
</html>
