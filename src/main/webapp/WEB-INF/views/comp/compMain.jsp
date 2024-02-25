<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>H-Club</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/comp.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
<body>
<main>


    <div class="comp-select">
        <a href="/competition">
            <div class="comp-select-container">
                <p style="color: #46675c">목록</p>

            </div>
        </a>
        <a href="/home/todayRanking">
            <div class="comp-select-container">
                <p>랭킹</p>
            </div>
        </a>
    </div>
    <div class="half-screen-line"></div>
    <div class="custom-select-container">
        <select class="sport-select">
            <option value="soccer">축구</option>
            <option value="basketball">농구</option>
            <option value="bowling">볼링</option>
            <option value="dart">다트</option> <!-- option3이 중복되어 있어서 수정함 -->
        </select>

        <!-- 추가된 custom-select 2개 -->
        <select class="date-select">

        </select>

        <select class="match-type-select">
            <option value="">인원 선택</option>
            <option value="3">3 vs 3</option>
            <option value="5">5 vs 5</option>
            <option value="6">6 vs 6</option>
            <option value="11">11 vs 11</option>
        </select>
    </div>

    <div class="custom-search-container">
        <select class="order-select">
            <option value="dates">시간순</option>
            <option value="rating">레이팅순</option>

        </select>
        <input type="text" class="search-input" placeholder="팀명으로 검색해보세요">
        <img src="/resources/image/comp/magnifying_glass.png" alt="Search Icon" class="search-icon">
    </div>

    <div class="matches">
        <!-- Content will be dynamically added here -->

    </div>
    <a href="/competition/create" class="add-button">
        <div class="add-button">
            <svg width="80" height="80" viewBox="0 0 42 42" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="21" cy="21" r="20.25" fill="#46675C"/>
                <path d="M21 12L21 30" stroke="white" stroke-width="1.2" stroke-linecap="round"/>
                <path d="M30 21L12 21" stroke="white" stroke-width="1.2" stroke-linecap="round"/>
            </svg>
        </div>
    </a>
</main>
</body>
<script>
    $(document).ready(function () {
        // Function to fetch data and create matches
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
                                '<div class="rounded-shape">' +
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

                                '<p style="color: #717070">' + 'Rating \: ' + item.teamRating + '점' + '</p>' +
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


        // Call the function when the document is ready
        fetchDataAndCreateMatches();
    });
</script>
<script>
    document.querySelector('.sport-select').addEventListener('change', function () {
        var matchTypeSelect = document.querySelector('.match-type-select');
        // 먼저, 이전에 추가된 옵션을 모두 제거합니다.
        matchTypeSelect.innerHTML = '<option value="">인원 선택</option>';

        // '볼링'이 선택된 경우, 새로운 옵션을 추가합니다.
        if (this.value === 'soccer') {
            var options = ['3 vs 3', '5 vs 5', '6 vs 6', '11 vs 11'];
            options.forEach(function (option) {
                var newOption = document.createElement('option');
                newOption.value = option;
                newOption.text = option;
                matchTypeSelect.appendChild(newOption);
            });
        }
        if (this.value === 'basketball') {
            var options = ['1 vs 1', '2 vs 2', '3 vs 3', '5 vs 5'];
            options.forEach(function (option) {
                var newOption = document.createElement('option');
                newOption.value = option;
                newOption.text = option;
                matchTypeSelect.appendChild(newOption);
            });
        }
        if (this.value === 'bowling') {
            var options = ['1 vs 1', '2 vs 2', '3 vs 3', '4 vs 4'];
            options.forEach(function (option) {
                var newOption = document.createElement('option');
                newOption.value = option;
                newOption.text = option;
                matchTypeSelect.appendChild(newOption);
            });
        }
        if (this.value === 'dart') {
            var options = ['1 vs 1', '2 vs 2', '3 vs 3', '4 vs 4'];
            options.forEach(function (option) {
                var newOption = document.createElement('option');
                newOption.value = option;
                newOption.text = option;
                matchTypeSelect.appendChild(newOption);
            });
        }
    });
    document.addEventListener('DOMContentLoaded', function () {
        // 'class' 속성을 사용하여 셀렉트 박스를 선택합니다.
        const dateSelect = document.querySelector('.date-select');
        const today = new Date();
        const dayInMillis = 24 * 60 * 60 * 1000; // 하루를 밀리초로 변환
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


</script>
</html>
