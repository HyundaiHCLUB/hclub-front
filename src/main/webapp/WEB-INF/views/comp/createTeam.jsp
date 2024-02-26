<%--
  Created by IntelliJ IDEA.
  User: podo
  Date: 2/21/24
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>
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
        <div class="rounded-shape-gametype" data-game-type="soccer" onclick="selectGameType(this)">
            <div class="round-shape">
                <img src="/resources/image/comp/soccer.png"/>
            </div>
        </div>
        <div class="rounded-shape-gametype">
            <div class="round-shape">
                <img src="/resources/image/comp/basketball.png"/>
            </div>
        </div>
        <div class="rounded-shape-gametype">
            <div class="round-shape">
                <img src="/resources/image/comp/bowling.png"/>
            </div>
        </div>
        <div class="rounded-shape-gametype">
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
    document.addEventListener('DOMContentLoaded', function() {
        var selectedGameType = ""; // Variable to store the selected game type

        window.selectGameType = function(element) {
            // Remove the class from any previously selected game type
            var previouslySelected = document.querySelector('.selected-game-type');
            if (previouslySelected) {
                previouslySelected.classList.remove('selected-game-type');
            }

            // Add the class to the clicked game type
            element.classList.add('selected-game-type');

            // Save the selected game type
            selectedGameType = element.getAttribute('data-game-type');
            console.log("Selected Game Type:", selectedGameType); // Example action: log to console

            // Example: Save the selectedGameType to local storage or send to a server, etc.
            // localStorage.setItem('selectedGameType', selectedGameType);
        };
    });



    document.addEventListener('DOMContentLoaded', function() {
        var saveButton = document.getElementById('saveTeamName');
        var teamNameInput = document.getElementById('teamNameInput');

        // Toggle function to enable/disable editing
        function toggleEdit() {
            // Check if the input is currently disabled (meaning it's fixed and needs to be editable)
            if (teamNameInput.disabled) {
                // Enable the input for editing
                teamNameInput.disabled = false;
                teamNameInput.focus(); // Optionally, focus the input for immediate editing
            } else {
                // Save the team name when disabling editing
                var teamName = teamNameInput.value;
                console.log("Team Name Saved:", teamName); // Example action: log to console

                // Disable the input to "fix" its value
                teamNameInput.disabled = true;

                // Example: Save the teamName to local storage or send to a server, etc.
                // localStorage.setItem('teamName', teamName);
            }
        }

        // Add click event listener to the image to toggle editing
        saveButton.addEventListener('click', toggleEdit);
    });

</script>
</body>
</html>
