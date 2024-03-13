<!-- 작성자 : 송원선 -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .wrapper{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            height: 100vh;
        }
        .wrapper img{
            max-width: 100%;
            margin-bottom: 30px;
        }
        .wrapper p {
            font-size: 2.5em;
            font-weight: bold;
        }
        .btn-payment {
            margin-top: 40px; /* 버튼 위의 여백을 추가합니다. */
            padding: 15px 30px; /* 버튼의 내부 여백을 조정합니다. */
            background-color: #efefef; /* 버튼의 배경색을 조정합니다. */
            color: black; /* 버튼의 텍스트 색상을 조정합니다. */
            border: none; /* 테두리를 제거합니다. */
            border-radius: 15px; /* 모서리를 둥글게 합니다. */
            cursor: pointer; /* 마우스를 올렸을 때 커서를 포인터로 변경합니다. */
            font-size: 3em; /* 폰트 크기를 조정합니다. */
        }
    </style>
</head>
<body>
<main>
    <div class="wrapper">
        <img src="/resources/image/comp/draw_heendy.png">
        <p>경기에서 비기셨군요!</p>
        <p>다음엔 더 좋은 결과 있을거에요! </p>
        <input type="button" class="btn-payment" value="경쟁 홈으로" onclick="goCompMain()">
    </div>
</main>
</body>
<script>
    function goCompMain() {
        window.location.href = '/competition';
    }
</script>
</html>
