<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link rel="stylesheet" href="${path}/resources/css/main.css">
    <link rel="stylesheet" href="${path}/resources/css/mypage.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>프로필 수정</title>
    <style>
        #wrapper {
            display: flex;
            flex-direction: column;
        }
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }
        a:active {
            color: #4CAF50;
        }

        .profile-header {
            width: 80%;
            height: 400px;
            margin: 10px auto 50px;
            display: flex;
            align-items: center;
            /*border: 2px solid #E2FFD4;*/
            /*background-color: #E2FFD4;*/
            border-radius: 5%;
            padding-left: 30px;
            font-size: 36px;
        }

        .profile-pic {
            width: 250px;
            height: 250px;
            border-radius: 50%;
            margin: auto 50px;
        }

        .profile-form{
            margin: 30px auto;
            width: 80%;
        }
        .form-label {
            font-family: 'Arial', sans-serif;
            font-size: 2em;
            color: #333;
            margin-left: 20px;
            margin-bottom: 10px; /* Adjust as needed */
        }

        .form-label label {
            display: block;
            font-size: 1.5em; /* Adjust as needed */
            font-weight: bold;
            color: black; /* Adjust as needed */
            margin-bottom: 10px;
        }

        .form-label input[type="text"], .form-label input[type="password"] {
            font-size: 1em; /* Adjust as needed */
            padding: 8px 12px; /* Adjust as needed */
            border: 1px solid #000000; /* Adjust as needed */
            border-radius: 4px; /* Adjust as needed */
            width: 90%; /* Adjust as needed */
            height: 100px;
            box-sizing: border-box; /* Keeps padding inside width */
            margin-bottom: 10px; /* Adjust as needed */
        }

        /* Placeholder styling */
        .form-label input[type="text"]::placeholder {
            color: #aaa; /* Adjust as needed */
            font-size: 1em;
        }

        /* Focus state styling */
        .form-label input[type="text"]:focus {
            outline: none;
            border-color: #000000; /* Adjust as needed */
        }
        .form-label input {
            border-radius: 30%;
        }
        .btn-submit {
            display: block;
            width: 40%;
            font-size: 2em;
            text-align: center;
            font-weight: bold;
            border-style: none;
            border-radius: 30px;
            padding: 30px;
            margin :50px auto 10px;
            background: #46675C;
            color: white;
        }
    </style>
</head>
<body>
<main>
<div id="wrapper">
    <div class="mypage-top-menu">
        <img src="/resources/image/left-arrow.png"
             onclick="window.history.back()"/>
    </div>
            <div class="profile-header">
                <div id="profileImageContainer" onclick="document.getElementById('profileImageInput').click();">
                    <input type="file" id="profileImageInput" style="display: none;" accept="image/*" />
                    <img src="" class="profile-pic">
                </div>
                <div class="user-info">
                    <h3 id="userName"></h3>
                    <p id="userDept"></p>
                    <p id="userRating"></p>
                </div>
            </div>
            <form class="profile-form">
                <!-- 이름 필드 -->
                <div class="form-label">
                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" placeholder="이름" readonly> <br/>
                </div>
                <!-- 소속(직급) 필드 -->
                <div class="form-label">
                    <label for="dept">소속(직급)</label>
                    <input type="text" id="dept" name="dept" placeholder="IT 인프라 사업부 (선임)" readonly> <br/>
                </div>
                <!-- 아이디 필드 -->
                <div class="form-label">
                    <label for="userId">아이디</label>
                    <input type="text" id="userId" name="userId" placeholder="ID" readonly> <br/>
                </div>
                <!-- 비밀번호 필드 -->
                <div class="form-label">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password"><br/>
                </div>
                <div class="form-label">
                    <label for="password">비밀번호확인</label>
                    <input type="password" id="password-check" name="password"><br/>
                </div>
                <!-- 제출 버튼 -->
                <input type="submit" value="정보 업데이트" class="btn-submit"><br/>
            </form>
</div>
</main>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery CDN -->
<script src="https://kit.fontawesome.com/5ba1c6c3a8.js" crossorigin="anonymous"></script> <!-- font awesome icons-->
<script>
    var memberId;
    $(document).ready(function() {
        // 로컬 스토리지에서 JWT 가져오기
        let accessToken = localStorage.getItem("accessTokenInfo");

        // 가져온 JWT를 사용하여 사용자 정보 가져오기
        getUserInfo(accessToken).then(memberInfo => {
            console.log("memberID : " + memberInfo.member_id);
            memberId = memberInfo.member_id;
            $('#userName').text(memberInfo.employeeName); // 이름 설정
            $('#userDept').text(memberInfo.employeeDept + ' (' + memberInfo.employeePosition + ')'); // 부서와 직급 설정
            $('#userRating').text('레이팅 ' + memberInfo.memberRating); // 부서와 직급 설정
            $('.profile-pic').attr('src', memberInfo.memberImage); // 프로필 사진
            $('#name').val(memberInfo.employeeName);
            $('#dept').val(memberInfo.employeeDept + ' (' + memberInfo.employeePosition + ')');
            $('#userId').val(memberInfo.member_id);
        }).catch(error => {
            console.error('사용자 정보 가져오기 실패:', error);
        });
    });

    function getUserInfo(accessToken) {
        return new Promise((resolve, reject) => {
            $.ajax({
                type: 'GET',
                /* 테스트시 각자 설정한 auth 서버 포트번호로 대체하세요 */
                url: 'http://localhost:8080/auth/mypage/info',
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

    document.getElementById('profileImageInput').addEventListener('change', function(event) {
        var file = event.target.files[0];
        var formData = new FormData();
        var memberInfo = JSON.stringify({ memberId: memberId });

        formData.append('image', file);
        formData.append('memberId', new Blob([memberInfo], { type: 'application/json'}));
        $.ajax({
            // url: 'http://localhost:8080/auth/mypage/profile',
            url: 'https://www.h-club.site/auth/mypage/profile',
            type: 'POST',
            data: formData,
            dataType: 'text',
            processData: false, // FormData는 processData를 false로 설정해야 함
            contentType: false, // contentType도 false로 설정해야 함
            success: function(response) {
                // 성공 시, 프로필 이미지를 새로운 이미지로 변경
                $('.profile-pic').attr('src', response);
                console.log(response)
            },
            error: function(error) {
                alert('프로필 이미지 변경에 실패했습니다.');
                console.error("Error thrown:", error);
            }
        });
    });

</script>
</html>