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
        .detail-title {
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 2em;
            font-weight: bold;
            margin: 0 auto;
        }
        .detail-title i {
            font-size: 50px;
            padding: 0 20px;
            color: gold;
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
            box-shadow: 0 2px 15px rgba(0,0,0,0.2);
            background-color: white;
            border-radius: 20px;
            padding: 20px;
            height: 25%;
            width: 70%;
            position: relative;
            overflow: hidden;
        }
        .match-image img {
            /* 이미지가 div를 가득 채우도록 하되, 비율이 유지되도록 설정 */
            /*max-height: 100%; !* 최대 높이는 div의 100%까지만 *!*/
            width: 100%;      /* 너비는 자동으로 설정되도록 하여 비율 유지 */
            /*height: auto;     !* 높이도 자동으로 설정되도록 하여 비율 유지 *!*/
            object-fit: cover; /* 이미지가 div에 꽉 차게 하면서도 비율이 유지되도록 */
            object-position: center; /* 이미지가 div 중앙에 위치하도록 설정 */
        }
        /*.match-image:before {*/
        /*    content: '';*/
        /*    display: block;*/
        /*    padding-top: 100%; !* 1:1 Aspect Ratio *!*/
        /*}*/
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
            width: 200px;
            height: 150px;
            margin: 20px auto 0 auto;
            border: 2px solid #ddd;
            border-radius: 15px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            text-align: center;
            font-size: 2em;
            font-weight: bold;
        }
        .score-separator {
            align-self: center; /* 수직 중앙 정렬 */
            font-size: 3em; /* ":" 크기 조정 */
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
        .match-notice {
            font-size: 2.5em;
            margin: 0 auto;
            text-align: center;
        }

    </style>
</head>
<body>
<div id="wrapper">
    <main>
        <div class="detail-title">
            <i class="fa-solid fa-trophy"></i>
            <h1>경기 결과 입력</h1>
            <i class="fa-solid fa-trophy"></i><br/>
        </div>
        <div class="match-notice">
            <span>경기는 즐거우셨나요?</span><br/>
            <span>경기 진행 후 결과를 입력해주세요!</span>
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
            <p class="match-notice"> ▼ 사진을 등록해주세요 ▼</p>
            <div class="match-image" onclick="triggerUpload()">
                <img id="preview-img" style="display: none"/>
                <button class="add-button">+</button>
                <input type="file" id="fileUpload" style="display:none;" onchange="handleFiles(this.files)">
            </div>
        <button class="end-match-button">경기 종료</button>
    </main>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery CDN -->
<script>
    console.log("matchHistoryNo from controller : " + ${matchHistoryNo})
    var team1No;
    var team2No;
    var matchLoc;
    $(document).ready(function() {
        $.ajax({
            url: 'https://www.h-club.site/comp/match/${matchHistoryNo}', //샘플데이터
            type: 'GET',
            dataType: 'json',
            success: function (response){
                matchHistorytNo = response.data.matchHistoryNo;
                console.log(response);
                // 팀 정보 업데이트
                team1No = response.data.team1.teamNo;
                team2No = response.data.team2.teamNo;
                matchLoc = response.data.team1.matchLoc;
                $('.team').eq(0).find('img').attr('src', response.data.team1.teamImage);
                $('.team').eq(0).find('h4').text(response.data.team1.teamName);
                $('.team').eq(1).find('img').attr('src', response.data.team2.teamImage);
                $('.team').eq(1).find('h4').text(response.data.team2.teamName);
            }, error: function (error){
                console.log('Error : ' + error);
            }
        });
        $('.end-match-button').click(function() { // 경기종료버튼 리스너 등록
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
                matchHistNo: 13,
                matchLoc : matchLoc,
                teamANo : team1No,
                scoreA : scoreValueTeam1,
                teamBNo : team1No,
                scoreB : scoreValueTeam2
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
            // 여기에 점수 비교 로직 추가
            if (scoreTeam1 < scoreTeam2) {
                // 팀1의 점수가 팀2의 점수보다 작으면 loseTeamResult.jsp로 리다이렉트
                window.location.href = '${path}/competition/loseTeam/${matchHistoryNo}';
                return; // 추가된 부분
            }
        });
    });

    function triggerUpload() {
        document.getElementById('fileUpload').click();
    }
    function handleFiles(files) {
        var preview = document.getElementById('preview-img');
        if (files.length > 0) {
            var file = files[0];
            var reader = new FileReader();

            reader.onload = function (e) {
                preview.src = e.target.result;
                preview.style.display = 'block'; // 이미지를 보여줍니다.
                $('#preview-img').attr('src', e.target.result).show();
                $('.add-button').hide(); // 추가 버튼 숨김
                $('.match-image').css('border', 'none'); // match-image 테두리 제거
            };

            reader.readAsDataURL(file);
            console.log(files[0].name);
        } else {
            console.log("No files selected.");
            preview.style.display = 'none';
        }
    }
    document.getElementById('fileUpload').addEventListener('change', function() {
        handleFiles(this.files);
    });
</script>
</html>