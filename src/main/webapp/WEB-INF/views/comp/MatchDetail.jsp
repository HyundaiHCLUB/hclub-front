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
            justify-content: space-around;
            /*background-color: #F1F5E8;*/
            width: 90%;
            height: 100%;
            margin: 50px 0; /* 상단과 하단에 마진 추가 */
        }
        .team {
            display: grid;
            grid-template-rows: repeat(6, 1fr);
            gap: 10px;
            text-align: center;
            flex: 1; /* Flex grow to take available space */
            font-size: 2.5em;
        }
        .team-logo {
            border-radius: 50%;
            box-sizing: border-box; /* 테두리와 패딩을 요소의 크기 계산에 포함 */
        }
        .team img {
            width: 260px;
            height: 260px;
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
            color: #46675C; /* 글자색 */
            padding: 10px 10px; /* 상하좌우 패딩 */
            font-size: 1.3em;
            font-weight: bold;
            border-style: none;
            border-radius: 10px; /* 둥근 모서리 */
            display: inline-block; /* 인라인 블록 요소로 만들기 */
            margin: 20px 0 20px 0; /* 기본 마진 제거 */
        }
        .team-detail-header {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .team-detail-header img {
            width: 45px;
            height: 45px;
            margin : auto 5px;
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
            background: rgba(111, 193, 115, 0.2);
            color: #333;
            margin-top: 50px;
            font-size: 1em;
            font-weight: bold;
            border-style: none;
            border-radius: 15px;
            padding: 30px 0;
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

        .location-checkbox {
            appearance: none; /* 혹은 -webkit-appearance: none; -moz-appearance: none; */
            background-color: #fff;
            margin: 0;
            font: inherit;
            color: currentColor;
            width: 1.3em;
            height: 1.3em;
            border: 0.1em solid #cacece;
            border-radius: 50%; /* 둥근 테두리를 만들기 위해 */
            transform: translateY(-0.075em);

            display: grid;
            place-content: center;
        }

        .location-checkbox::before {
            content: "";
            width: 0.65em;
            height: 0.65em;
            border-radius: 50%;
            transform: scale(0);
            transition: 120ms transform ease-in-out;
            box-shadow: inset 1em 1em #007bff;
            /* Replace --form-control-color with the color of your choice */
            background-color: #cacece; /* 체크박스의 배경색 */
        }

        .location-checkbox:checked::before {
            transform: scale(1);
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
<main>
<div id="wrapper">
            <div class="detail-title">
                <i class="fas fa-crown crown-icon"></i>
                    <h1>경기 상세정보</h1>
                <i class="fas fa-crown crown-icon"></i>
            </div>
            <div class="match-detail">
                <div class="team">
                    <img src="" class="team-logo"/>
                    <div class="team-detail">
                        <div class="team-detail-header">
                            <img src="/resources/image/comp/comp_crwon.png">
                            <h5>팀명</h5>
                        </div>
                        <p></p>
                    </div>
                    <div class="team-detail">
                        <div class="team-detail-header">
                            <img src="/resources/image/comp/comp_location.png">
                            <h5>장소</h5>
                            <input type="checkbox" class="location-checkbox" name="location"/>
                        </div>
                        <p></p>
                    </div>
                    <div class="team-detail">
                        <div class="team-detail-header">
                        <img src="/resources/image/comp/comp_calendar.png">
                        <h5>일시</h5>
                    </div>
                        <p></p>
                    </div>
                    <div class="team-detail">
                        <div class="team-detail-header">
                            <img src="/resources/image/comp/comp_trophy.png">
                            <h5>상품</h5>
                        </div>
                        <p></p>
                    </div>
                    <div class="team-detail">
                        <div class="team-detail-header">
                            <img src="/resources/image/comp/comp_rating.png">
                            <h5>레이팅</h5>
                        </div>
                        <p></p>
                    </div>
                    <button class="btn-team-detail" data-team-no="">상세정보</button>
                </div>
                <div class="vs">
                    <h3>VS</h3>
                </div>
                <div class="team">
                    <img src="" class="team-logo"/>
                    <div class="team-detail">
                        <div class="team-detail-header">
                            <img src="/resources/image/comp/comp_crwon.png">
                            <h5>팀명</h5>
                        </div>
                        <p></p>
                    </div>
                    <div class="team-detail">
                        <div class="team-detail-header">
                            <img src="/resources/image/comp/comp_location.png">
                            <h5>장소</h5>
                            <input type="checkbox" class="location-checkbox" name="location" />
                        </div>
                        <p></p>
                    </div>
                    <div class="team-detail">
                        <div class="team-detail-header">
                            <img src="/resources/image/comp/comp_calendar.png">
                            <h5>일시</h5>
                        </div>
                        <p></p>
                    </div>
                    <div class="team-detail">
                        <div class="team-detail-header">
                            <img src="/resources/image/comp/comp_trophy.png">
                            <h5>상품</h5>
                        </div>
                        <p></p>
                    </div>
                    <div class="team-detail">
                        <div class="team-detail-header">
                            <img src="/resources/image/comp/comp_rating.png">
                            <h5>레이팅</h5>
                        </div>
                        <p></p>
                    </div>
                    <button class="btn-team-detail" data-team-no="">상세정보</button>
                </div>
            </div>
                <button class="chat-button" onclick="goChatPage()">채팅하기</button>
                <button class="btn-match-start">경기시작</button>

    </div>
</main>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery CDN -->
<script>
    var matchHistorytNo = ${matchHistoryNo};
    var locationInformation; // 장소 저장할 변수
    let accessToken = localStorage.getItem("accessTokenInfo");
    var memberId;
    var teamNo1;
    var teamNo2;

	$(document).ready(function() {
        $('.team:eq(0) .team-logo').addClass('highlighted-team');
        $('.team:eq(1) .team-logo').addClass('not-highlighted-team');

        $('.btn-match-start').click(function(e) {
            e.preventDefault();
            // JWT 를 사용해 사용자 정보 가져오기
            getUserInfo(accessToken).then(memberInfo => {
                console.log("memberID : " + memberInfo.member_id);
                memberId = memberInfo.member_id;
                $('#userName').text(memberInfo.employeeName); // 이름 설정
                $('#userDept').text(memberInfo.employeeDept + ' (' + memberInfo.employeePosition + ')'); // 부서와 직급 설정
                $('.profile-pic').attr('src', memberInfo.memberImage);

             }).catch(error => {
                console.error('사용자 정보 가져오기 실패:', error);
            });

            // 경기 장소 업데이트(선택된 장소로 DB 에 저장)
            $.ajax({
                url: 'https://www.h-club.site/comp/matchLocation',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    'matchHistoryNo' : matchHistorytNo,
                    'matchLoc': locationInformation
                }),
                success: function(response) {
                    window.location.href = "${path}/competition/matchRecord/" + matchHistorytNo;
                },error: function (error){
                    console.log(error);
                }
            });
        });

        // 경기상세정보 API 호출
        $.ajax({
            url: 'https://www.h-club.site/comp/match/${matchHistoryNo}', //<- 컨트롤러에서 넘어온 경기번호
            type: 'GET',
            dataType: 'json',
            success: function (response){
                updateMatchDetails(response.data);
                matchHistorytNo = response.data.matchHistoryNo;
                temaNo1 = response.data.team1.teamNo;
                temaNo2 = response.data.team2.teamNo;
                console.log(response);
                console.log("matchHistNo -> " + matchHistorytNo);
                console.log("teamNo1 -> " + response.data.team1.teamNo);
                console.log("teamNo2 -> " + response.data.team2.teamNo);
                // 버튼에 data-team-no 속성 설정
                $('.btn-team-detail').eq(0).attr('data-team-no', temaNo1);
                $('.btn-team-detail').eq(1).attr('data-team-no', temaNo2);
                // 현재 화면에 접속한 사용자가 속한 팀 번호 알아내기
                getUserInfo(accessToken).then(memberInfo => {
                    memberId = memberInfo.member_id;
                    var userTeamNo = memberInfo.teamNo; // 사용자의 팀 번호를 가져옵니다.
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
                        // url: 'http://localhost:8082/comp/team/member',
                        type: 'POST',
                        contentType: 'application/json', // 서버로 보내는 데이터 타입을 JSON으로 설정
                        data: JSON.stringify(configTeamDTO),
                        success : function (response) {
                            userTeamNo = response;
                            console.log('userTeamNo => ' +  userTeamNo);
                        }, error : function(error) {
                            console.error(error);
                        }
                    })
                    if(userTeamNo === teamNo1) {
                        $('.team:eq(0) .team-logo').addClass('highlighted-team');
                        $('.team:eq(1) .team-logo').removeClass('highlighted-team').addClass('not-highlighted-team');
                    } else if(userTeamNo === teamNo2) {
                        $('.team:eq(1) .team-logo').addClass('highlighted-team');
                        $('.team:eq(0) .team-logo').removeClass('highlighted-team').addClass('not-highlighted-team');
                    }

                });
            }, error: function (error){
                console.log('Error : ' + error);
            }
        });


        // 페이지 DOM 업데이트 함수
        function updateMatchDetails(data) {
            // 팀1 정보 업데이트
            $('.team:eq(0) .team-logo').attr('src', data.team1.teamImage);
            $('.team:eq(0) .team-detail').eq(0).find('p').text(data.team1.teamName);
            $('.team:eq(0) .team-detail').eq(1).find('p').text(data.team1.teamLoc);
            $('.team:eq(0) .team-detail').eq(2).find('p').text(data.team1.matchDate);
            $('.team:eq(0) .team-detail').eq(3).find('p').text(data.team1.teamGoods ? data.team1.teamGoods : "없음");
            $('.team:eq(0) .team-detail').eq(4).find('p').text(data.team1.teamRating);

            // 팀2 정보 업데이트
            $('.team:eq(1) .team-logo').attr('src', data.team2.teamImage);
            $('.team:eq(1) .team-detail').eq(0).find('p').text(data.team2.teamName);
            $('.team:eq(1) .team-detail').eq(1).find('p').text(data.team2.teamLoc);
            $('.team:eq(1) .team-detail').eq(2).find('p').text(data.team2.matchDate);
            $('.team:eq(1) .team-detail').eq(3).find('p').text(data.team2.teamGoods ? data.team2.teamGoods : "없음");

            $('.team:eq(1) .team-detail').eq(4).find('p').text(data.team2.teamRating);
            // 팀2에 대한 정보 업데이트도 같은 방식으로 수행
        }

        // 체크박스 둘 중 하나만 선택되게 하는 로직
        $('input[type="checkbox"]').on('change', function() {
            $('input[type="checkbox"]').not(this).prop('checked', false);
        });

        $('.btn-team-detail').on('click', function() {
            var teamNo = $(this).data('team-no');
            console.log("btn click -> teamNo : ")
            goTeamDetailPage(teamNo);
        });
    });

    /* 체크된 체크박스에 해당하는 "장소" 데이터 저장 */
    document.addEventListener('DOMContentLoaded', function() {
        // 체크박스에 이벤트 리스너를 추가합니다.
        document.querySelectorAll('.location-checkbox').forEach(function(checkbox) {
            checkbox.addEventListener('change', function() {
                // 체크박스가 체크되었는지 확인합니다.
                if (this.checked) {
                    // 체크된 체크박스의 부모 요소인 .team-detail-header을 찾고,
                    // 그 다음 형제 요소인 <p> 태그의 텍스트를 변수에 저장합니다.
                    locationInformation = this.closest('.team-detail').querySelector('p').textContent.trim();
                    console.log(locationInformation); // 콘솔에 출력하여 확인
                }
            });
        });
    });
    /* accessToken 으로부터 유저 정보 추출하는 함수 */
    function getUserInfo(accessToken) {
        return new Promise((resolve, reject) => {
            $.ajax({
                type: 'GET',
                // url: 'http://localhost:8080/auth/mypage/info',   // 로컬
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
    function goChatPage(){
    	location.href="/competition/chatPageView"
    }

    function goTeamDetailPage(teamNo) {
        location.href = "/competition/matchDetail/teamDetail/" + teamNo;
    }
</script>

</html>