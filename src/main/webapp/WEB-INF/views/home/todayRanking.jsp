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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>H-CLUB</title>
    <style>
        #wrapper {
            display: flex;
            flex-direction: column;
            font-size: 1.5em;
        }
        #wrapper h2 {
            text-align: center;
        }
        .ranking-container {
            width: 80%;
            margin: 50px auto ;
        }
        .ranking-container h2 {
            text-align: center;
        }

        .user {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            border-radius: 25px;
            padding: 50px 20px 50px 40px;
            background-color: #f5f5f5;
            position: relative;
            font-size: 1.5em;
        }

        .top1, .top2, .top3 {
            background-color: #e0e0e0;
        }

        .profile-picture {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 15px;
            margin-left: 15px;
        }
        .profile-picture img {
            width: 100%; /* 이미지의 너비를 div의 너비와 같게 설정 */
            height: 100%; /* 이미지의 높이를 div의 높이와 같게 설정 */
            border-radius: 50%; /* 이미지를 원형으로 만듬 */
            object-fit: cover; /* 이미지의 비율을 유지하면서 div를 꽉 채움 */
        }
        .name-rating {
            display: flex;
            flex-direction: row;
        }

        .name {
            position: absolute;
            right: 450px;
            font-weight: bold;
            top: 50%;
            transform: translateY(-50%);
        }

        .rating {
            position: absolute;
            right: 250px;
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
            background-color: #76b852; /* A green color for the top 3 users */
            color: white;
        }

        .top1 {
            background-color: #4CAF50; /* A darker green color for the top user */
        }

        .top2, .top3 {
            background-color: #8BC34A; /* A lighter green color for 2nd and 3rd place */
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

    </style>
</head>
<body>
<main>
<div id="wrapper">
    <h2>오늘의 TOP 10</h2>
    <div class="ranking-container"></div>
</div>
</main>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery CDN -->
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
                        '<img src="' + user.memberImage + '" alt="사진"/>' +
                        '</div>' +
                        '<div class="name-rating">' +
                        '<div class="name">' + user.memberId + '</div>' +
                        '<div class="rating">' + user.memberRating + '점</div>' +
                        '<div class="match-num">' + user.matchNum + '경기</div>' +
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