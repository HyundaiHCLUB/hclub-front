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
        <div class="comp-select-container">
            <p>매칭</p>
        </div>

        <div class="comp-select-container">
            <p>목록</p>
        </div>
        <div class="comp-select-container">
            <p>랭킹</p>
        </div>
    </div>
    <select class="custom-select">
        <option value="option1">축구</option>
        <option value="option2">농구</option>
        <option value="option3">볼링</option>
        <option value="option3">다트</option>
    </select>


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
                        // Clear previous matches
                        $(".matches").empty();
                        // Create matches based on data
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
                                '<p style="color: #717070">' + 'Rating \: ' + item.teamRating + '</p>' +
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
</html>
