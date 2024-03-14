// 데이터 로딩
document.addEventListener('DOMContentLoaded', function () {

    let base64ImageData = localStorage.getItem('multipartFile');
    if (base64ImageData) {

        let imageElement = document.querySelector('.team-image img');

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

        let h2Element = document.querySelector('.team-detail h2');

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
    

    // 게임 종류
    let selectedGameTypeNum = localStorage.getItem("selectedGameTypeNum");
    if (selectedGameTypeNum) {

        let gameTypeElement = document.querySelector('.detail-component-gametype p');
        if (gameTypeElement) {
            gameTypeElement.textContent = selectedGameTypeNum + ' vs ' + selectedGameTypeNum;
        }
    }
    // 상품
    let teamProductJSON = localStorage.getItem("teamProduct");
    if (teamProductJSON) {
        let teamProductArray = JSON.parse(teamProductJSON);

        let goodsElement = document.querySelector('.detail-component-goods p');
        if (goodsElement) {


            goodsElement.textContent = teamProductArray.productName;
        }
    }

    // 팀원
    let selectedMembersJSON = localStorage.getItem("selectedMembers");
    if (selectedMembersJSON) {
        let selectedMembers = JSON.parse(selectedMembersJSON);


        let teamMateContainer = document.querySelector('.detail-component-team-mate');


        if (teamMateContainer && selectedMembers.length) {


            selectedMembers.forEach(member => {
                let pTag = document.createElement('p');
                pTag.textContent = member.memberName + ' ' + member.memberDept + ' ' + member.memberPosition;
                teamMateContainer.appendChild(pTag);
            });
        }
    }

    let rating = calculateAverageRating(selectedMembers);


    teamRatingElement.textContent = rating + '점';


});

// 팀 생성 -> 매칭 하러가기 버튼
document.addEventListener('DOMContentLoaded', function () {

    var button = document.querySelector('.team-button');


    button.addEventListener('click', function () {
        button.remove();

        // Create a new "매칭하러가기" button
        let matchingButton = document.createElement('button');
        matchingButton.textContent = '매칭하러가기';
        matchingButton.className = 'team-button';


        matchingButton.addEventListener('click', async function () {
            let url = '';
            let isInitCreate = localStorage.getItem("initCreate");
            if (isInitCreate === 'Y') {
                url = '/competition/start';
            } else {

                let matchNo = await sendMatchRequest();

                url = '/competition/matchDetail/' + matchNo;
            }

            window.location.href = url;
        });


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

    let memberList = data.data.memberList.map(member => member.memberNo);

    localStorage.setItem("teamNo", data.data.teamNo.toString());
    localStorage.setItem("teamRating", data.data.teamRating.toString());
    localStorage.setItem("matchCapacity", data.data.matchCapacity.toString());
    localStorage.setItem("matchType", data.data.matchType);
    localStorage.setItem("memberList", JSON.stringify(memberList));
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