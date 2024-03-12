$(document).ready(function () {


    function updateSelectedGameTypeNum(selectedFormat) {
        // 1 vs 1 -> 인원 숫자로 Parsing
        const match = selectedFormat.match(/^\d+/);

        if (match) {
            const num = match[0];

            localStorage.setItem('selectedGameTypeNum', num);
        }
    }


    $('.game-type-num').on('click', '.game-format-option', function () {

        $('.game-format-option').removeClass('selected');

        $(this).addClass('selected');


        const selectedFormat = $(this).text();


        updateSelectedGameTypeNum(selectedFormat);
    });


    function setSelectedGameTypeNumFromLocalStorage() {
        const selectedNum = localStorage.getItem('selectedGameTypeNum');
        if (selectedNum) {

            $('.game-format-option').each(function () {
                if ($(this).text().charAt(0) === selectedNum) {
                    $(this).click();
                    return false;
                }
            });
        }
    }

    setSelectedGameTypeNumFromLocalStorage();


});
$(document).ready(function () {

    // 이름, 부서 , 직급을 가져와서 display
    function displaySavedMemberInfo() {

        let name = localStorage.getItem('name');
        let dept = localStorage.getItem('dept');
        let pos = localStorage.getItem('pos');


        if (name && dept && pos) {

            let newListItem = $('<li></li>').text(name);


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


            newListItem.append(removeBtn);


            $('#teamMateList').append(newListItem);
        }
    }


    displaySavedMemberInfo();

    // 로컬스토리지 clear
    function clearLocalStorageExceptAccessTokenInfo() {
        const keys = Object.keys(localStorage);
        const retainKeys = ['accessTokenInfo', 'initCreate', 'name', 'dept', 'pos'];

        // If 'initCreate' 이 'N' 일 시에 수동 매칭으로 이동
        if (localStorage.getItem('initCreate') === 'N') {
            retainKeys.push('opponentTeamNo');
            retainKeys.push('opponentMatchType');
            retainKeys.push('opponentTeamCapacity');
        }

        keys.forEach(function (key) {

            if (!retainKeys.includes(key)) {

                localStorage.removeItem(key);
            }
        });
    }


    clearLocalStorageExceptAccessTokenInfo();


});

document.addEventListener('DOMContentLoaded', function () {


    let gameType = '';

    window.selectGameType = function (element) {
        // 모든 gameType div 요소를 찾음
        let allGameTypes = document.querySelectorAll('.rounded-shape-gametype');

        // 모든 gameType div 요소에 대해 selected-game-type 클래스 제거
        allGameTypes.forEach(function (gameType) {
            gameType.classList.remove('selected-game-type');
            gameType.style.backgroundColor = "#DBDBDB";
        });

        // 클릭한 요소에만 selected-game-type 클래스 추가 및 색상 변경
        element.classList.add('selected-game-type');
        element.style.backgroundColor = "#46675C"; // 선택시 색상 변경

        // 로컬 스토리지에 선택한 종목 저장
        var selectedGameType = element.getAttribute('data-game-type');
        gameType = selectedGameType;
        localStorage.removeItem("gameType");
        localStorage.setItem("gameType", selectedGameType);
        console.log(localStorage.getItem("gameType"))

        updateGameTypeNum(selectedGameType);
    };

    function updateGameTypeNum(gameType) {
        var gameTypeNumDiv = document.querySelector('.game-type-num');
        gameTypeNumDiv.innerHTML = ''; // 기존에 있는 요소 제거

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

        }

        gameFormats.forEach(function (format) {
            var div = document.createElement('div');
            div.textContent = format;
            div.className = 'game-format-option';
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


    saveButton.addEventListener('click', toggleEdit);

    // 팀원 검색
    $(document).ready(function () {
        var memberSearchInput = $('#memberSearchInput');
        var searchResultsDropdown = $('.search-results-dropdown');


        function searchMemberByName(memberName) {
            $.ajax({
                url: 'https://www.h-club.site/comp/member?memberName=' + encodeURIComponent(memberName),
                type: 'GET',
                dataType: 'json',
                success: function (response) {

                    searchResultsDropdown.empty();
                    let memberList = response.data.memberList;


                    if (memberList && memberList.length > 0) {
                        searchResultsDropdown.show();
                        memberList.forEach(function (member) {
                            var memberItem = $('<div class="search-result-item"></div>');

                            var nameSpan = $('<span></span>').text(member.memberName).css('margin-right', '10px');
                            var deptSpan = $('<span></span>').text(member.memberDept).css('margin-right', '5px');
                            var positionSpan = $('<span></span>').text(member.memberPosition);

                            memberItem.append(nameSpan, deptSpan, positionSpan);
                            searchResultsDropdown.append(memberItem);

                            memberItem.on('click', function () {
                                memberSearchInput.val(member.memberName);
                                searchResultsDropdown.empty().hide();
                                saveSelectedMemberToLocalStorage(member);
                                memberSearchInput.val('');
                            });
                        });
                    } else {

                        searchResultsDropdown.hide();
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching members:", error);
                    searchResultsDropdown.empty().append('<div class="search-result-item">에러</div>').show();
                }
            });
        }

        // 선택한 인원 로컬 스토리지에 저장
        function saveSelectedMemberToLocalStorage(member) {

            var selectedMembers = localStorage.getItem('selectedMembers') ? JSON.parse(localStorage.getItem('selectedMembers')) : [];


            selectedMembers.push(member);

            localStorage.setItem('selectedMembers', JSON.stringify(selectedMembers));


            updateTeamMateListUI();
        }

        function updateTeamMateListUI() {
            const teamMateList = document.getElementById('teamMateList');
            teamMateList.innerHTML = '';


            var selectedMembers = localStorage.getItem('selectedMembers') ? JSON.parse(localStorage.getItem('selectedMembers')) : [];


            selectedMembers.forEach((member, index) => {
                const li = document.createElement('li');


                li.textContent = member.memberName + ' ' + member.memberDept + ' ' + member.memberPosition;


                const removeImg = document.createElement('img');
                removeImg.src = '/resources/image/comp/member-cancel.png';
                removeImg.alt = 'Remove';
                removeImg.style.cursor = 'pointer';
                removeImg.style.marginLeft = '30px';


                removeImg.style.width = '50px';
                removeImg.style.height = '50px';


                removeImg.onclick = function () {
                    removeTeamMember(index);
                };


                li.appendChild(removeImg);

                teamMateList.appendChild(li);
            });
        }

        function removeTeamMember(index) {

            var selectedMembers = JSON.parse(localStorage.getItem('selectedMembers'));

            selectedMembers.splice(index, 1);

            localStorage.setItem('selectedMembers', JSON.stringify(selectedMembers));

            updateTeamMateListUI();
        }

        $(document).ready(function () {

            updateTeamMateListUI();
        });


        memberSearchInput.focus(function () {
            if (searchResultsDropdown.children().length > 0) {
                searchResultsDropdown.show();
            }
        });


        $(document).click(function () {
            searchResultsDropdown.hide();
        });
        memberSearchInput.click(function (event) {
            event.stopPropagation();
        });
        searchResultsDropdown.click(function (event) {
            event.stopPropagation();
        });


        memberSearchInput.on('input', function () {
            var memberName = $(this).val();
            if (memberName.length > 1) {
                searchMemberByName(memberName);
            } else {
                searchResultsDropdown.empty().hide();
            }
        });
    });

    // 파일 업로드
    let plusButton = document.querySelector('.plus-button');
    let fileInput = document.getElementById('fileInput');
    let imageUploadContainer = document.querySelector('.image-upload-container');

    plusButton.addEventListener('click', function () {
        fileInput.click();
    });
    fileInput.addEventListener('change', function () {
        if (this.files && this.files[0]) {
            const reader = new FileReader();
            reader.onload = function (e) {
                try {
                    let imgDataUrl = e.target.result;
                    plusButton.style.display = 'none';
                    console.log(e.target)
                    let img = document.createElement("img");
                    img.setAttribute("src", imgDataUrl);
                    img.style.width = "500px";
                    img.style.height = "500px";
                    img.style.border = "none";
                    img.style.objectFit = "cover";
                    img.style.borderRadius = "40%";

                    imageUploadContainer.appendChild(img);

                    localStorage.setItem('multipartFile', imgDataUrl);
                    console.log("Image saved to localStorage.");
                } catch (error) {
                    if (e === QUOTA_EXCEEDED_ERR) {
                        alert("Error: Local Storage limit exceeds.");
                    } else {
                        console.log("Error saving image to localStorage.", e);
                    }
                }

            };
            reader.readAsDataURL(this.files[0]);
        }
    });


    fileInput.addEventListener('change', function () {
        var files = fileInput.files;

        console.log(files);
    });


});

// 장소 저장
$(document).ready(function () {

    $('#goNextButton').click(function () {

        var locationInputValue = $('#locationSearchInput').val();


        localStorage.setItem('teamLoc', locationInputValue);

    });

});
// 이전
document.addEventListener('DOMContentLoaded', function () {
    const goBackButton = document.getElementById('goBackButton');
    goBackButton.addEventListener('click', function () {
        window.history.back();
    });
});
// 다음 페이지 이동
document.addEventListener('DOMContentLoaded', function () {
    const goNextButton = document.getElementById('goNextButton');
    goNextButton.addEventListener('click', function () {
        // 기존의 검증 로직 유지
        var teamName = localStorage.getItem('teamName');
        var selectedGameType = localStorage.getItem('gameType');
        var multipartFile = localStorage.getItem('multipartFile');
        var selectedMembers = JSON.parse(localStorage.getItem('selectedMembers')) || [];
        var selectedGameTypeNum = localStorage.getItem('selectedGameTypeNum');

        // 입력값 검증 & 필수 요소 확인
        if (!selectedGameType) {
            alert('게임 종목을 선택해주세요');
            return;
        }
        if (!teamName) {
            alert('팀 이름을 입력해주세요');
            return;
        }

        if (!multipartFile) {
            alert('팀 사진을 넣어주세요');
            return;
        }
        if (!selectedGameTypeNum) {
            alert('참여 인원을 선택해주세요')
            return;
        }
        if (selectedMembers.at(0).memberName != localStorage.getItem("name")) {
            alert('팀장은 본인을 선택해야합니다');
            return;
        }
        // 선택된 멤버 수와 게임 유형 수 확인
        if (selectedMembers.length != selectedGameTypeNum) {
            alert('팀원을 ' + selectedGameTypeNum + '명 선택해주세요');
            return;
        }


        // 모든 조건이 충족됐다면 다음 페이지 이동
        window.location.href = '/competition/create/2';
    });
});