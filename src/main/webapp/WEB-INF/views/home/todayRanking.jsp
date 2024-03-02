<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>H-Club</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/compMain.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
    .ranking-container {
        width: 88%;
        margin: 50px auto ;
    }
    .ranking-container h2 {
        text-align: center;
    }

    .user {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 10px;
        border-radius: 25px;
        padding: 20px;
        /*background-color: #f5f5f5;*/
        background-color: #F7FFE5;
        position: relative;
        font-size: 2em;
        min-height: 200px;
    }

    .profile-picture {
        position: absolute;
        left: 150px;
        width: 100px;
        height: 100px;
        border-radius: 50%;
        margin: 30px 30px 30px 10px;
    }
    .profile-picture img {
        width: 100%; /* 이미지의 너비를 div의 너비와 같게 설정 */
        height: 100%; /* 이미지의 높이를 div의 높이와 같게 설정 */
        border-radius: 50%; /* 이미지를 원형으로 만듬 */
        object-fit: cover; /* 이미지의 비율을 유지하면서 div를 꽉 채움 */

    }
    .name-rating {
        display: flex;
        flex: 1;
        align-items: center;
        justify-content: flex-start;
        margin-left: 10px;
    }

    .name {
        position: absolute;
        right: 380px;
        font-weight: bold;
        top: 50%;
        transform: translateY(-50%);
    }

    .rating {
        position: absolute;
        right: 180px;
        color: black;
        font-weight: bold;
        top: 50%;
        transform: translateY(-50%);
    }
    .match-num {
        position: absolute;
        right: 40px;
        top: 50%;
        transform: translateY(-50%);
        font-weight: bold;
    }

    /* Customize the top 3 */
    .top1 .profile-picture {
        /*background-image: url('path-to-crown-image');*/
        background-size: cover;
    }
    .top-users{
        margin: auto;
    }
    .top1, .top2, .top3 {
        background-color: #A5DD9B; /* A green color for the top 3 users */
        /*color: white;*/
    }

    .top1 {
        background-color: #A0C49D; /* A darker green color for the top user */
    }

    .top2{
        background-color: #C4D7B2; /* A lighter green color for 2nd and 3rd place */
    }

    .top3 {
        background-color: #E1ECC8;
        color: black;
    }

    /* 왕관 아이콘 스타일링 */
    .crown-icon {
        font-size: 36px; /* 아이콘 크기 조정 */
        margin-right: 20px;
        padding-left: 20px;
    }

    /* 1위, 2위, 3위에 대한 왕관 색상 */
    .top1 .crown-icon { color: gold; }
    .top2 .crown-icon { color: silver; }
    .top3 .crown-icon { color: #cd7f32; } /* Bronze color */
    .today-rankin-title {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .half-screen-line {
        width: 50vw; /* Sets the width to 50% of the viewport width */
        height: 2px; /* Sets the thickness of the line */
        background-color: #46675c; /* Sets the color of the line */
        margin-top: 10px; /* Adds some space above the line */
        margin-bottom: 50px; /* Adds some space below the line */
        margin-left: auto; /* Centers the line by pushing it equally from both sides */
        margin-right: 0;
    }
    .comp-select p {
        margin-top: 0;
        margin-bottom: 1rem;
    }
    .rank {
        font-weight: bold;s
    }
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
<body>
<main>
    <div class="comp-select" >
        <div class="comp-select-container" onclick="window.location.href='/competition'">
            <p>목록</p>
        </div>

        <div class="comp-select-container" onclick="window.location.href='/home/todayRanking'">
            <p style="color: #46675c">랭킹</p>
        </div>
    </div>
    <div class="half-screen-line"></div>
    <div class="ranking-container"></div>
</main>
</body>
<script>
    $(document).ready(function () {

        $.ajax({
            url: 'https://www.h-club.site/comp/rank?num=10',
            type: 'GET',
            dataType: 'json',
            success: function(response) {
                /* 10명의 데이터*/
                console.log(response)
                var rankingHTML = '';

                $.each(response.data, function(index, user) {
                    var rankClass = '';
                    if (index + 1 <= 3) {
                        rankClass = " top" + (index + 1);
                    }
                    rankingHTML += '<div class="user' + rankClass + '">' +
                        (index + 1 <= 3 ? '<i class="fas fa-crown crown-icon"></i>' : '') +
                        '<div class="rank">' + (index + 1) + '</div>' +
                        '<div class="profile-picture">' +
                        '<img src="' + user.memberImage + '" alt="사진" onerror="this.onerror=null; this.src=\'/resources/image/default-image.jpg\'"/>' +
                        '</div>' +
                        '<div class="name-rating">' +
                        '<div class="name">' + user.memberId + '</div>' +
                        '<div class="rating">' + user.memberRating + '점</div>' +
                        '<div class="match-num">' + user.matchNum + ' 경기</div>' +
                        '</div>' +
                        '</div>';
                });
                $('.ranking-container').html(rankingHTML);
            },
            error: function(error){
                console.log('Error : ', error);
            }
        });
    });
</script>
</html>
