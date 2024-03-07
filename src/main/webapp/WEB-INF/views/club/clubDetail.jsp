<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/club.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>동아리 상세</title>
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
                            '<p class="club-title" style="color:#46675C;font-size: 80px;">' + data.clubName + '</p>' +
                            '<img class="club-image" style="border-radius: 20px;" src="' + data.clubImage + '">' +

                            '<div style="display: flex;justify-content: center; align-items: center;"><svg width="30" height="30" viewBox="0 0 18 22" fill="none" xmlns="http://www.w3.org/2000/svg">' +
                                '<path d="M9 12C10.6569 12 12 10.6569 12 9C12 7.34315 10.6569 6 9 6C7.34315 6 6 7.34315 6 9C6 10.6569 7.34315 12 9 12Z" stroke="#727272" stroke-width="1.66667" stroke-linecap="round" stroke-linejoin="round"/>' +
                                '<path d="M9 1C6.87827 1 4.84344 1.84285 3.34315 3.34315C1.84285 4.84344 1 6.87827 1 9C1 10.892 1.402 12.13 2.5 13.5L9 21L15.5 13.5C16.598 12.13 17 10.892 17 9C17 6.87827 16.1571 4.84344 14.6569 3.34315C13.1566 1.84285 11.1217 1 9 1V1Z" stroke="#727272" stroke-width="1.66667" stroke-linecap="round" stroke-linejoin="round"/>' +
                            '</svg>' +
                        '<p class="club-loc" style="font-size: 40px">' + data.clubLoc + '</p></div>' +
                            '<div style="margin-left:auto;margin-right:auto;width: 800px;">' +
                            '<p class="club-info">' + data.clubInfo + '</p>' +
                            '</div>'
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

        function checkAndOpenModal() {
            var clubNo = <%= request.getAttribute("clubNo") %>;
            checkCreatorAccess(clubNo);
        }

        function checkCreatorAccess(clubNo) {
            accessToken = localStorage.getItem("accessTokenInfo");

            $.ajax({
                type: "GET",
                url: "https://www.h-club.site/clubs/" + clubNo + "/creator",
                headers: {
                    'accessTokenInfo': accessToken,
                },
                success: function (response) {
                    console.log("개설자 유무");
                    if (response.success) {
                        if (response.data === 'Y') {
                            $('#myModal').modal('show');
                        } else {
                            $('#myModal2').modal('show');
                        }
                    } else {
                        console.error("Error:", response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data:", error);
                }
            });
        }

        function checkMemberAndOpenModal() {
            var clubNo = <%= request.getAttribute("clubNo") %>;
            checkMember(clubNo);
        }

        function checkMember(clubNo) {
            accessToken = localStorage.getItem("accessTokenInfo");
            console.log("동아리회원 체크");
            $.ajax({
                type: "GET",
                //url: "http://localhost:8081/clubs/" + clubNo + "/member",
                url: "https://www.h-club.site/clubs/" + clubNo + "/member",
                headers: {
                    'accessTokenInfo': accessToken,
                },
                success: function (response) {
                    if (response.success) {
                        console.log(response.data);
                        if (response.data === undefined || response.data === null) {
                            $('#myModal3').modal('show');
                        } else {
                            window.location.href = "/club/history/" + clubNo;
                        }
                    } else {
                        console.error("Error:", response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data:", error);
                }
            });
        }

        function createNotice() {
            accessToken = localStorage.getItem("accessTokenInfo");

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
                headers: {
                    'accessTokenInfo': accessToken,
                },
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

        function checkCreator(clubNo) {
            accessToken = localStorage.getItem("accessTokenInfo");

            $.ajax({
                type: "GET",
                url: "https://www.h-club.site/clubs/" + clubNo + "/creator",
                headers: {
                    'accessTokenInfo': accessToken,
                },
                success: function (response) {
                    console.log("개설자 유무");
                    if (response.success) {
                        if (response.data === 'Y') {
                            $('#myModal4').modal('show');
                        } else {
                            location.href="/club/apply/"+clubNo;
                        }
                    } else {
                        console.error("Error:", response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data:", error);
                }
            });
        }

        function getClubNotices(clubNo) {
            $.ajax({
                method: "GET",
                url: "https://www.h-club.site/clubs/" + clubNo + "/notice",

                success: function (response) {
                    if (response.success) {
                        var data = response.data;

                        $(".noticeListContainer").empty();

                        var noticeHTML = "";
                        data.forEach(function (item) {
                            if (item.noticeTitle !== undefined && item.noticeTitle !== null) {
                                noticeHTML += '<a onclick="getClubNoticeDetail(' + item.noticeNo + ')" class="notice_content">' + item.noticeTitle + '</a>';                            }
                        });

                        $(".noticeListContainer").append(noticeHTML);

                    } else {
                        console.error("Error:", response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data:", error);
                }
            });
        }

        var clubNo = "<%= request.getAttribute("clubNo") %>" || "";
        getClubNotices(clubNo);

        function getClubNoticeDetail(noticeNo) {
            $.ajax({
                method: "GET",
                url: "https://www.h-club.site/clubs/" + clubNo + "/notice/"+noticeNo,

                success: function (response) {
                    if (response.success) {
                        var data = response.data;
                        showNoticeModal(data.noticeTitle, data.noticeContent);

                    } else {
                        console.error("Error:", response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data:", error);
                }
            });
        }

        function showNoticeModal(noticeTitle, noticeContent) {
            document.getElementById('noticeTitles').innerText = noticeTitle;

            document.getElementById('noticeContents').innerText = noticeContent;

            $('#myModal5').modal('show');
        }

        function fetchData() {
            var clubNo = <%= request.getAttribute("clubNo") %>;
            $.ajax({
                url: 'https://www.h-club.site/clubs/' + clubNo + '/history',
                type: 'GET',
                dataType: 'json',
                success: function (responseData) {
                    displayHistory(responseData);
                },
                error: function (xhr, status, error) {
                    console.error('Error fetching data:', error);
                }
            });
        }

        $(document).ready(function () {
            fetchData();
        });

        function displayHistory(responseData) {
            var historyMap = {};

            responseData.data.forEach(function (history) {
                if (!(history.historyNo in historyMap)) {
                    historyMap[history.historyNo] = history;
                }
            });

            var historyContainer = $('#historyContainer');
            var counter = 0;

            var html = '<div class="grid-container">';

            for (var historyNo in historyMap) {
                if (historyMap.hasOwnProperty(historyNo)) {
                    var history = historyMap[historyNo];

                    html += '<a href="#"><div class="grid-item" style="margin-left: 16px;">';
                    html += '<img class="circle_recommend" style="margin-left: 50px;" src="' + history.imageUrl + '" alt="Image">';
                    html += '<div class="circle_content"><p class="circle_name">' + history.title + '</p></div>';
                    html += '</div></a>';

                    counter++;

                    if (counter % 2 === 0) {
                        html += '</div><div class="grid-container">';
                    }
                }
            }

            if (counter % 2 !== 0) {
                html += '</div>';
            }

            historyContainer.append(html);
        }
    </script>
    <style>
        input[type="radio"] {display: none; }
        input[type="radio"] + label {display: inline-block;padding: 20px; margin:20px; background: #F5F6F7;color: #000000;font-size: 40px;cursor: pointer; width:400px; border-radius:16px; text-align: center;}
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
                <a onclick="checkCreator(<%= request.getAttribute("clubNo") %>)" class="apply_button" style="color: #FFFFFF">신청하기</a>
                <div onclick="checkAndOpenModal()">
                    <svg style="margin-top:10px;margin-right: 58px;" width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M17.2047 10.7962L19.0007 9.00019C19.546 8.45494 19.8186 8.18231 19.9644 7.88822C20.2416 7.32866 20.2416 6.67171 19.9644 6.11215C19.8186 5.81806 19.546 5.54544 19.0007 5.00019C18.4555 4.45494 18.1829 4.18231 17.8888 4.03658C17.3292 3.75929 16.6723 3.75929 16.1127 4.03658C15.8186 4.18231 15.546 4.45494 15.0007 5.00019L13.1821 6.81884C14.146 8.46944 15.5321 9.845 17.2047 10.7962ZM11.7276 8.2733L4.85713 15.1438C4.43207 15.5689 4.21954 15.7814 4.0798 16.0425C3.94007 16.3036 3.88112 16.5983 3.76323 17.1878L3.14784 20.2648C3.08131 20.5974 3.04805 20.7637 3.14266 20.8583C3.23727 20.9529 3.40357 20.9196 3.73618 20.8531L6.81316 20.2377C7.40262 20.1198 7.69734 20.0609 7.95844 19.9211C8.21954 19.7814 8.43207 19.5689 8.85713 19.1438L15.7465 12.2544C14.1249 11.2388 12.7532 9.87646 11.7276 8.2733Z" fill="#222222"/>
                    </svg>
                </div>
            </div>
            <div class="noticeListContainer">
            </div>

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
                            <p style="font-size:36px;font-weight: 500;margin-left:20px">동아리 공지사항</p>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" style="padding: 0">
                            <div class="input-group" style="margin-bottom: 10px;margin-left: 44px;">
                                <input id="noticeTitle" style="font-size: 36px; width: 90%;height: 50px;" name="noticeTitle" type="text" placeholder="제목을 입력해 주세요.">
                            </div>
                            <div class="input-group" style="margin-left: 44px;">
                                <textarea id="noticeContent" name="noticeContent" style="width: 90%;height: 700px;font-size: 36px;" placeholder="내용을 상세히 입력해주세요." ></textarea>
                            </div>
                        </div>
                        <a onclick="createNotice()" data-dismiss="modal" aria-label="Close">
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

        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <svg width="56" height="56" viewBox="0 0 56 56" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect x="4" y="4" width="48" height="48" rx="24" fill="#FEE4E2"/>
                            <rect x="4" y="4" width="48" height="48" rx="24" stroke="#FEF3F2" stroke-width="8"/>
                            <path d="M25.1438 30.6858L24.2196 31.0677L25.1438 30.6858ZM24.9184 30.2337L24.1282 30.8465L24.9184 30.2337ZM31.0816 30.2337L31.8718 30.8465L31.0816 30.2337ZM33 25C33 26.6366 32.2147 28.0895 30.9962 29.0033L32.1961 30.6034C33.8966 29.3282 35 27.2928 35 25H33ZM28 20C30.7614 20 33 22.2386 33 25H35C35 21.134 31.866 18 28 18V20ZM23 25C23 22.2386 25.2386 20 28 20V18C24.134 18 21 21.134 21 25H23ZM25.0038 29.0033C23.7853 28.0895 23 26.6366 23 25H21C21 27.2928 22.1034 29.3282 23.8039 30.6034L25.0038 29.0033ZM26.9973 34.743C26.9654 33.2148 26.6489 31.7097 26.068 30.3039L24.2196 31.0677C24.706 32.2449 24.971 33.5051 24.9978 34.7848L26.9973 34.743ZM29.3416 34.2111C28.4971 34.6334 27.5029 34.6334 26.6584 34.2111L25.7639 36C27.1716 36.7038 28.8284 36.7038 30.2361 36L29.3416 34.2111ZM29.932 30.3039C29.3511 31.7097 29.0346 33.2148 29.0027 34.743L31.0022 34.7848C31.029 33.5051 31.294 32.2449 31.7804 31.0677L29.932 30.3039ZM30.2361 36C30.708 35.764 30.9917 35.2888 31.0022 34.7848L29.0027 34.743C29.0072 34.5284 29.1285 34.3177 29.3416 34.2111L30.2361 36ZM24.9978 34.7848C25.0083 35.2888 25.292 35.764 25.7639 36L26.6584 34.2111C26.8715 34.3177 26.9928 34.5284 26.9973 34.743L24.9978 34.7848ZM23.8039 30.6034C23.9548 30.7165 24.043 30.7829 24.1052 30.8338C24.1678 30.885 24.156 30.8824 24.1282 30.8465L25.7086 29.6209C25.5215 29.3795 25.2307 29.1734 25.0038 29.0033L23.8039 30.6034ZM26.068 30.3039C25.9896 30.1144 25.8913 29.8565 25.7086 29.6209L24.1282 30.8465C24.1147 30.8291 24.1121 30.8197 24.1252 30.8469C24.1331 30.8632 24.1439 30.8872 24.1602 30.9253C24.1767 30.9639 24.1951 31.0086 24.2196 31.0677L26.068 30.3039ZM30.9962 29.0033C30.7693 29.1734 30.4785 29.3795 30.2914 29.6209L31.8718 30.8465C31.844 30.8824 31.8322 30.885 31.8948 30.8338C31.957 30.7829 32.0452 30.7165 32.1961 30.6034L30.9962 29.0033ZM31.7804 31.0677C31.8049 31.0086 31.8233 30.9639 31.8398 30.9253C31.8561 30.8872 31.8669 30.8632 31.8748 30.8469C31.8879 30.8197 31.8853 30.8291 31.8718 30.8465L30.2914 29.6209C30.1087 29.8565 30.0104 30.1144 29.932 30.3039L31.7804 31.0677Z" fill="#B31312"/>
                            <path d="M30.992 31V31C29.181 32.2106 26.8189 32.2106 25.0078 31V31" stroke="#B31312" stroke-width="2"/>
                        </svg>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p style="font-size: 32px;font-weight: 500; text-align: center;">동아리 개설자만 작성하실 수 있습니다.</p>
                    </div>
                        <div style="text-align: center;margin-bottom:20px;" data-dismiss="modal" aria-label="Close">
                            <svg width="347" height="48" viewBox="0 0 347 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <g filter="url(#filter0_d_662_7594)">
                                    <rect x="2" y="1" width="343" height="44" rx="8" fill="#EF7353"/>
                                    <rect x="2.5" y="1.5" width="342" height="43" rx="7.5" stroke="#D92D20"/>
                                    <path d="M162.5 22.376H164.628V24.504H162.5V22.376ZM168.772 15.624H170.9V25.704H168.772V15.624ZM170.148 19.848H172.756V21.592H170.148V19.848ZM159.204 25.416L158.964 23.768C161.62 23.768 165.124 23.752 168.116 23.384L168.276 24.84C165.188 25.368 161.796 25.4 159.204 25.416ZM160.852 26.296H170.9V30.424H168.772V27.928H160.852V26.296ZM159.348 16.696H167.748V18.216H159.348V16.696ZM163.556 18.568C165.732 18.568 167.156 19.416 167.156 20.776C167.156 22.136 165.732 22.984 163.556 22.984C161.364 22.984 159.94 22.136 159.94 20.776C159.94 19.416 161.364 18.568 163.556 18.568ZM163.556 19.96C162.548 19.96 161.956 20.216 161.956 20.776C161.956 21.304 162.548 21.592 163.556 21.592C164.548 21.592 165.14 21.304 165.14 20.776C165.14 20.216 164.548 19.96 163.556 19.96ZM162.5 15.496H164.628V17.384H162.5V15.496ZM184.035 15.624H186.179V26.264H184.035V15.624ZM176.307 28.472H186.547V30.168H176.307V28.472ZM176.307 25.192H178.435V29.16H176.307V25.192ZM178.115 16.552C180.387 16.552 182.131 18.12 182.131 20.312C182.131 22.488 180.387 24.072 178.115 24.072C175.843 24.072 174.083 22.488 174.083 20.312C174.083 18.12 175.843 16.552 178.115 16.552ZM178.115 18.392C177.011 18.392 176.163 19.096 176.163 20.312C176.163 21.512 177.011 22.216 178.115 22.216C179.203 22.216 180.051 21.512 180.051 20.312C180.051 19.096 179.203 18.392 178.115 18.392Z" fill="white"/>
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
                </div>
            </div>
        </div>

            <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <svg width="56" height="56" viewBox="0 0 56 56" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <rect x="4" y="4" width="48" height="48" rx="24" fill="#FEE4E2"/>
                                <rect x="4" y="4" width="48" height="48" rx="24" stroke="#FEF3F2" stroke-width="8"/>
                                <path d="M25.1438 30.6858L24.2196 31.0677L25.1438 30.6858ZM24.9184 30.2337L24.1282 30.8465L24.9184 30.2337ZM31.0816 30.2337L31.8718 30.8465L31.0816 30.2337ZM33 25C33 26.6366 32.2147 28.0895 30.9962 29.0033L32.1961 30.6034C33.8966 29.3282 35 27.2928 35 25H33ZM28 20C30.7614 20 33 22.2386 33 25H35C35 21.134 31.866 18 28 18V20ZM23 25C23 22.2386 25.2386 20 28 20V18C24.134 18 21 21.134 21 25H23ZM25.0038 29.0033C23.7853 28.0895 23 26.6366 23 25H21C21 27.2928 22.1034 29.3282 23.8039 30.6034L25.0038 29.0033ZM26.9973 34.743C26.9654 33.2148 26.6489 31.7097 26.068 30.3039L24.2196 31.0677C24.706 32.2449 24.971 33.5051 24.9978 34.7848L26.9973 34.743ZM29.3416 34.2111C28.4971 34.6334 27.5029 34.6334 26.6584 34.2111L25.7639 36C27.1716 36.7038 28.8284 36.7038 30.2361 36L29.3416 34.2111ZM29.932 30.3039C29.3511 31.7097 29.0346 33.2148 29.0027 34.743L31.0022 34.7848C31.029 33.5051 31.294 32.2449 31.7804 31.0677L29.932 30.3039ZM30.2361 36C30.708 35.764 30.9917 35.2888 31.0022 34.7848L29.0027 34.743C29.0072 34.5284 29.1285 34.3177 29.3416 34.2111L30.2361 36ZM24.9978 34.7848C25.0083 35.2888 25.292 35.764 25.7639 36L26.6584 34.2111C26.8715 34.3177 26.9928 34.5284 26.9973 34.743L24.9978 34.7848ZM23.8039 30.6034C23.9548 30.7165 24.043 30.7829 24.1052 30.8338C24.1678 30.885 24.156 30.8824 24.1282 30.8465L25.7086 29.6209C25.5215 29.3795 25.2307 29.1734 25.0038 29.0033L23.8039 30.6034ZM26.068 30.3039C25.9896 30.1144 25.8913 29.8565 25.7086 29.6209L24.1282 30.8465C24.1147 30.8291 24.1121 30.8197 24.1252 30.8469C24.1331 30.8632 24.1439 30.8872 24.1602 30.9253C24.1767 30.9639 24.1951 31.0086 24.2196 31.0677L26.068 30.3039ZM30.9962 29.0033C30.7693 29.1734 30.4785 29.3795 30.2914 29.6209L31.8718 30.8465C31.844 30.8824 31.8322 30.885 31.8948 30.8338C31.957 30.7829 32.0452 30.7165 32.1961 30.6034L30.9962 29.0033ZM31.7804 31.0677C31.8049 31.0086 31.8233 30.9639 31.8398 30.9253C31.8561 30.8872 31.8669 30.8632 31.8748 30.8469C31.8879 30.8197 31.8853 30.8291 31.8718 30.8465L30.2914 29.6209C30.1087 29.8565 30.0104 30.1144 29.932 30.3039L31.7804 31.0677Z" fill="#B31312"/>
                                <path d="M30.992 31V31C29.181 32.2106 26.8189 32.2106 25.0078 31V31" stroke="#B31312" stroke-width="2"/>
                            </svg>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p style="font-size: 32px;font-weight: 500; text-align: center;">동아리 개설자는 신청할 수 없습니다.</p>
                        </div>
                        <div style="text-align: center;margin-bottom:20px;" data-dismiss="modal" aria-label="Close">
                            <svg width="347" height="48" viewBox="0 0 347 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <g filter="url(#filter0_d_662_7594)">
                                    <rect x="2" y="1" width="343" height="44" rx="8" fill="#EF7353"/>
                                    <rect x="2.5" y="1.5" width="342" height="43" rx="7.5" stroke="#D92D20"/>
                                    <path d="M162.5 22.376H164.628V24.504H162.5V22.376ZM168.772 15.624H170.9V25.704H168.772V15.624ZM170.148 19.848H172.756V21.592H170.148V19.848ZM159.204 25.416L158.964 23.768C161.62 23.768 165.124 23.752 168.116 23.384L168.276 24.84C165.188 25.368 161.796 25.4 159.204 25.416ZM160.852 26.296H170.9V30.424H168.772V27.928H160.852V26.296ZM159.348 16.696H167.748V18.216H159.348V16.696ZM163.556 18.568C165.732 18.568 167.156 19.416 167.156 20.776C167.156 22.136 165.732 22.984 163.556 22.984C161.364 22.984 159.94 22.136 159.94 20.776C159.94 19.416 161.364 18.568 163.556 18.568ZM163.556 19.96C162.548 19.96 161.956 20.216 161.956 20.776C161.956 21.304 162.548 21.592 163.556 21.592C164.548 21.592 165.14 21.304 165.14 20.776C165.14 20.216 164.548 19.96 163.556 19.96ZM162.5 15.496H164.628V17.384H162.5V15.496ZM184.035 15.624H186.179V26.264H184.035V15.624ZM176.307 28.472H186.547V30.168H176.307V28.472ZM176.307 25.192H178.435V29.16H176.307V25.192ZM178.115 16.552C180.387 16.552 182.131 18.12 182.131 20.312C182.131 22.488 180.387 24.072 178.115 24.072C175.843 24.072 174.083 22.488 174.083 20.312C174.083 18.12 175.843 16.552 178.115 16.552ZM178.115 18.392C177.011 18.392 176.163 19.096 176.163 20.312C176.163 21.512 177.011 22.216 178.115 22.216C179.203 22.216 180.051 21.512 180.051 20.312C180.051 19.096 179.203 18.392 178.115 18.392Z" fill="white"/>
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
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" style="max-width: none" role="document">
                <div class="modal-content" style="width: 900px;height: 1000px; margin-left: 44px">
                    <div class="modal-body" style="padding: 0">
                        <div class="input-group" style="margin-bottom: 10px;margin-left: 44px;">
                            <div id="noticeTitles" style="font-size: 60px; width: 90%;height: 50px;font-weight:500;margin-top: 40px;"></div>
                        </div>
                        <div class="input-group" style="margin-left: 44px;">
                            <div id="noticeContents" style="width: 90%;height: 700px;font-size: 40px;margin-top:50px;"></div>
                        </div>
                    </div>
                    <a id="create" onclick="createNotice()" data-dismiss="modal" aria-label="Close">
                    </a>
                </div>
            </div>
        </div>

        <div class="conbox con2">
                <div onclick="checkMemberAndOpenModal()">
                    <svg style="margin-top:10px; margin-bottom:10px; margin-left: 790px;" width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M17.2047 10.7962L19.0007 9.00019C19.546 8.45494 19.8186 8.18231 19.9644 7.88822C20.2416 7.32866 20.2416 6.67171 19.9644 6.11215C19.8186 5.81806 19.546 5.54544 19.0007 5.00019C18.4555 4.45494 18.1829 4.18231 17.8888 4.03658C17.3292 3.75929 16.6723 3.75929 16.1127 4.03658C15.8186 4.18231 15.546 4.45494 15.0007 5.00019L13.1821 6.81884C14.146 8.46944 15.5321 9.845 17.2047 10.7962ZM11.7276 8.2733L4.85713 15.1438C4.43207 15.5689 4.21954 15.7814 4.0798 16.0425C3.94007 16.3036 3.88112 16.5983 3.76323 17.1878L3.14784 20.2648C3.08131 20.5974 3.04805 20.7637 3.14266 20.8583C3.23727 20.9529 3.40357 20.9196 3.73618 20.8531L6.81316 20.2377C7.40262 20.1198 7.69734 20.0609 7.95844 19.9211C8.21954 19.7814 8.43207 19.5689 8.85713 19.1438L15.7465 12.2544C14.1249 11.2388 12.7532 9.87646 11.7276 8.2733Z" fill="#222222"/>
                    </svg>
                </div>

                <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <svg width="56" height="56" viewBox="0 0 56 56" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <rect x="4" y="4" width="48" height="48" rx="24" fill="#FEE4E2"/>
                                    <rect x="4" y="4" width="48" height="48" rx="24" stroke="#FEF3F2" stroke-width="8"/>
                                    <path d="M25.1438 30.6858L24.2196 31.0677L25.1438 30.6858ZM24.9184 30.2337L24.1282 30.8465L24.9184 30.2337ZM31.0816 30.2337L31.8718 30.8465L31.0816 30.2337ZM33 25C33 26.6366 32.2147 28.0895 30.9962 29.0033L32.1961 30.6034C33.8966 29.3282 35 27.2928 35 25H33ZM28 20C30.7614 20 33 22.2386 33 25H35C35 21.134 31.866 18 28 18V20ZM23 25C23 22.2386 25.2386 20 28 20V18C24.134 18 21 21.134 21 25H23ZM25.0038 29.0033C23.7853 28.0895 23 26.6366 23 25H21C21 27.2928 22.1034 29.3282 23.8039 30.6034L25.0038 29.0033ZM26.9973 34.743C26.9654 33.2148 26.6489 31.7097 26.068 30.3039L24.2196 31.0677C24.706 32.2449 24.971 33.5051 24.9978 34.7848L26.9973 34.743ZM29.3416 34.2111C28.4971 34.6334 27.5029 34.6334 26.6584 34.2111L25.7639 36C27.1716 36.7038 28.8284 36.7038 30.2361 36L29.3416 34.2111ZM29.932 30.3039C29.3511 31.7097 29.0346 33.2148 29.0027 34.743L31.0022 34.7848C31.029 33.5051 31.294 32.2449 31.7804 31.0677L29.932 30.3039ZM30.2361 36C30.708 35.764 30.9917 35.2888 31.0022 34.7848L29.0027 34.743C29.0072 34.5284 29.1285 34.3177 29.3416 34.2111L30.2361 36ZM24.9978 34.7848C25.0083 35.2888 25.292 35.764 25.7639 36L26.6584 34.2111C26.8715 34.3177 26.9928 34.5284 26.9973 34.743L24.9978 34.7848ZM23.8039 30.6034C23.9548 30.7165 24.043 30.7829 24.1052 30.8338C24.1678 30.885 24.156 30.8824 24.1282 30.8465L25.7086 29.6209C25.5215 29.3795 25.2307 29.1734 25.0038 29.0033L23.8039 30.6034ZM26.068 30.3039C25.9896 30.1144 25.8913 29.8565 25.7086 29.6209L24.1282 30.8465C24.1147 30.8291 24.1121 30.8197 24.1252 30.8469C24.1331 30.8632 24.1439 30.8872 24.1602 30.9253C24.1767 30.9639 24.1951 31.0086 24.2196 31.0677L26.068 30.3039ZM30.9962 29.0033C30.7693 29.1734 30.4785 29.3795 30.2914 29.6209L31.8718 30.8465C31.844 30.8824 31.8322 30.885 31.8948 30.8338C31.957 30.7829 32.0452 30.7165 32.1961 30.6034L30.9962 29.0033ZM31.7804 31.0677C31.8049 31.0086 31.8233 30.9639 31.8398 30.9253C31.8561 30.8872 31.8669 30.8632 31.8748 30.8469C31.8879 30.8197 31.8853 30.8291 31.8718 30.8465L30.2914 29.6209C30.1087 29.8565 30.0104 30.1144 29.932 30.3039L31.7804 31.0677Z" fill="#B31312"/>
                                    <path d="M30.992 31V31C29.181 32.2106 26.8189 32.2106 25.0078 31V31" stroke="#B31312" stroke-width="2"/>
                                </svg>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p style="font-size: 32px;font-weight: 500; text-align: center;">동아리 멤버만 작성하실 수 있습니다.</p>
                            </div>
                            <div style="text-align: center;margin-bottom:20px;" data-dismiss="modal" aria-label="Close">
                                <svg width="347" height="48" viewBox="0 0 347 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <g filter="url(#filter0_d_662_7594)">
                                        <rect x="2" y="1" width="343" height="44" rx="8" fill="#EF7353"/>
                                        <rect x="2.5" y="1.5" width="342" height="43" rx="7.5" stroke="#D92D20"/>
                                        <path d="M162.5 22.376H164.628V24.504H162.5V22.376ZM168.772 15.624H170.9V25.704H168.772V15.624ZM170.148 19.848H172.756V21.592H170.148V19.848ZM159.204 25.416L158.964 23.768C161.62 23.768 165.124 23.752 168.116 23.384L168.276 24.84C165.188 25.368 161.796 25.4 159.204 25.416ZM160.852 26.296H170.9V30.424H168.772V27.928H160.852V26.296ZM159.348 16.696H167.748V18.216H159.348V16.696ZM163.556 18.568C165.732 18.568 167.156 19.416 167.156 20.776C167.156 22.136 165.732 22.984 163.556 22.984C161.364 22.984 159.94 22.136 159.94 20.776C159.94 19.416 161.364 18.568 163.556 18.568ZM163.556 19.96C162.548 19.96 161.956 20.216 161.956 20.776C161.956 21.304 162.548 21.592 163.556 21.592C164.548 21.592 165.14 21.304 165.14 20.776C165.14 20.216 164.548 19.96 163.556 19.96ZM162.5 15.496H164.628V17.384H162.5V15.496ZM184.035 15.624H186.179V26.264H184.035V15.624ZM176.307 28.472H186.547V30.168H176.307V28.472ZM176.307 25.192H178.435V29.16H176.307V25.192ZM178.115 16.552C180.387 16.552 182.131 18.12 182.131 20.312C182.131 22.488 180.387 24.072 178.115 24.072C175.843 24.072 174.083 22.488 174.083 20.312C174.083 18.12 175.843 16.552 178.115 16.552ZM178.115 18.392C177.011 18.392 176.163 19.096 176.163 20.312C176.163 21.512 177.011 22.216 178.115 22.216C179.203 22.216 180.051 21.512 180.051 20.312C180.051 19.096 179.203 18.392 178.115 18.392Z" fill="white"/>
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
                        </div>
                    </div>
                </div>
            <div id="historyContainer"></div>
        </div>

    </div>
</main>
</body>
</html>