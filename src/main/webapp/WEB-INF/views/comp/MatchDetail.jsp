<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link rel="stylesheet" href="${path}/resources/css/main.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>메인 페이지</title>
    <style>
        #wrapper {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: #ffffff;
        }

        .match-detail {
            border: solid 2px #668C4A;
            border-radius: 30px;
            padding: 20px;
            display: flex;
            justify-content: space-around;
            align-items: center; /* Align items vertically */
            width: 70%;
            height: 100%;
            margin: 20px 0; /* 상단과 하단에 마진 추가 */
        }
        .team {
            text-align: center;
            flex: 1; /* Flex grow to take available space */
        }
        .team img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin: 20px auto;
        }
        .team p {
            margin: 5px 10px;
            font-size: 16px;
        }
        .vs {
            flex: 0;
            padding: 0 20px;
            color: blue;
            font-size: 20px;
            font-weight: bold;
        }
        .chat-button{
            color: white; /* 버튼 글자색 변경 */
            border: none; /* 버튼 테두리 제거 */
            background: #668C4A;
            padding: 15px;
            width: calc(90% - 60px);
            border-radius: 25px;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
            margin: 20px auto;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: block;
        }
        .team-detail h5 {
            color: black; /* 글자색 */
            padding: 5px 10px; /* 상하좌우 패딩 */
            border-style: solid;
            border-color: black;
            border-radius: 10px; /* 둥근 모서리 */
            display: inline-block; /* 인라인 블록 요소로 만들기 */
            margin: 20px auto 20px auto; /* 기본 마진 제거 */
        }
        .btn-match-start{
            border-style: none;
            border-radius: 10px;
            background: #EF7353;
            color: white;
            width: fit-content;
            font-weight: bold;
            margin-left: auto; /* 버튼을 오른쪽으로 밀기 */
            margin-right: 35px;
            padding: 15px;
        }
        .btn-team-detail {
            background: #e7e7e7;
            color: #333;
            border: none;
        }
        .detail-title {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .crown-icon {
            color: gold;
            margin : 0 5px;
        }

    </style>
    
</head>
<body>
<main>
<div id="wrapper">
            <div class="detail-title">
                <i class="fas fa-crown crown-icon"></i>
                    <h1>경기 상세정보</h1>
                <i class="fas fa-crown crown-icon"></i>
            </div>
            <div class="match-detail">
                <div class="team">
                    <img src="/resources/image/team_logo_sample_1.png" alt="팀 로고"/>
                    <h5>한반두</h5>
                    <div class="team-detail">
                        <h5>팀장</h5>
                        <p>호날두</p>
                    </div>
                    <div class="team-detail">
                        <h5>장소</h5>
                        <p>서울특별시 강남구 00로 00길</p>
                    </div>
                    <div class="team-detail">
                        <h5>상품</h5>
                        <p>H-cafe 5000원 상품권</p>
                    </div>
                    <div class="team-detail">
                        <h5>팀 레이팅</h5>
                        <p>1500</p>
                    </div>
                    <button class="btn-team-detail">상세정보</button>
                </div>
                <div class="vs">
                    <h3>VS</h3>
                </div>
                <div class="team">
                    <img src="/resources/image/team_logo_sample_2.png" alt="팀 로고"/>
                    <h5>장한평핫스퍼</h5>
                    <div class="team-detail">
                        <h5>팀장</h5>
                        <p>손흥민</p>
                    </div>
                    <div class="team-detail">
                        <h5>장소</h5>
                        <p>장한평 농구장</p>
                    </div>
                    <div class="team-detail">
                        <h5>상품</h5>
                        <p>H-cafe 10000원 상품권</p>
                    </div>
                    <div class="team-detail">
                        <h5>팀 레이팅</h5>
                        <p>1400</p>
                    </div>
                    <button class="btn-team-detail">상세정보</button>
                </div>
            </div>
            <button class="chat-button">채팅하기</button>
            <button class="btn-match-start">경기시작</button>
    </div>
</main>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery CDN -->
<script>
    $(document).ready(function() {
        $('.btn-match-start').click(function(e) {
            e.preventDefault();
            window.location.href = "${path}/comp/matchRecord";
        });

        $.ajax({
            url: 'https://www.h-club.site/comp/match/13', //샘플데이터
            type: 'GET',
            dataType: 'json',
            success: function (response){
                console.log(response);
            }, error: function (error){
                console.log('Error : ' + error);
            }
        });
    });
</script>

</html>