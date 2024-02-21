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
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            box-sizing: border-box;
        }
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: #ffffff;
        }

        .match-detail {
            display: grid;
            /*align-items: stretch; !* div들의 높이를 같게 만듭니다 *!*/
            grid-template-columns: 1fr auto 1fr; /* 3개의 컬럼, 가운데는 자동 크기 */
            align-items: center; /* 세로 가운데 정렬 */
            gap: 10px; /* 컬럼 사이의 간격 */
            border-radius: 30px;
            padding: 20px;
            padding-top: 50px;
            justify-content: space-around;
            background-color: #F1F5E8;
            width: 80%;
            height: 100%;
            margin: 50px 0; /* 상단과 하단에 마진 추가 */
        }
        .team {
            display: grid;
            grid-template-rows: repeat(6, 1fr);
            gap: 10px;
            text-align: center;
            flex: 1; /* Flex grow to take available space */
            font-size: 2em;
        }
        .team img {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            margin: 20px auto;
        }
        .team p {
            margin: 5px 10px;
            font-size: 1em;
        }
        .vs {
            flex: 0;
            padding: 0 20px;
            color: blue;
            font-size: 32px;
            font-weight: bold;
        }
        .chat-button{
            color: white; /* 버튼 글자색 변경 */
            border: none; /* 버튼 테두리 제거 */
            background: #668C4A;
            padding: 30px;
            width: calc(80% - 60px);
            border-radius: 25px;
            font-size: 36px;
            font-weight: bold;
            cursor: pointer;
            margin: 20px auto;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: block;
        }
        .team-detail h5 {
            background-color: #46675C;
            color: white; /* 글자색 */
            padding: 10px 20px; /* 상하좌우 패딩 */
            font-size: 1em;
            border-style: none;
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
            font-size: 32px;
            font-weight: bold;
            margin-top: 20px;
            margin-left: auto; /* 버튼을 오른쪽으로 밀기 */
            margin-right: 120px;
            padding: 30px;
        }
        .btn-team-detail {
            background: #e7e7e7;
            color: #333;
            margin-top: 50px;
            font-size: 1em;
            border-style: none;
            border-radius: 15px;
            padding: 30px;
        }
        .detail-title {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2em;
        }
        .crown-icon {
            color: gold;
            font-size: 1.5em;
            margin : 0 15px;
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
                    <img src="/resources/image/sample.png" alt="팀 로고"/>
                    <div class="team-detail">
                        <h5>팀명</h5>
                        <p>한반두</p>
                    </div>
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
                    <img src="/resources/image/sample2.png" alt="팀 로고"/>
                    <div class="team-detail">
                        <h5>팀명</h5>
                        <p>장한평핫스퍼</p>
                    </div>
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
            window.location.href = "${path}/competition/matchRecord";
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