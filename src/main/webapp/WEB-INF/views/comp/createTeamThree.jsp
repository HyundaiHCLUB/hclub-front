<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/compCreateTeamThree.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
        <div class="detail-component-loc">
            <div class="detail-component-header">
                <img src="/resources/image/comp/comp_location.png">
                <h3>장소</h3>
            </div>
            <p>경기 장소</p>
        </div>
        <!-- 일시 & 레이팅-->
        <div class="details-container">
            <div class="detail-component-date">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/comp_calendar.png">
                    <h3>일시</h3>
                </div>
                <p>2023년 01월 16일 18:30</p>
            </div>

            <div class="detail-component-rating">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/rating.svg">
                    <h3>레이팅</h3>
                </div>
                <p>1450</p>
            </div>
        </div>
        <!-- 게임 종류 & 상품-->
        <div class="details-container">
            <div class="detail-component-gametype">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/comp_gameType.png">
                    <h3>게임 종류</h3>
                </div>
                <p>2 vs 2</p>
            </div>

            <div class="detail-component-goods">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/comp_trophy.png">
                    <h3>상품</h3>
                </div>
                <p>H-Cafe 50,000원권</p>
            </div>
        </div>
        <!-- 팀원 -->
        <div class="detail-component-team-mate">
            <div class="detail-component-header">
                <img src="/resources/image/comp/comp_members.png">
                <h3>팀원</h3>
            </div>

        </div>
    </div>
    <div class="button-container">
        <button class="team-button">팀 생성</button>
    </div>

</main>
<script>
    // 데이터 로딩
    document.addEventListener('DOMContentLoaded', function () {
        // Retrieve the Base64 image string from localStorage
        let base64ImageData = localStorage.getItem('multipartFile');
        if (base64ImageData) {
            // Find the <img> tag within the .event-image container
            let imageElement = document.querySelector('.team-image img');
            // Set the retrieved Base64 string as the src attribute of the <img> tag
            imageElement.src = base64ImageData;
        }
        // 종목
        let gameType = localStorage.getItem("gameType");
        let gameTypeElement = document.querySelector('.team-detail img');
        switch (gameType) {
            case 'SOCCER':
                gameTypeElement.src = '/resources/image/comp/soccer.png'
                break;
            case 'BASKETBALL':
                gameTypeElement.src = '/resources/image/comp/basketball.png'
                break;
            case 'BOWLING':
                gameTypeElement.src = '/resources/image/comp/bowling.png'
                break;
            case 'DART':
                gameTypeElement.src = '/resources/image/comp/dart.png'
                break;

        }

        // 팀 이름
        let teamName = localStorage.getItem('teamName');
        if (teamName) {
            // Find the <h2> tag that should display the team name
            let h2Element = document.querySelector('.team-detail h2');
            // Set the retrieved team name as the text content of the <h2> tag
            h2Element.textContent = teamName;
        }
        // 장소
        let location = localStorage.getItem("teamLoc");
        if (location) {
            let teamLocElement = document.querySelector('.detail-component-loc p');
            teamLocElement.textContent = location;
        }
        // 일시
        let date = localStorage.getItem("matchDate") + ' ' + localStorage.getItem("matchTime");
        if (date) {
            let teamDateElement = document.querySelector('.detail-component-date p');
            teamDateElement.textContent = date;
        }

        // 레이팅 , 멤버
        const selectedMembers = JSON.parse(localStorage.getItem('selectedMembers'));
        let teamRatingElement = document.querySelector('.detail-component-rating p');

        function calculateAverageRating(members) {
            if (members.length === 0) return 0;
            const totalRating = members.reduce((acc, member) => acc + member.memberRating, 0);
            const averageRating = totalRating / members.length;
            return Math.floor(averageRating);
        }


        function createMemberDetailsArray(members) {
            return members.map(member => member.memberName + ' ' + member.memberDept + ' ' + member.memberPosition);
        }

        // 게임 종류
        let selectedGameTypeNum = localStorage.getItem("selectedGameTypeNum");
        if (selectedGameTypeNum) {
            // Assuming you want to set this number to the <p> inside .detail-component-gametype
            let gameTypeElement = document.querySelector('.detail-component-gametype p');
            if (gameTypeElement) {
                gameTypeElement.textContent = selectedGameTypeNum + ' vs ' + selectedGameTypeNum; // Or however you wish to format it
            }
        }
        // 상품
        let teamProductJSON = localStorage.getItem("teamProduct");
        if (teamProductJSON) {
            let teamProductArray = JSON.parse(teamProductJSON);
            // Find the <p> tag within .detail-component-goods
            let goodsElement = document.querySelector('.detail-component-goods p');
            if (goodsElement) {
                // Assuming you want to concatenate all product names separated by commas

                goodsElement.textContent = teamProductArray.productName;
            }
        }

        // 팀원
        let selectedMembersJSON = localStorage.getItem("selectedMembers");
        if (selectedMembersJSON) {
            let selectedMembers = JSON.parse(selectedMembersJSON);

            // Find the .detail-component-team-mate container
            let teamMateContainer = document.querySelector('.detail-component-team-mate');

            // Ensure the container is found and the selectedMembers array is not empty
            if (teamMateContainer && selectedMembers.length) {


                // Create a new <p> tag for each member and append to the container
                selectedMembers.forEach(member => {
                    let pTag = document.createElement('p');
                    pTag.textContent = member.memberName; // Set text to memberName
                    teamMateContainer.appendChild(pTag);
                });
            }
        }

        let rating = calculateAverageRating(selectedMembers);


        teamRatingElement.textContent = rating;

    });

    // 팀 생성 -> 매칭 하러가기 버튼
    document.addEventListener('DOMContentLoaded', function () {
        // Select the button by its class name
        var button = document.querySelector('.team-button');

        // Add an event listener to the button for its functionality
        button.addEventListener('click', function () {
            button.remove(); // Remove the original button

            // Create a new "매칭하러가기" button
            let matchingButton = document.createElement('button');
            matchingButton.textContent = '매칭하러가기';
            matchingButton.className = 'team-button'; // Assign any classes for styling

            // Event listener for the new matching button
            matchingButton.addEventListener('click', async function () {
                let url = '';
                let isInitCreate = localStorage.getItem("initCreate");
                if (isInitCreate === 'Y') {
                    url = '/competition/start';
                } else {

                    let matchNo = await sendMatchRequest();

                    url = '/competition/matchDetail/' + matchNo;
                }

                window.location.href = url; // Redirect to the appropriate URL
            });

            // Add the new matching button to the container
            var buttonContainer = document.querySelector('.button-container');
            buttonContainer.appendChild(matchingButton);
        });
    });

    async function sendMatchRequest() {
        var team1No = localStorage.getItem("teamNo");
        var team2No = localStorage.getItem("opponentTeamNo");
        var CreateMatchRequest = {
            "team1No": team1No,
            "team2No": team2No
        };

        try {
            const response = await fetch('https://www.h-club.site/comp/match', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(CreateMatchRequest),
            });
            const data = await response.json();
            if (response.ok) {
                console.log('Success:', data);
                return data.data; // 성공 시 data.data 리턴
            } else {
                throw new Error('Network response was not ok.');
            }
        } catch (error) {
            console.error('Error:', error);
        }
    }


    // POST
    document.addEventListener('DOMContentLoaded', function () {
        var teamButton = document.querySelector('.team-button');

        teamButton.addEventListener('click', function () {
            var teamLoc = localStorage.getItem('teamLoc');
            var teamName = localStorage.getItem('teamName');
            var gameType = localStorage.getItem('gameType');
            var originalMatchDate = localStorage.getItem('matchDate');
            var matchTime = localStorage.getItem('matchTime');
            var matchDateParts = originalMatchDate.match(/(\d+)년 (\d+)월 (\d+)일/);

            var formattedMatchDate = '';
            if (matchDateParts) {
                // Manually constructing the date string without template literals
                formattedMatchDate = matchDateParts[1] + '-' +
                    (matchDateParts[2].length < 2 ? '0' : '') + matchDateParts[2] + '-' +
                    (matchDateParts[3].length < 2 ? '0' : '') + matchDateParts[3] +
                    ':' + matchTime;
            }

            var selectedMembers = JSON.parse(localStorage.getItem('selectedMembers'));
            var teamProduct = JSON.parse(localStorage.getItem('teamProduct'));

            var memberList = selectedMembers.map(function (member) {
                return member.memberNo;
            });

            var teamDTO = {
                teamLoc: teamLoc,
                teamName: teamName,
                memberList: memberList,
                teamGoods: teamProduct.productName,
                matchType: gameType,
                matchCapacity: memberList.length,
                matchDate: formattedMatchDate,
                productNo: teamProduct.productId
            };
            console.log(teamDTO);
            var base64ImageContent = localStorage.getItem('multipartFile');
            if (base64ImageContent) {
                var contentType = base64ImageContent.match(/data:(image\/[^;]+);base64/)[1];
                var b64Data = base64ImageContent.split(',')[1];
                var imageBlob = b64toBlob(b64Data, contentType);

                var formData = new FormData();
                formData.append('teamDTO', new Blob([JSON.stringify(teamDTO)], {type: 'application/json'}));
                formData.append('multipartFile', imageBlob, teamName + '.jpg');

                fetch('https://www.h-club.site/comp', {
                    method: 'POST',
                    body: formData,
                })
                    .then(function (response) {
                        return response.json();
                    })
                    .then(function (data) {
                        console.log(data);
                        // 다음 페이지로 보낼 데이터 세팅
                        setTeamCreateResponseToLocalStorage(data);

                    })
                    .catch(function (error) {
                        console.error('Error:', error);
                    });
            }
        });
    });

    function setTeamCreateResponseToLocalStorage(data) {

        clearLocalStorageExceptAccessTokenInfo();
        // Extract memberNo from each member and store it in an array
        let memberList = data.data.memberList.map(member => member.memberNo);

        localStorage.setItem("teamNo", data.data.teamNo.toString());
        localStorage.setItem("teamRating", data.data.teamRating.toString());
        localStorage.setItem("matchCapacity", data.data.matchCapacity.toString());
        localStorage.setItem("matchType", data.data.matchType);
        localStorage.setItem("memberList", JSON.stringify(memberList)); // Convert array to JSON string
        localStorage.setItem("teamLoc", data.data.teamLoc);
        localStorage.setItem("teamName", data.data.teamName);
    }

    function clearLocalStorageExceptAccessTokenInfo() {

        localStorage.removeItem("gameType");
        localStorage.removeItem("teamName");
        localStorage.removeItem("multipartFile");
        localStorage.removeItem("selectedGameTypeNum");
        localStorage.removeItem("selectedMembers");
        localStorage.removeItem("teamLoc");
        localStorage.removeItem("teamProduct");
        localStorage.removeItem("matchDate");
        localStorage.removeItem("matchTime");

    }

    function b64toBlob(b64Data, contentType, sliceSize) {
        contentType = contentType || '';
        sliceSize = sliceSize || 512;

        var byteCharacters = atob(b64Data);
        var byteArrays = [];

        for (var offset = 0; offset < byteCharacters.length; offset += sliceSize) {
            var slice = byteCharacters.slice(offset, offset + sliceSize);
            var byteNumbers = new Array(slice.length);

            for (var i = 0; i < slice.length; i++) {
                byteNumbers[i] = slice.charCodeAt(i);
            }

            var byteArray = new Uint8Array(byteNumbers);
            byteArrays.push(byteArray);
        }

        return new Blob(byteArrays, {type: contentType});
    }


</script>
</body>

</html>
