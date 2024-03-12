<!-- 작성자 : 김동욱 -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/comp/teamDetail.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>TeamCreated</title>

</head>

<body>
<main>
    <div class="mypage-top-menu">
        <img src="/resources/image/left-arrow.png"
             onclick="window.history.back()"/>
        <span>상세보기</span>
    </div>
    <div class="team-image">
        <img src="" alt="팀 이미지">
    </div>

    <!-- 이벤트 상세 정보 섹션 -->
    <div class="event-details">
        <div class="team-detail">
            <img src=""/>
            <h2>팀 이름</h2>
        </div>
        <!-- 장소 -->
        <div class="details-container">
            <div class="detail-component-loc">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/team-loc-icon.png">
                    <h3>장소</h3>
                </div>
                <p>경기 장소</p>
            </div>

            <div class="detail-component-gametype">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/team-capa-icon.png">
                    <h3>게임 종류</h3>
                </div>
                <p></p>
            </div>
        </div>
        <!-- 일시 & 레이팅-->
        <div class="details-container">
            <div class="detail-component-date">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/team-date-icon.png">
                    <h3>일시</h3>
                </div>
                <p></p>
            </div>

            <div class="detail-component-rating">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/team-rating-icon.png">
                    <h3>레이팅</h3>
                </div>
                <p></p>
            </div>
        </div>
        <!-- 게임 종류 & 상품-->
        <div class="details-container">

            <div class="detail-component-goods">
                <div class="detail-component-header">
                    <img src="/resources/image/comp/team-prize-icon.png">
                    <h3>상품</h3>
                </div>
                <p>H-Cafe 50,000원권</p>
            </div>
        </div>
        <!-- 팀원 -->
        <div class="detail-component-team-mate">
            <div class="detail-component-header">
                <img src="/resources/image/comp/team-member-icon.png">
                <h3>팀원</h3>
            </div>

        </div>
    </div>
    <div class="button-container">
        <button class="team-button">참여하기</button>
    </div>
</main>
</body>
<script>
    let teamNo = ${teamNo}; // 컨트롤러에서 받은 팀 번호
    let opponentMatchType = '';
    let opponentTeamCapacity = '';
    console.log('teamNo : ' + teamNo);

    $(document).ready(function () {
        $(document).ready(function () {
            // 경쟁 - 팀 상세보기
            $.ajax({
                url: 'https://www.h-club.site/comp/' + teamNo,
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    console.log(response);
                    // 응답받은 데이터로 상세보기 입력
                    $('.team-image img').attr('src', response.data.teamImage);
                    $('.team-detail img').attr('src', response.data.matchType);
                    $('.team-detail h2').text(response.data.teamName);
                    $('.detail-component-loc p').text(response.data.teamLoc);
                    $('.detail-component-date p').text(response.data.matchAt);
                    $('.detail-component-rating p').text(response.data.teamRating + '점');
                    $('.detail-component-gametype p').text(response.data.teamCapacity);
                    $('.detail-component-goods p').text(response.data.teamGoods);
                    opponentMatchType = response.data.matchKind;
                    opponentTeamCapacity = response.data.teamCapacity;

                    var teamMembers = response.data.memberList;
                    var teamMembersContainer = $('.detail-component-team-mate');
                    teamMembersContainer.find('p').remove(); // 기존의 팀원 목록을 제거합니다.

                    teamMembers.forEach(function (member) {
                        teamMembersContainer.append($('<p>').text(member.memberName + ' ' + member.memberDept + ' ' + member.memberPosition));
                    });
                },
                error: function (xhr, status, error) {

                    console.error('팀 정보를 가져오는데 실패했습니다: ' + error);
                }
            });
        });
    });
    let buttonNext = document.querySelector('.team-button');
    buttonNext.addEventListener('click', function () {
        localStorage.setItem("opponentTeamNo", teamNo);
        localStorage.setItem("opponentMatchType", opponentMatchType);
        localStorage.setItem("opponentTeamCapacity", opponentTeamCapacity);
        localStorage.setItem("initCreate", 'N');
        window.location.href = '/competition/create/1';
    })
</script>
</html>
