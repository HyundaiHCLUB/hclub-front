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
    <style>
        body {
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
            background: #ffffff;
        }
        #wrapper {
            display: flex;
            flex-direction: column;
            height: 100vh;
        }
        header {
            /* 헤더 스타일 */
        }
        main {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
        }
        .team-icons {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            margin-top: 0;
            font-size: 2em;
            font-weight: bold;
        }
        .team-icons img {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            object-fit: cover; /* 이미지 비율을 유지하면서 요소에 맞게 조정 */
        }
        .team-icons div {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .team-icons h4 {
            margin-top: 5px;
        }
        .team, .score-separator {
            flex: 1; /* 각 요소가 동일한 공간을 차지하도록 설정 */
            display: flex;
            justify-content: center; /* 내부 내용을 중앙으로 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
        }

        .score-separator {
            flex: 0; /* ':' 기호는 공간을 차지하지 않도록 설정 */
            margin: 0 10px; /* 좌우 여백 조정 */
            font-size: 2em;
            font-weight: bold;
        }
        .match-image {
            border-style: solid;
            border-width: 1px;
            border-color: black;
            background-color: white;
            border-radius: 20px;
            padding: 20px;
            width: 90%;
            position: relative;
        }
        .match-image:before {
            content: '';
            display: block;
            padding-top: 100%; /* 1:1 Aspect Ratio */
        }
        .add-button {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #c3ea6d;
            border: black;
            border-radius: 50%;
            width: 200px;
            height: 200px;
            line-height: 60px;
            text-align: center;
            font-size: 100px;
            color: #000;
        }
        .end-match-button {
            background-color: #F86A6A;
            color: #fff;
            border: none;
            border-radius: 20px;
            padding: 30px 100px;
            font-size: 3em;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .score-input {
            width: 300px;
            height: 150px;
            margin: 0 auto;
            border-radius: 30px;
            text-align: center;
            font-size: 2em;
            font-weight: bold;
        }
        .score-separator {
            align-self: center; /* 수직 중앙 정렬 */
            font-size: 30px; /* ":" 크기 조정 */
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .detail-title {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2em;
            margin-top: 100px;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <main>
        <div class="detail-title">
            <h1>경기 결과 기록</h1>
        </div>
            <div class="team-icons">
                <div class="team">
                    <img src="${path}/resources/image/sample.png" alt="팀1 로고"/>
                    <h4>한반두</h4>
                    <input type="number" class="score-input" name="score1"/>
                </div>
                <div class="score-separator">:</div> <!-- 여기에 추가 -->
                <div class="team">
                    <img src="${path}/resources/image/sample2.png" alt="팀2 로고"/>
                    <h4>장한평핫스퍼</h4>
                    <input type="number" class="score-input" name="score2"/>
                </div>
            </div>
            <div class="match-image">
                <button class="add-button">+</button>
            </div>
        <button class="end-match-button">경기 종료</button>
    </main>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery CDN -->
<script>
    $(document).ready(function() {
        $('.end-match-button').click(function() {
            var scoreValueTeam1 = $('input[name="score1"]').val().trim();
            var scoreValueTeam2 = $('input[name="score2"]').val().trim();
            if (scoreValueTeam1 === '' || scoreValueTeam2 === '') {
                alert('모든 점수를 입력해 주세요.');
                return;
            }

            var scoreTeam1 = parseInt(scoreValueTeam1, 10);
            var scoreTeam2 = parseInt(scoreValueTeam2, 10);
            if (isNaN(scoreTeam1) || isNaN(scoreTeam2)) {
                alert('유효한 점수를 입력하세요.');
            }
            // 경기 결과 기록 request dto
            var dataToSend = {
                matchHistNo: 경기번호,
                matchLoc : 경기장소,
                teamANo : 팀1번호,
                scoreA : 팀1점수,
                teamBNo : 팀2번호,
                scoreB : 팀2점수
            };
            // 경기 결과 기록 API 호출 - DB 등록 및 S3 파일 업로드
            $.ajax({
                url: 'https://www.h-club.site/comp/history',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(dataToSend),
                success: function(response) {
                    console.log('Server response:', response);
                },
                error: function(xhr, status, error) {
                    console.error('Error occurred:', error);
                }
            })
        });
    });

</script>
</html>