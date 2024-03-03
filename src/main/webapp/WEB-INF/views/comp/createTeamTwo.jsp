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
            <img src="" alt="">
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
        <div class="products"></div>
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

    // 데이터 로딩
    document.addEventListener('DOMContentLoaded', function () {
        // Retrieve the Base64 image string from localStorage
        let base64ImageData = localStorage.getItem('multipartFile');
        if (base64ImageData) {
            // Find the <img> tag within the .event-image container
            let imageElement = document.querySelector('.team-caption-image img');
            // Set the retrieved Base64 string as the src attribute of the <img> tag
            imageElement.src = base64ImageData;
        }
    });
    document.addEventListener("DOMContentLoaded", function () {
        // Define a global variable to store fetched product data
        let globalProductData = [];
        const apiUrl = 'https://www.h-club.site/comp/products';
        const container = document.querySelector('.products'); // 제품들을 담을 컨테이너

        // Use fetch API to get the products
        fetch(apiUrl)
            .then(response => response.json())
            .then(data => {
                globalProductData = data.data; // Store the fetched data globally

                // Loop through the data and create a div for each product
                data.data.forEach(product => {
                    const productDiv = document.createElement('div'); // 각 제품을 담을 div 생성
                    productDiv.classList.add('product-item'); // CSS 클래스 추가

                    // Create radio input
                    const radioInput = document.createElement('input');
                    radioInput.setAttribute('type', 'radio');
                    radioInput.setAttribute('name', 'product');
                    radioInput.setAttribute('value', product.productId);
                    radioInput.setAttribute('id', `product`);
                    // radioInput.setAttribute('style', '')
                    // Create label for radio input
                    const label = document.createElement('label');
                    label.setAttribute('for', `product` + product.productId);
                    label.textContent = product.productName;

                    // Append the radio input and label to the product div
                    productDiv.appendChild(radioInput);
                    productDiv.appendChild(label);

                    // Append the product div to the products container
                    container.appendChild(productDiv);

                    productDiv.addEventListener('click', function () {
                        radioInput.checked = true; // Set the radio input to checked when the div is clicked
                    });
                });
            })
            .catch(error => console.error('Error fetching products:', error));

        $('#goNextButton').click(function () {
            const selectedDate = $('#dateSelectInput').val();
            const selectedTime = $('#timeSelectInput').val();

            // Retrieve the selected product ID
            const selectedProductId = $('input[name="product"]:checked').val();
            // Find the selected product data by matching the selectedProductId with the product ID in the globalProductData
            const selectedProduct = globalProductData.find(product => product.productId == selectedProductId);

            if (selectedProduct) {
                // Create an object with the product details
                const teamProduct = {
                    productId: selectedProduct.productId,
                    productName: selectedProduct.productName,
                    productPrice: selectedProduct.productPrice // Assuming productPrice is a property of your products
                };

                // Save the product details object as a JSON string in localStorage
                localStorage.setItem('teamProduct', JSON.stringify(teamProduct));
            }

            // Save the match date and time to localStorage
            localStorage.setItem('matchDate', selectedDate);
            localStorage.setItem('matchTime', selectedTime);

            // Optionally, navigate to the next page or perform another action
        });
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

    $('#timeSelectInput').timepicker({
        timeFormat: 'HH:mm', // 24-hour format
        interval: 30, // Interval can be adjusted as needed
        minTime: '00:00', // Minimum time can be adjusted as needed
        maxTime: '23:30', // Maximum time can be adjusted as needed
        defaultTime: '11', // Default time can be adjusted as needed
        startTime: '00:00', // Start time adjusted for 24-hour format
        dynamic: true,
        dropdown: true,
        scrollbar: true
    });


    $(document).ready(function () {
        let inputWidth = $('#dateSelectInput').outerWidth(); // Get the outer width of the dateSelectInput

        // Optionally, calculate a desired height based on the new width
        // This is a simple proportion, adjust according to your needs
        let desiredHeight = inputWidth * 0.8; // Example proportion, adjust as needed

        // Initialize the datepicker on #dateSelectInput
        $('#dateSelectInput').datepicker({
            dateFormat: 'yy년 mm월 dd일', // Set the format of the date
            onSelect: function (dateText) {
                $('#dateSelectInput').val(dateText);
            },
            beforeShow: function (input, inst) {
                let calendar = inst.dpDiv;
                setTimeout(function () {
                    calendar.outerWidth(inputWidth); // Set the width of the datepicker to match the input
                    // Apply dynamic height adjustment here if necessary
                    calendar.outerHeight(500);
                }, 0);
            }
        });

        // Adjustments for timepicker as needed
        $('#timeSelectInput').timepicker({
            // Timepicker configuration
        });
    });


</script>

</body>
</html>
