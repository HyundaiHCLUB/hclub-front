<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>지역별 동아리</title>
    <style>
        .section input[id*="slide"] {
            display: none;
        }

        /* 슬라이드 영역 크기 조절 */
        .section {
            display: flex;
            justify-content: center;
        }
        .section .slidewrap {
            max-width: 100vw;
            margin-bottom: 20px;
            margin-top: 13px;
            overflow: hidden;
            /* 영역보다 큰 부분은 자르기 */
        }
        .section .slidelist {
            white-space: nowrap;
            /* 안쪽 인라인 요소 줄바꿈을 없앰 */
            font-size: 0;
            /* 안쪽 공백 없앰 */
        }
        .section .slidelist > li {
            display: inline-block;
            /* 여기가 중요!!list태그로 만든 각 슬라이드 이미지들이 한 줄로 가로 정렬되도록 만든다.
             */
            vertical-align: middle;
            /* 각 이미지들의 높이가 다를 경우,가운데를 기준으로 정렬해 준다 */
            width: 100%;
            /* 슬라이드 영역(이미지가 노출되는 곳)에 딱맞도록 너비를 설정해준다. */
            /* 여기까지 하면, 노출 영역에 딱 맞도록 첫번째 이미지만 보이게 되고, 오른쪽으로 가로로 한 줄정렬되어 있는 다른 이미지는 보이지 않게 된다. */
            transition: all 0.5s;
            /* 0.5초간 서서히 움직인다. */
        }
        .section .slidelist > li > a {
            display: block;
            position: relative;
            /* 이건 왜지? */
        }
        .section .slidelist > li > a img {
            width: 100%;
            /* 이미지 크기를 반응형으로 설정 */
        }

        /* 좌우로 넘기는 label버튼 스타일 지정 */
        .section .slidelist label {
            position: absolute;
            z-index: 1;
            top: 50%;
            transform: translateY(-50%);
            padding: 50px;
            cursor: pointer;
        }
        /* 이것도 다시 살펴보자. */
        .section .slidelist .left {
            left: 0px;
            background: url("/resources/image/left-arrow.png") center center / 50% no-repeat;
        }
        .section .slidelist .right {
            right: 0px;
            background: url("/resources/image/right-arrow.png") center center/50% no-repeat;
        }
        /* input 체크될 경우 변화값이 li까지 전달될 수 있도록 하는 아주 중요한 부분!!!!!! */
        .section input[id="slide01"]:checked ~ .slidewrap .slidelist > li {
            transform: translateX(0%);
        }
        .section input[id="slide02"]:checked ~ .slidewrap .slidelist > li {
            transform: translateX(-105%);
        }
        .section input[id="slide03"]:checked ~ .slidewrap .slidelist > li {
            transform: translateX(-209%);
        }
    </style>
</head>
<body>
<main>
    <div class="navbar_menu">
        <li><a href="/">투데이</a></li>
        <li><a href="/home/hot">인기 동아리</a></li>
        <li><a href="/home/district">지역별 동아리</a></li>
        <li><a href="">내 모임</a></li>
        <li><a href="#">#토너먼트</a></li>
    </div>

    <div class="title">
        <div class="title-item">
            <p class="sub-title">지역별 동아리</p>
        </div>
    </div>

    <div class="district-container">
        <img class="left-district" src="/resources/image/gangnam.png">
        <img class="right-district" src="/resources/image/mapo.png">
    </div>
    <div class="district-container">
        <img class="left-district" src="/resources/image/gangdong.png">
        <img class="right-district" src="/resources/image/junggu.png">
    </div>

    <div class="slidewrap">
    <ul class="slidelist">
        <li>
            <a>
                <label id="slide03" for="slide03" class="left"></label>
                <img src="/resources/image/gangnam.png">
                <label id="slide02" for="slide02" class="right"></label>
                <!-- label을 slide02로 설정했기 때문에,
                  이 right버튼을 누르면 radio버튼의 slide02를 id로 가지는 버튼이 눌린다. -->
            </a>
        </li>
        <li>
            <a>
                <label id="slide01" for="slide01" class="left"></label>
                <img src="/resources/image/gangnam.png">
                <label for="slide03" class="right"></label>
            </a>
        </li>
        <li>
            <a>
                <label for="slide02" class="left"></label>
                <img src="/resources/image/gangnam.png">
                <label for="slide01" class="right"></label>

            </a>
        </li>
    </ul>
    </div>
    </div>
    <div class="title">
        <div class="title-item">
            <p class="sub-title">주목할만한 동아리</p>
        </div>
    </div>
    </div>
</main>
</body>
</html>