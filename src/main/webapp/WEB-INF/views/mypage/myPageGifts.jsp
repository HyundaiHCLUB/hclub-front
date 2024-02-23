<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>받은 선물함</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/mypage.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/5ba1c6c3a8.js" crossorigin="anonymous"></script> <!-- font awesome icons-->
    <style>
        .product-card {
            display: flex;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            margin: 30px auto;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: 0.3s;
            height: 180px;
            width: 75%;
        }

        .product-image {
            width: auto;
            max-height: 100%;
        }

        .product-details {
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            width: 100%;
        }

        .product-title {
            font-size: 2em;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .product-date {
            font-size: 1em;
            color: #666;
        }

        .product-price {
            font-size: 1.5em;
            color: #333;
            margin-top: 5px;
        }

        .mypage-header i {
            color: #6FC173;
        }
    </style>
</head>
<body>
<main>
    <div class="mypage-top-menu">
        <img src="/resources/image/left-arrow.png"
             onclick="window.history.back()"/>
    </div>
    <div class="mypage-header">
        <i class="fa-solid fa-gift"></i>
        <h1>받은 선물함</h1>
        <i class="fa-solid fa-gift"></i>
    </div>
    <!-- 샘플 데이터 시작 -->
    <div class="product-card">
        <img src="/resources/image/gift_sample.png" alt="Iced Coffee" class="product-image">
        <div class="product-details">
            <div class="product-title">h-cafe 5000원 상품권</div>
            <div class="product-date">발급일: 2023-02-01</div>
            <div class="product-price">5,000원</div>
        </div>
    </div>

    <div class="product-card">
        <img src="/resources/image/gift_sample.png" alt="Iced Coffee" class="product-image">
        <div class="product-details">
            <div class="product-title">h-cafe 5000원 상품권</div>
            <div class="product-date">발급일: 2023-02-01</div>
            <div class="product-price">5,000원</div>
        </div>
    </div>

    <div class="product-card">
        <img src="/resources/image/gift_sample.png" alt="Iced Coffee" class="product-image">
        <div class="product-details">
            <div class="product-title">h-cafe 5000원 상품권</div>
            <div class="product-date">발급일: 2023-02-01</div>
            <div class="product-price">5,000원</div>
        </div>
    </div>

    <div class="product-card">
        <img src="/resources/image/gift_sample.png" alt="Iced Coffee" class="product-image">
        <div class="product-details">
            <div class="product-title">h-cafe 5000원 상품권</div>
            <div class="product-date">발급일: 2023-02-01</div>
            <div class="product-price">5,000원</div>
        </div>
    </div>

    <div class="product-card">
        <img src="/resources/image/gift_sample.png" alt="Iced Coffee" class="product-image">
        <div class="product-details">
            <div class="product-title">h-cafe 5000원 상품권</div>
            <div class="product-date">발급일: 2023-02-01</div>
            <div class="product-price">5,000원</div>
        </div>
    </div>

    <!-- 샘플 데이터 끝-->



</main>
</body>
</html>
