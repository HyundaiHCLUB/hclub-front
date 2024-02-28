<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/compCreateTeamTwo.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
    <div class="select-product-container">
        <p>상품</p>
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
</script>

</body>
</html>
