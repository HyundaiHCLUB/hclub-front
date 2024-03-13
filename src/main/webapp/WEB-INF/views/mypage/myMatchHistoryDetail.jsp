<!-- 작성자 : 송원선 -->
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
            font-weight: 500;
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
            font-weight: 500;
        }
        .team-icons img {
            width: 280px;
            height: 280px;
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
            font-weight: 500;
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
            height: 100%;     /* 높이도 자동으로 설정되도록 하여 비율 유지 */
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
            background-color: #529863;
            color: #fff;
            border: none;
            border-radius: 20px;
            padding: 30px 100px;
            font-size: 3em;
            font-weight: 500;
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
            font-weight: 500;
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
        .highlighted-team {
            border: 13px solid #ffa500;
            border-radius: 50%;
        }
        .not-highlighted-team {
            border: 13px solid #ffffff;
            border-radius: 50%;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <main>
        <div class="detail-title">
            <i class="fa-solid fa-trophy"></i>
            <h1>경기 결과</h1>
            <i class="fa-solid fa-trophy"></i><br/>
        </div>
        <div class="team-icons">
            <div class="team">
                <img src="" class="team-logo"/>
                <h4>한반두</h4>
                <input type="number" class="score-input" name="score1"/>
            </div>
            <div class="score-separator">:</div> <!-- 여기에 추가 -->
            <div class="team">
                <img src="" class="team-logo"/>
                <h4>장한평핫스퍼</h4>
                <input type="number" class="score-input" name="score2"/>
            </div>
        </div>
        <div class="match-image" onclick="triggerUpload()">
            <img id="preview-img" style="display: none"/>
            <input type="file" id="fileUpload" style="display:none;" onchange="handleFiles(this.files)">
        </div>
        <button class="end-match-button">뒤로가기</button>
    </main>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery CDN -->
<script>
    let accessToken = localStorage.getItem("accessTokenInfo");
    let selectedFile;
    console.log("matchHistoryNo from controller : " + ${matchHistoryNo})
    var memberId;
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

                getUserInfo(accessToken).then(memberInfo => {
                    memberId = memberInfo.member_id;
                    console.log("memberID : " + memberId);
                    // 현재 화면에 접속한 사용자가 속한 팀 번호 알아내기
                    var userTeamNo = memberInfo.teamNo;
                    var configTeamDTO = {
                        team1No : response.data.team1.teamNo,
                        team2No : response.data.team2.teamNo,
                        memberId : memberId
                    };
                    // 두 팀 리더 중 로그인한 사용자가 아닌 다른 사람의 번호를 otherUserNo 에 저장
                    var otherLeader;
                    if(memberInfo.member_id == response.data.team1.leader.memberId) {
                        otherLeader = response.data.team2.leader;
                        localStorage.setItem("currentUserNo", response.data.team1.leader.memberNo);
                    } else if(memberInfo.member_id == response.data.team2.leader.memberId) {
                        otherLeader = response.data.team1.leader;
                        localStorage.setItem("currentUserNo", response.data.team2.leader.memberNo);
                    }
                    if(otherLeader) {
                        localStorage.setItem("otherUserNo", otherLeader.memberNo);
                        localStorage.setItem("otherUserId", otherLeader.memberId);
                    }
                    console.log("--------- otherLeader ------------");
                    console.log(localStorage.getItem("otherUserNo"));
                    console.log(localStorage.getItem("otherUserId"));
                    console.log("---------- current Leader-------------");
                    console.log(localStorage.getItem("currentUserNo"));
                    console.log("----------------------------------");
                    console.log('configTeamDTO -> ', configTeamDTO);
                    $.ajax({
                        url: 'https://www.h-club.site/comp/team/member',
                        type: 'POST',
                        contentType: 'application/json', // 서버로 보내는 데이터 타입을 JSON으로 설정
                        data: JSON.stringify(configTeamDTO),
                        success : function (response) {
                            userTeamNo = response;
                            console.log('userTeamNo => ' +  userTeamNo);
                            if(userTeamNo === team1No) {
                                $('.team:eq(0) .team-logo').addClass('highlighted-team');
                                $('.team:eq(1) .team-logo').removeClass('highlighted-team').addClass('not-highlighted-team');
                            } else if(userTeamNo === team2No) {
                                $('.team:eq(1) .team-logo').addClass('highlighted-team');
                                $('.team:eq(0) .team-logo').removeClass('highlighted-team').addClass('not-highlighted-team');
                            }
                        }, error : function(error) {
                            console.error(error);
                        }
                    })
                }).catch(error => {
                    console.error('사용자 정보 가져오기 실패:', error);
                })
            }, error: function (error){
                console.log('Error : ' + error);
            }
        });// end ajax

        $.ajax({
            url : 'https://www.h-club.site/auth/mypage/history/detail/${matchHistoryNo}',
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                console.log('## auth/mypage/histroy/deatail/${matchHistoryNo} ## ')
                console.log(response);
            }, error: function (error){
                console.log('error occured', error);
            }
        })

        $('.end-match-button').click(function() { // 뒤로가기버튼
            window.history.back();
        });
    });


    /* accessToken 으로부터 유저 정보 추출하는 함수 */
    function getUserInfo(accessToken) {
        return new Promise((resolve, reject) => {
            $.ajax({
                type: 'GET',
                url: 'https://www.h-club.site/auth/mypage/info', // 배포판
                headers: {
                    'Authorization': 'Bearer ' + accessToken, // accessToken 사용
                },
                success: function (response) {
                    console.log('사용자 정보:', response);
                    resolve(response); // 성공 시 response 객체를 resolve 합니다.
                },
                error: function (xhr, status, error) {
                    console.error('사용자 정보 가져오기 실패:', error);
                    reject(error); // 실패 시 error 객체를 reject 합니다.
                }
            });
        });
    }
</script>
</html>