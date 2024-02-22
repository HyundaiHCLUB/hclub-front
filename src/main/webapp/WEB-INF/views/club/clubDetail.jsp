<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/club.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>동아리 상세</title>
    <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script>
        var headerHeight = document.querySelector('header').offsetHeight;
        var footerHeight = document.querySelector('footer').offsetHeight;

        window.addEventListener('scroll', function() {
            var scrollY = window.scrollY || document.documentElement.scrollTop;

            if (scrollY > headerHeight) {
                document.body.style.paddingTop = headerHeight + 'px';
                document.querySelector('header').classList.add('fixed');
            } else {
                document.body.style.paddingTop = 0;
                document.querySelector('header').classList.remove('fixed');
            }

            var scrollBottom = window.innerHeight + scrollY;
            var documentHeight = document.documentElement.offsetHeight;
            if (documentHeight - scrollBottom < footerHeight) {
                document.body.style.paddingBottom = footerHeight + 'px';
                document.querySelector('footer').classList.add('fixed-bottom');
            } else {
                document.body.style.paddingBottom = 0;
                document.querySelector('footer').classList.remove('fixed-bottom');
            }
        });
    </script>
    <script>
        function getClub(clubNo) {
            $.ajax({
                url: "https://www.h-club.site/clubs/detail/" + clubNo,
                method: "GET",
                success: function (response) {
                    if (response.success) {
                        var data = response.data;
                        $(".club").empty();

                        var clubHTML =
                            '<p class="club-title">' + data.clubName + '</p>'
                            ;

                        $(".club").append(clubHTML);
                    } else {
                        console.error("Error:", response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data:", error);
                }
            });
        }
        var clubNo = <%= request.getAttribute("clubNo") %>;
        console.log(clubNo);
        getClub(clubNo);
    </script>
    <style>
        input[type="radio"] {display: none; }
        input[type="radio"] + label {display: inline-block;padding: 20px;background: #F5F6F7;color: #000000;font-size: 36px;cursor: pointer; width:400px; border-radius:16px; text-align: center;}
        input[type="radio"]:checked + label {background: #46675c; color: #ffffff;}

        .conbox {width: 100%;height: 1700px;background: #F1F5E8;margin: 0 auto;display: none;border-radius: 80px; padding-top: 40px;}
        input[id="tab01"]:checked ~ .con1 {display: block;}
        input[id="tab02"]:checked ~ .con2 {display: block;}

    </style>
</head>

<body>
<main class="main-container">
    <div style="display: flex;margin: auto;display: block;">
        <img style="height: 50px;width: 50px;color: #46675c;margin-top: 65px;margin-left: 58px" onclick="history.back()" src="/resources/image/left-arrow.png">
        <div class="club"></div>
    </div>
    <div style="text-align: center">
        <input type="radio" name="tabmenu" id="tab01" checked>
        <label for="tab01">공지사항</label>
        <input type="radio" name="tabmenu" id="tab02">
        <label for="tab02">추억앨범</label>

        <div class="conbox con1">
            <div class="notice_bar">
                <a href="#" class="apply_button">신청하기</a>
                <svg style="margin-top:10px;margin-right: 58px;" width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M17.2047 10.7962L19.0007 9.00019C19.546 8.45494 19.8186 8.18231 19.9644 7.88822C20.2416 7.32866 20.2416 6.67171 19.9644 6.11215C19.8186 5.81806 19.546 5.54544 19.0007 5.00019C18.4555 4.45494 18.1829 4.18231 17.8888 4.03658C17.3292 3.75929 16.6723 3.75929 16.1127 4.03658C15.8186 4.18231 15.546 4.45494 15.0007 5.00019L13.1821 6.81884C14.146 8.46944 15.5321 9.845 17.2047 10.7962ZM11.7276 8.2733L4.85713 15.1438C4.43207 15.5689 4.21954 15.7814 4.0798 16.0425C3.94007 16.3036 3.88112 16.5983 3.76323 17.1878L3.14784 20.2648C3.08131 20.5974 3.04805 20.7637 3.14266 20.8583C3.23727 20.9529 3.40357 20.9196 3.73618 20.8531L6.81316 20.2377C7.40262 20.1198 7.69734 20.0609 7.95844 19.9211C8.21954 19.7814 8.43207 19.5689 8.85713 19.1438L15.7465 12.2544C14.1249 11.2388 12.7532 9.87646 11.7276 8.2733Z" fill="#222222"/>
                </svg>
            </div>
            <a href="#" class="notice_content">3월의 공지사항입니다!</a>
        </div>


        <div class="conbox con2">
            <div class="grid-container">
                <div class="grid-item">
                    <img class="circle_recommend" src="/resources/image/sample3.png" alt="Example Image">
                    <div class="circle_content">
                        <p class="circle_name">행복해요~</p>
                    </div>
                </div>
                <div class="grid-item">
                    <img class="circle_recommend" src="/resources/image/sample3.png" alt="Example Image">
                    <div class="circle_content">
                        <p class="circle_name">행복해요~</p>
                    </div>
                </div>
            </div>
            <div class="grid-container">
                <div class="grid-item">
                    <img class="circle_recommend" src="/resources/image/sample3.png" alt="Example Image">
                    <div class="circle_content">
                        <p class="circle_name">행복해요~</p>
                    </div>
                </div>
                <div class="grid-item">
                    <img class="circle_recommend" src="/resources/image/sample3.png" alt="Example Image">
                    <div class="circle_content">
                        <p class="circle_name">행복해요~</p>
                    </div>
                </div>
            </div>
            <div class="grid-container">
                <div class="grid-item">
                    <img class="circle_recommend" src="/resources/image/sample3.png" alt="Example Image">
                    <div class="circle_content">
                        <p class="circle_name">행복해요~</p>
                    </div>
                </div>
                <div class="grid-item">
                    <img class="circle_recommend" src="/resources/image/sample3.png" alt="Example Image">
                    <div class="circle_content">
                        <p class="circle_name">행복해요~</p>
                    </div>
                </div>
            </div>
            <div class="grid-container">
                <div class="grid-item">
                    <img class="circle_recommend" src="/resources/image/sample3.png" alt="Example Image">
                    <div class="circle_content">
                        <p class="circle_name">행복해요~</p>
                    </div>
                </div>
                <div class="grid-item">
                    <img class="circle_recommend" src="/resources/image/sample3.png" alt="Example Image">
                    <div class="circle_content">
                        <p class="circle_name">행복해요~</p>
                    </div>
                </div>
            </div>


        </div>
    </div>

</main>
</body>
</html>