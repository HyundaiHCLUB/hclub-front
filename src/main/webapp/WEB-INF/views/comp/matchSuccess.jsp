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
            padding-top: 0px;
            padding-bottom: 0px;
        }

        /*.confirmation-card {*/
        /*    background-color: #ffffff; !* Light green background *!*/
        /*    border-radius: 30px;*/
        /*    width: 70%; !* Adjust width as needed *!*/
        /*    height: 50%;*/
        /*    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); !* Box shadow for a subtle depth effect *!*/
        /*    font-size: 2.5em;*/
        /*}*/

        .confirmation-header {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 50px;
            position: relative;
            background-color: #e8ffe8;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            font-size: 3em;
            height: 50%;
            width: 70%;
        }

       .confirmation-header img {
           width: 180px;
           height: 180px;
           margin : 30px auto;
       }
        .confirmation-message {
            text-align: center;
            color: green;
            font-weight: bold;
            margin-top: 20px;
        }

        .match-name img{
            width: 50px;
            height: 50px;
            margin-right: 20px;
        }

        .confirmation-body h1 {
            margin: 20px 0;
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
        <div class="confirmation-header">
            <img src="/resources/image/comp/comp_check_sample.svg"/>
            <p class="confirmation-message">매칭이 완료되었습니다.</p>
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

        var matchHistoryNo = <%= request.getAttribute("matchHistoryNo") %>;

        // Add a click event listener to the button
        button.addEventListener('click', function() {
            // Navigate to the /competition/matchDetail page
            window.location.href = '/competition/matchDetail/'+matchHistoryNo; // 변수명 혜연쓰와 맞춰야됨
        });
    });
</script>
</html>
