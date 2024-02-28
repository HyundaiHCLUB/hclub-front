<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/compCreateTeamTwo.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- jQuery -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <!-- -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>CreateTeam2</title>
</head>
<body>
<main>
    <div class="team-caption-container">
        <div class="team-caption-image">
            <img src="/resources/image/comp/soccer.png" alt="">
        </div>
        <div class="team-captain-name">

            <p>김동욱</p>
            <div class="captain-caption">
                <img src="/resources/image/comp/star.png" alt="">
                <p>팀장</p>
            </div>
        </div>
    </div>

    <div class="team-border-line">

    </div>
    <div class="select-match-date-container">
        <p>날짜</p>
        <div class="select-match-date">
            <input id="dateSelectInput" type="text" placeholder="날짜를 선택해주세요"/>


        </div>


    </div>
    <div class="select-match-time-container">
        <p>시간</p>
        <div class="select-match-time">
            <input id="timeSelectInput" type="text" placeholder="시간을 선택해주세요"/>
        </div>
    </div>
    <div class="select-product-container">
        <p>상품</p>
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
    document.addEventListener("DOMContentLoaded", function () {
        // Define the URL to fetch from
        const apiUrl = 'https://www.h-club.site/comp/products';

        // Use fetch API to get the products
        fetch(apiUrl)
            .then(response => response.json()) // Convert the response to JSON
            .then(data => {
                console.log(data);
                const container = document.querySelector('.select-product-container');

                // Loop through the data and create a radio button for each product
                data.data.forEach(product => {
                    console.log(product);

                    // Create radio input
                    const radioInput = document.createElement('input');
                    radioInput.setAttribute('type', 'radio');
                    radioInput.setAttribute('name', 'product');
                    radioInput.setAttribute('value', product.productId); // Assuming the response has a 'productId' field
                    radioInput.setAttribute('id', `product-${product.productId}`);

                    // Create label for radio input
                    const label = document.createElement('label');
                    label.setAttribute('for', `product-${product.productId}`);
                    label.textContent = product.productName; // Adjust according to the actual response structure

                    // Append the radio input and label to the container
                    container.appendChild(radioInput);
                    container.appendChild(label);
                });
            })
            .catch(error => console.error('Error fetching products:', error));
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
            window.location.href = '/competition/create/3';
        });
    });


    // DatePicker & Timepicker
    $('.datepicker')
        .datepicker({
            dateFormat: 'yy-mm-dd'//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
        })
        .on('changeDate', function (e) {
            console.log(e);
            // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시) 위와 같은 형태로 보인다.
        });

    $('.timepicker')
        .timepicker({
            timeFormat: 'HH:mm',
            interval: 10,
            minTime: '10',
            maxTime: '6:00pm',
            defaultTime: '11',
            startTime: '10:00',
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });


    $(document).ready(function () {
        // Initialize the datepicker on #dateSelectInput
        $('#dateSelectInput').datepicker({
            dateFormat: 'yy년 mm월 dd일', // Set the format of the date
            onSelect: function (dateText) {
                // Update the input value to the selected date
                $('#dateSelectInput').val(dateText);
            }
        });

        // Optional: Initialize the timepicker on #timeSelectInput if you added it
        $('#timeSelectInput').timepicker({
            timeFormat: 'HH시 mm분',
            interval: 30, // Adjust the time interval options
            minTime: '10:00am', // Set minimum time limit
            maxTime: '10:00pm', // Set maximum time limit
            startTime: '10:00am', // Set start time for the timepicker
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });
    });

</script>

</body>
</html>
