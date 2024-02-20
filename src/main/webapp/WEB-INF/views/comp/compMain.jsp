<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>H-Club</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<body>
<main>
    <div class="matches">
        <!-- Content will be dynamically added here -->

    </div>
    <div class="add-button">
        <img src="/resources/image/AddButton.png">
    </div>

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
                            var matchHTML = '<div class="rounded-shape">' +
                                '<p>Team Name: ' + item.teamName + '</p>' +
                                '<p>Location: ' + item.teamLoc + '</p>' +
                                '<p>Match Type: ' + item.matchType + '</p>' +
                                '<p>Match At: ' + item.matchAt + '</p>' +
                                '<p>Team Goods: ' + item.teamGoods + '</p>' +
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
