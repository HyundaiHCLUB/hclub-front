// 경쟁 - 현재 진행 중인 경기종목 조건별로 리스트 가져오기 (초기 request)
$(document).ready(function () {

    function fetchDataAndCreateMatches() {
        $.ajax({
            url: "https://www.h-club.site/comp/list",
            method: "GET",
            success: function (response) {
                if (response.success) {
                    var data = response.data;

                    $(".matches").empty();

                    data.forEach(function (item) {
                        var matchHTML =
                            '<div class="rounded-shape" onclick="navigateToTeamDetail(\'' + item.teamNo + '\')">' +
                            '<div class="left-section">' +
                            '<img src="' + item.matchType + '" alt="" />' +
                            '<p>' + item.teamCapacity + '</p>' +
                            '</div>' +
                            '<div class="middle-section">' +
                            '<div class="middle-section-up">' +
                            '<p>' + item.teamName + '</p>' +
                            '</div>' +
                            '<div class="middle-section-down">' +
                            '<p>' + item.teamLoc + '</p>' +
                            '<p style="color: #717070">' + item.teamRating + '점</p>' +
                            '</div>' +
                            '</div>' +
                            '<div class="right-section">' +
                            '<p>' + item.matchAt + '</p>' +
                            '</div>' +
                            '</div>';

                        $(".matches").append(matchHTML);

                    });


                } else {
                    console.error("Error:", response.message);
                }
            },
            error: function (xhr, status, error) {
                console.error("데이터 통신에 실패하였습니다.:", error);
            }
        });
    }


    fetchDataAndCreateMatches();

    document.querySelector('.sport-select').addEventListener('change', function () {
        var matchTypeSelect = document.querySelector('.match-type-select');
        // 이전에 있던 인원 선택 옵션 제거
        matchTypeSelect.innerHTML = '<option value="">인원 선택</option>';

        // 종목 마다 다른 label 부여
        if (this.value === 'SOCCER') {
            let options = ['3 vs 3', '5 vs 5', '6 vs 6', '11 vs 11'];
            let values = [3, 5, 6, 11];
            options.forEach(function (option, index) {
                var newOption = document.createElement('option');
                newOption.value = values[index];
                newOption.text = option;
                matchTypeSelect.appendChild(newOption);
            });
        }
        if (this.value === 'BASKETBALL') {
            let options = ['1 vs 1', '2 vs 2', '3 vs 3', '5 vs 5'];
            let values = [1, 2, 3, 5];
            options.forEach(function (option, index) {
                var newOption = document.createElement('option');
                newOption.value = values[index];
                newOption.text = option;
                matchTypeSelect.appendChild(newOption);
            });
        }

        if (this.value === 'BOWLING') {
            let options = ['1 vs 1', '2 vs 2', '3 vs 3', '4 vs 4'];
            let values = [1, 2, 3, 4];
            options.forEach(function (option, index) {
                var newOption = document.createElement('option');
                newOption.value = values[index];
                newOption.text = option;
                matchTypeSelect.appendChild(newOption);
            });
        }

        if (this.value === 'DART') {
            let options = ['1 vs 1', '2 vs 2', '3 vs 3', '4 vs 4'];
            let values = [1, 2, 3, 4];
            options.forEach(function (option, index) {
                var newOption = document.createElement('option');
                newOption.value = values[index];
                newOption.text = option;
                matchTypeSelect.appendChild(newOption);
            });
        }
    });


});


// 날짜 선택 label 생성
document.addEventListener('DOMContentLoaded', function () {

    const dateSelect = document.querySelector('.date-select');
    const today = new Date();
    let noSelectionOption = new Option("날짜 선택", "");
    dateSelect.add(noSelectionOption);

    addDateOption(today, dateSelect);
    for (let i = 1; i <= 30; i++) {
        const dateOption = new Date(today);
        dateOption.setDate(today.getDate() + i);
        addDateOption(dateOption, dateSelect);
    }
});

function addDateOption(date, selectElement) {
    const dateStr = formatDate(date);
    const option = new Option(dateStr, dateStr);
    selectElement.add(option);
}

function formatDate(date) {
    let day = date.getDate();
    let month = date.getMonth() + 1;
    const year = date.getFullYear();


    day = day < 10 ? '0' + day : day;
    month = month < 10 ? '0' + month : month;


    return month + '월 ' + day + '일';
}

$(document).ready(function () {

    let teamCreateButton = document.querySelector('.add-button');
    teamCreateButton.addEventListener('click', function () {
        localStorage.setItem('initCreate', 'Y');
        window.location.href = "/competition/create/1";
    })
    const sportSelect = $('.sport-select');
    const dateSelect = $('.date-select');
    const matchTypeSelect = $('.match-type-select');
    const orderSelect = $('.order-select');
    const searchInput = $('.search-input');
    const searchIcon = $('.search-icon');

    function parseDate(dateStr) {
        const currentYear = new Date().getFullYear();
        const parts = dateStr.match(/(\d+)월 (\d+)일/);
        if (parts) {
            return currentYear + '/' + parts[1].padStart(2, '0') + '/' + parts[2].padStart(2, '0');
        }
        return '';
    }

    // 경쟁 - 현재 진행 중인 경기종목 조건별로 리스트 가져오기
    function fetchDataAndCreateMatches(gameType, date, players, order, keyword) {
        let requestUrl = 'https://www.h-club.site/comp/list?gameType=' + gameType + '&date=' + date + '&players=' + players + '&sortOption=' + order + '&keyword=' + keyword;

        $.ajax({
            url: requestUrl,
            method: "GET",
            success: function (response) {
                if (response.success) {
                    var data = response.data;

                    $(".matches").empty();

                    data.forEach(function (item) {
                        var matchHTML =
                            '<div class="rounded-shape" onclick="navigateToTeamDetail(\'' + item.teamNo + '\')">' +
                            '<div class="left-section">' +
                            '<img src="' + item.matchType + '" alt="" />' +
                            '<p>' + item.teamCapacity + '</p>' +
                            '</div>' +
                            '<div class="middle-section">' +
                            '<div class="middle-section-up">' +
                            '<p>' + item.teamName + '</p>' +
                            '</div>' +
                            '<div class="middle-section-down">' +
                            '<p>' + item.teamLoc + '</p>' +

                            '<p style="color: #717070">' + item.teamRating + '점</p>' +
                            '</div>' +
                            '</div>' +
                            '<div class="right-section">' +
                            '<p>' + item.matchAt + '</p>' +
                            '</div>' +
                            '</div>';

                        $(".matches").append(matchHTML);
                    });
                } else {
                    console.error("Error:", response.message);
                }
            },
            error: function (xhr, status, error) {
                console.error("Error fetching data:", error);
            }
        });
    }

    // 맨 처음 경쟁 리스트 보여주기
    fetchDataAndCreateMatches('', '', '', '', '');


    searchIcon.click(function () {
        let selectedGameType = sportSelect.val();
        let selectedDate = parseDate(dateSelect.val());
        let selectedPlayers = matchTypeSelect.val();
        let selectedOrder = orderSelect.val();
        let searchKeyword = encodeURIComponent(searchInput.val());

        fetchDataAndCreateMatches(selectedGameType, selectedDate, selectedPlayers, selectedOrder, searchKeyword);
    });
});


// 페이지 이동 함수들
function navigateToCompetition() {
    window.location.href = "/competition";
}

function navigateToTodayRanking() {
    window.location.href = "/home/todayRanking";
}

function navigateToTeamDetail(teamNo) {
    window.location.href = "/competition/teamDetail/" + teamNo;
}

