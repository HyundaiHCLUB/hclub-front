<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/club.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
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
                            '<p class="club-title">' + data.clubName + '</p>' +
                            '<img class="club-image" src="' + data.clubImage + '">' +

                            '<div style="display: flex;justify-content: center; align-items: center;"><svg width="30" height="30" viewBox="0 0 18 22" fill="none" xmlns="http://www.w3.org/2000/svg">' +
                                '<path d="M9 12C10.6569 12 12 10.6569 12 9C12 7.34315 10.6569 6 9 6C7.34315 6 6 7.34315 6 9C6 10.6569 7.34315 12 9 12Z" stroke="#727272" stroke-width="1.66667" stroke-linecap="round" stroke-linejoin="round"/>' +
                                '<path d="M9 1C6.87827 1 4.84344 1.84285 3.34315 3.34315C1.84285 4.84344 1 6.87827 1 9C1 10.892 1.402 12.13 2.5 13.5L9 21L15.5 13.5C16.598 12.13 17 10.892 17 9C17 6.87827 16.1571 4.84344 14.6569 3.34315C13.1566 1.84285 11.1217 1 9 1V1Z" stroke="#727272" stroke-width="1.66667" stroke-linecap="round" stroke-linejoin="round"/>' +
                            '</svg>' +
                        '<p class="club-loc">' + data.clubLoc + '</p></div>' +
                            '<p class="club-info">' + data.clubInfo + '</p>'
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
    <%--<script>
        $(document).ready(function () {
            function createNotice() {
                var noticeTitle = document.getElementById("noticeTitle").value;
                var noticeContent = document.getElementById("noticeContent").value;
                var clubNo = <%= request.getAttribute("clubNo") %>;
                console.log(noticeTitle, noticeContent, clubNo);

                var NoticeCreateRequest = {
                    noticeTitle: noticeTitle,
                    noticeContent: noticeContent,
                    clubNo: clubNo
                };

                $.ajax({
                    url: 'https://www.h-club.site/clubs/notice',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(NoticeCreateRequest),
                    success: function (response) {
                        console.log('Server response:', response);

                        var noticeHTML =
                            '<div class="notice">' +
                            '<h2>' + response.noticeTitle + '</h2>' +
                            '<p>' + response.noticeContent + '</p>' +
                            '<p>' + 'Club Number: ' + response.clubNo + '</p>' +
                            '</div>';

                        $(".notices").append(noticeHTML);
                    },
                    error: function (xhr, status, error) {
                        console.error('Error occurred:', error);
                    }
                });
            }

            $('#create').click(function () {
                createNotice(); // 함수 호출
            });
        });
    </script>--%>
    <script>
        function createNotice() {
            var noticeTitle = document.getElementById("noticeTitle").value;
            var noticeContent = document.getElementById("noticeContent").value;
            var clubNo = <%= request.getAttribute("clubNo") %>;
            console.log(noticeTitle, noticeContent, clubNo);

            var NoticeCreateRequest = {
                noticeTitle: noticeTitle,
                noticeContent: noticeContent,
                clubNo: clubNo
            };

            $.ajax({
                type: "POST",
                url: "https://www.h-club.site/clubs/notice",
                contentType: "application/json",
                data: JSON.stringify(NoticeCreateRequest),
                success: function(response) {
                    getClubNotices(clubNo);
                },
                error: function(error) {
                    console.error("Error creating notice: ", error);
                }
            });
        }

        function getClubNotices(clubNo) {
            $.ajax({
                type: "GET",
                url: "https://www.h-club.site/clubs/" + clubNo + "/notice",

                success: function(response) {
                    updateNoticeList(response.data);
                },
                error: function(error) {
                    console.error("Error fetching club notices: ", error);
                }
            });
        }

        function updateNoticeList(notices) {
            var noticeListContainer = document.getElementById("noticeListContainer");

            noticeListContainer.innerHTML = "";

            notices.forEach(function(notice) {
                var noticeElement = document.createElement("div");
                noticeElement.innerHTML = "<strong>" + notice.noticeTitle + "</strong>: " + notice.noticeContent;
                noticeListContainer.appendChild(noticeElement);
            });
        }
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
                <a href="/club/apply/<%= request.getAttribute("clubNo") %>" class="apply_button">신청하기</a>
                <div data-toggle="modal" data-target="#myModal">
                <svg style="margin-top:10px;margin-right: 58px;" width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M17.2047 10.7962L19.0007 9.00019C19.546 8.45494 19.8186 8.18231 19.9644 7.88822C20.2416 7.32866 20.2416 6.67171 19.9644 6.11215C19.8186 5.81806 19.546 5.54544 19.0007 5.00019C18.4555 4.45494 18.1829 4.18231 17.8888 4.03658C17.3292 3.75929 16.6723 3.75929 16.1127 4.03658C15.8186 4.18231 15.546 4.45494 15.0007 5.00019L13.1821 6.81884C14.146 8.46944 15.5321 9.845 17.2047 10.7962ZM11.7276 8.2733L4.85713 15.1438C4.43207 15.5689 4.21954 15.7814 4.0798 16.0425C3.94007 16.3036 3.88112 16.5983 3.76323 17.1878L3.14784 20.2648C3.08131 20.5974 3.04805 20.7637 3.14266 20.8583C3.23727 20.9529 3.40357 20.9196 3.73618 20.8531L6.81316 20.2377C7.40262 20.1198 7.69734 20.0609 7.95844 19.9211C8.21954 19.7814 8.43207 19.5689 8.85713 19.1438L15.7465 12.2544C14.1249 11.2388 12.7532 9.87646 11.7276 8.2733Z" fill="#222222"/>
                </svg>
                </div>
            </div>
            <div id="noticeListContainer">
            </div>
            <a href="#" class="notice_content">3월의 공지사항입니다!</a>

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" style="max-width: none" role="document">
                    <div class="modal-content" style="width: 900px;height: 1000px; margin-left: 44px">
                        <div class="modal-header">
                            <svg width="56" height="56" viewBox="0 0 56 56" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <rect x="4" y="4" width="48" height="48" rx="24" fill="#FEE4E2"/>
                                <rect x="4" y="4" width="48" height="48" rx="24" stroke="#FEF3F2" stroke-width="8"/>
                                <path d="M28 22L28 34" stroke="#B31312" stroke-width="2" stroke-linecap="square" stroke-linejoin="round"/>
                                <path d="M34 28L22 28" stroke="#B31312" stroke-width="2" stroke-linecap="square" stroke-linejoin="round"/>
                            </svg>
                            <p style="font-size:36px;font-weight: bold;margin-left:20px">동아리 공지사항</p>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" style="padding: 0">
                            <div class="input-group" style="margin-bottom: 10px;margin-left: 44px;">
                                <input id="noticeTitle" style="font-size: 36px; width: 90%;height: 50px;" name="noticeTitle" type="text" value="제목을 입력해 주세요.">
                            </div>
                            <div class="input-group" style="margin-left: 44px;">
                                <textarea id="noticeContent" name="noticeContent" style="width: 90%;height: 700px;font-size: 36px;" placeholder="내용을 상세히 입력해주세요." ></textarea>
                            </div>
                        </div>
                        <a id="create" onclick="createNotice()">
                            <div style="text-align: center;margin-bottom:40px;">
                                <svg width="600" height="60" viewBox="0 0 347 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <g filter="url(#filter0_d_662_7594)">
                                        <rect x="2" y="1" width="343" height="44" rx="8" fill="#EF7353"/>
                                        <rect x="2.5" y="1.5" width="342" height="43" rx="7.5" stroke="#D92D20"/>
                                        <path d="M159.156 22.376H172.564V24.104H159.156V22.376ZM160.772 19.672H171.044V21.352H160.772V19.672ZM160.772 16.008H170.964V17.704H162.884V20.504H160.772V16.008ZM165.812 24.984C169.012 24.984 170.948 25.96 170.948 27.704C170.948 29.448 169.012 30.424 165.812 30.424C162.612 30.424 160.66 29.448 160.66 27.704C160.66 25.96 162.612 24.984 165.812 24.984ZM165.812 26.584C163.828 26.584 162.82 26.952 162.82 27.704C162.82 28.472 163.828 28.808 165.812 28.808C167.796 28.808 168.804 28.472 168.804 27.704C168.804 26.952 167.796 26.584 165.812 26.584ZM173.859 23.544H187.283V25.24H173.859V23.544ZM175.507 15.896H185.651V19.912H177.635V21.512H175.523V18.408H183.555V17.512H175.507V15.896ZM175.523 20.872H185.939V22.488H175.523V20.872ZM179.507 21.656H181.635V24.472H179.507V21.656ZM175.347 26.072H185.747V30.376H183.619V27.752H175.347V26.072Z" fill="white"/>
                                    </g>
                                    <defs>
                                        <filter id="filter0_d_662_7594" x="0" y="0" width="347" height="48" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                                            <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                                            <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
                                            <feOffset dy="1"/>
                                            <feGaussianBlur stdDeviation="1"/>
                                            <feColorMatrix type="matrix" values="0 0 0 0 0.0627451 0 0 0 0 0.0941176 0 0 0 0 0.156863 0 0 0 0.05 0"/>
                                            <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_662_7594"/>
                                            <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_662_7594" result="shape"/>
                                        </filter>
                                    </defs>
                                </svg>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
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