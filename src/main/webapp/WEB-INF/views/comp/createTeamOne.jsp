<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/compCreateTeam.css">
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
<script>
    $(document).ready(function () {
        // Assuming your existing code to generate game format options is here
        // ...

        // Function to update the selected game type number in localStorage
        function updateSelectedGameTypeNum(selectedFormat) {
            // Extract the first number from the format (e.g., "1 vs 1" becomes "1")
            const num = selectedFormat.charAt(0);

            // Save to localStorage
            localStorage.setItem('selectedGameTypeNum', num);
        }

        // Attach click event listener to each game format option
        $('.game-type-num').on('click', '.game-format-option', function () {
            // Remove 'selected' class from all options
            $('.game-format-option').removeClass('selected');
            // Add 'selected' class to clicked option
            $(this).addClass('selected');

            // Get the text of the clicked option
            const selectedFormat = $(this).text();

            // Update the selected game type number in localStorage
            updateSelectedGameTypeNum(selectedFormat);
        });

        // Load and set the selected game type number from localStorage on page load
        function setSelectedGameTypeNumFromLocalStorage() {
            const selectedNum = localStorage.getItem('selectedGameTypeNum');
            if (selectedNum) {
                // Find the option that starts with the selected number and click it programmatically
                $('.game-format-option').each(function () {
                    if ($(this).text().charAt(0) === selectedNum) {
                        $(this).click();
                        return false; // break the loop
                    }
                });
            }
        }

        setSelectedGameTypeNumFromLocalStorage();

        // Your other JavaScript code...
    });
    $(document).ready(function () {

        function displaySavedMemberInfo() {
            // Retrieve the individual pieces of data from localStorage
            let name = localStorage.getItem('name');
            let dept = localStorage.getItem('dept');
            let pos = localStorage.getItem('pos');

            // Check if the information exists
            if (name && dept && pos) {
                // Create the list item
                let newListItem = $('<li></li>').text(name);

                // Create the remove button as an img element
                let removeBtn = $('<img>', {
                    src: '/resources/image/comp/member-cancel.png',
                    alt: 'Remove',
                    css: {
                        cursor: 'pointer',
                        marginLeft: '30px',
                        width: '50px',
                        height: '50px'
                    },
                    click: function () {

                    }
                });

                // Append the remove button to the list item
                newListItem.append(removeBtn);

                // Append the new list item to the teamMateList container
                $('#teamMateList').append(newListItem);
            }
        }

        // Call the function to display the saved member information
        displaySavedMemberInfo();

        // Function to clear all localStorage items except for accessTokenInfo
        function clearLocalStorageExceptAccessTokenInfo() {
            // Get all keys in localStorage
            const keys = Object.keys(localStorage);

            if (localStorage.getItem('initCreate') === 'N') {
                keys.forEach(function (key) {
                    // Check if the current key is not accessTokenInfo
                    if (key !== 'accessTokenInfo' && key !== 'opponentTeamNo' && key !== 'initCreate' && key !== 'name' && key !== 'dept' && key !== 'pos') {
                        // Remove the item from localStorage
                        localStorage.removeItem(key);
                    }

                });
                return;
            }

            // N 일 경우
            keys.forEach(function (key) {
                // Check if the current key is not accessTokenInfo
                if (key !== 'accessTokenInfo' && key !== 'initCreate' && key !== 'name' && key !== 'dept' && key !== 'pos') {
                    // Remove the item from localStorage
                    localStorage.removeItem(key);
                }

            });
        }

        // Call the function when the page loads
        clearLocalStorageExceptAccessTokenInfo();

        // Your existing code...
    });

    document.addEventListener('DOMContentLoaded', function () {

        let gameType = '';

        window.selectGameType = function (element) {
            // 모든 gameType div 요소를 찾음
            var allGameTypes = document.querySelectorAll('.rounded-shape-gametype');

            // 모든 gameType div 요소에 대해 selected-game-type 클래스 제거
            allGameTypes.forEach(function (gameType) {
                gameType.classList.remove('selected-game-type');
                gameType.style.backgroundColor = "#DBDBDB"; // 기본 배경 색상으로 설정
            });

            // 클릭한 요소에만 selected-game-type 클래스 추가 및 색상 변경
            element.classList.add('selected-game-type');
            element.style.backgroundColor = "#46675C"; // 여기서 원하는 색상으로 변경

            // Save the selected game type
            var selectedGameType = element.getAttribute('data-game-type');
            gameType = selectedGameType;
            localStorage.removeItem("gameType");
            localStorage.setItem("gameType", selectedGameType);
            console.log(localStorage.getItem("gameType"))

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


        function toggleEdit() {
            if (teamNameInput.disabled) {
                teamNameInput.disabled = false;
                teamNameInput.focus();
            } else {
                var teamName = teamNameInput.value;

                localStorage.removeItem("teamName");
                localStorage.setItem("teamName", teamName);
                console.log("Team Name Saved:", teamName);
                teamNameInput.disabled = true;
            }
        }

        // Add click event listener to the image to toggle editing
        saveButton.addEventListener('click', toggleEdit);

        //팀원 검색
        $(document).ready(function () {
            var memberSearchInput = $('#memberSearchInput');
            var searchResultsDropdown = $('.search-results-dropdown');

            // Function to search member by name
            function searchMemberByName(memberName) {
                $.ajax({
                    url: 'https://www.h-club.site/comp/member?memberName=' + encodeURIComponent(memberName),
                    type: 'GET',
                    dataType: 'json',
                    success: function (response) {
                        // Clear previous search results
                        searchResultsDropdown.empty();
                        let memberList = response.data.memberList;

                        // Check if there are any results
                        if (memberList && memberList.length > 0) {
                            searchResultsDropdown.show(); // Show the dropdown if there are results
                            memberList.forEach(function (member) {
                                var memberItem = $('<div class="search-result-item"></div>');

                                var nameSpan = $('<span></span>').text(member.memberName).css('margin-right', '10px');
                                var deptSpan = $('<span></span>').text(member.memberDept).css('margin-right', '5px');
                                var positionSpan = $('<span></span>').text(member.memberPosition);

                                memberItem.append(nameSpan, deptSpan, positionSpan);
                                searchResultsDropdown.append(memberItem);

                                memberItem.on('click', function () {
                                    memberSearchInput.val(member.memberName); // Use member.memberName
                                    searchResultsDropdown.empty().hide(); // Clear and hide the dropdown after selection
                                    saveSelectedMemberToLocalStorage(member);
                                    memberSearchInput.val('');
                                });
                            });
                        } else {
                            // Optionally hide the dropdown if there are no results
                            searchResultsDropdown.hide();
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("Error fetching members:", error);
                        searchResultsDropdown.empty().append('<div class="search-result-item">에러</div>').show();
                    }
                });
            }

            function saveSelectedMemberToLocalStorage(member) {
                // Initialize an array to hold the selected members
                var selectedMembers = localStorage.getItem('selectedMembers') ? JSON.parse(localStorage.getItem('selectedMembers')) : [];

                // Add the new member to the array
                selectedMembers.push(member);
                // Save the updated array back to localStorage
                localStorage.setItem('selectedMembers', JSON.stringify(selectedMembers));

                // Update the UI
                updateTeamMateListUI();
            }

            function updateTeamMateListUI() {
                const teamMateList = document.getElementById('teamMateList');
                teamMateList.innerHTML = ''; // Clear the list

                // Fetch selected members from localStorage
                var selectedMembers = localStorage.getItem('selectedMembers') ? JSON.parse(localStorage.getItem('selectedMembers')) : [];

                // Iterate over each member and create list items
                selectedMembers.forEach((member, index) => {
                    const li = document.createElement('li');

                    // Construct member details text
                    li.textContent = member.memberName + ' ' + member.memberDept + ' ' + member.memberPosition;

                    // Create an image element for the remove button
                    const removeImg = document.createElement('img');
                    removeImg.src = '/resources/image/comp/member-cancel.png';
                    removeImg.alt = 'Remove';
                    removeImg.style.cursor = 'pointer';
                    removeImg.style.marginLeft = '30px';

                    // Set the width and height of the image if necessary
                    removeImg.style.width = '50px';
                    removeImg.style.height = '50px';


                    removeImg.onclick = function () {
                        removeTeamMember(index);
                    };

                    // Append the image to the list item
                    li.appendChild(removeImg);
                    // Append the list item to the list
                    teamMateList.appendChild(li);
                });
            }

            function removeTeamMember(index) {
                // Retrieve the current list of selected members from localStorage
                var selectedMembers = JSON.parse(localStorage.getItem('selectedMembers'));
                // Remove the member at the specified index
                selectedMembers.splice(index, 1);
                // Update localStorage with the new list of members
                localStorage.setItem('selectedMembers', JSON.stringify(selectedMembers));
                // Refresh the displayed list of members
                updateTeamMateListUI();
            }

            $(document).ready(function () {
                // Update the displayed list of team members when the page loads
                updateTeamMateListUI();
            });


            // Show the dropdown when the input field is focused
            memberSearchInput.focus(function () {
                if (searchResultsDropdown.children().length > 0) {
                    searchResultsDropdown.show();
                }
            });

            // Hide the dropdown when clicking elsewhere, including a delay for blur
            $(document).click(function () {
                searchResultsDropdown.hide();
            });
            memberSearchInput.click(function (event) {
                event.stopPropagation(); // Prevent the document click event from hiding the dropdown immediately
            });
            searchResultsDropdown.click(function (event) {
                event.stopPropagation(); // Prevent click inside the dropdown from propagating
            });

            // Trigger search when typing
            memberSearchInput.on('input', function () {
                var memberName = $(this).val();
                if (memberName.length > 1) { // Prevent searching for too short strings
                    searchMemberByName(memberName);
                } else {
                    searchResultsDropdown.empty().hide(); // Clear and hide the dropdown if input is cleared or too short
                }
            });
        });

        // 파일 업로드
        var plusButton = document.querySelector('.plus-button');
        var fileInput = document.getElementById('fileInput');
        var imageUploadContainer = document.querySelector('.image-upload-container');

        plusButton.addEventListener('click', function () {
            fileInput.click();
        });
        fileInput.addEventListener('change', function () {
            if (this.files && this.files[0]) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    try {
                        let imgDataUrl = e.target.result;
                        plusButton.style.display = 'none'; // Hide the plus button
                        console.log(e.target)
                        let img = document.createElement("img");
                        img.setAttribute("src", imgDataUrl);
                        img.style.width = "500px";
                        img.style.height = "500px";
                        img.style.border = "none";
                        img.style.borderRadius = "40%";

                        imageUploadContainer.appendChild(img);

                        localStorage.setItem('multipartFile', imgDataUrl);
                        console.log("Image saved to localStorage.");
                    } catch (error) {
                        if (e == QUOTA_EXCEEDED_ERR) {
                            alert("Error: Local Storage limit exceeds.");
                        } else {
                            console.log("Error saving image to localStorage.", e);
                        }
                    }

                };
                reader.readAsDataURL(this.files[0]);
            }
        });


        // Optional: Handle file selection
        fileInput.addEventListener('change', function () {
            var files = fileInput.files;

            console.log(files);
        });
    });
    // 장소 저장

    $(document).ready(function () {
        // Event listener for the "Next" button click
        $('#goNextButton').click(function () {
            // Retrieve the value from the location search input
            var locationInputValue = $('#locationSearchInput').val();

            // Save the value to localStorage
            localStorage.setItem('teamLoc', locationInputValue);

        });

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
