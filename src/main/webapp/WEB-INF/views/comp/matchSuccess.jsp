<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/compCreateTeam.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Match Success</title>
    <style>
        main {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding-top: 50px;
            padding-bottom: 50px;
        }

        .confirmation-card {
            background-color: #ffffff; /* Light green background */
            border-radius: 30px;
            width: 70%; /* Adjust width as needed */
            height: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Box shadow for a subtle depth effect */
            font-size: 2.5em;
        }

        .confirmation-header {
            text-align: center;
            padding: 50px;
            position: relative;
            border-bottom: 1px solid black;
            background-color: #e8ffe8;
        }

       .confirmation-header img {
           width: 180px;
           height: 180px;
       }
        .confirmation-message {
            text-align: center;
            color: green;
            font-weight: bold;
            margin-top: 20px;
        }

        .confirmation-body {
            background-color: white;
            text-align: left;
            padding: 20px;
        }

        .match-name {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: left;
        }
        .match-name img{
            width: 50px;
            height: 50px;
            margin-right: 20px;
        }

        .confirmation-body h1 {
            margin: 20px 0;
        }

        .details {
            color: #555; /* Darker text color for contrast */
            margin-bottom: 20px;
        }
        .details-header {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            text-align: left;
            font-size: 1.3em;
        }

        .details-header img {
            width: 50px;
            height: 50px;
            margin: auto 20px;
        }
        .confirmation-footer {
            width: 100%;
            margin-top: 100px;
        }
        .confirmation-button {
            background-color: #46675C; /* Green background */
            color: white;
            border: none;
            padding: 20px 150px;
            margin: 20px auto; /* Centering the button */
            display: block; /* Center button */
            font-size: 3em;
            border-radius: 50px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-transform: uppercase; /* Makes text uppercase */
        }

        .confirmation-button:hover {
            background-color: #367a36; /* Slightly darker green on hover */
        }
    </style>
    </style>
</head>
<body>
<main>
    <div class="confirmation-card">
        <div class="confirmation-header">
            <img src="/resources/image/comp/comp_check_sample.svg"/>
            <p class="confirmation-message">매치가 완료되었습니다.</p>
        </div>
        <div class="confirmation-body">
            <div class="match-name">
                <img src="/resources/image/comp/basketball.png">
                <h1>3대3 농구대회</h1>
            </div>

            <div class="details">
                <div class="details-header">
                    <img src="/resources/image/comp/comp_location.png"/>
                    <p class="detail-icon">장소</p>
                </div>
                <div class="details-content">
                    <p class="detail-title">서울특별시 양천구 목동동로 111 양천공원</p>
                </div>
            </div>

            <div class="details">
                <div class="details-header">
                    <img src="/resources/image/comp/comp_calendar.png"/>
                    <p class="detail-icon">일시</p>
                </div>
                <div class="details-content">
                    <p class="detail-title">2023년 01월 16일 18:30</p>
                </div>
            </div>

        </div>

    </div>
    <div class="confirmation-footer">
        <button class="confirmation-button">경기화면으로</button>
    </div>
</main>
</body>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Select the button by its class name
        var button = document.querySelector('.confirmation-button');

        // Add a click event listener to the button
        button.addEventListener('click', function() {
            // Navigate to the /competition/matchDetail page
            window.location.href = '/competition/matchDetail/13';
        });
    });
</script>
</html>
