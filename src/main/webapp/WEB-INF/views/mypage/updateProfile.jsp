<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>H-Club</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/mypage.css">
    <link rel="stylesheet" href="/resources/css/compMain.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/5ba1c6c3a8.js" crossorigin="anonymous"></script> <!-- font awesome icons-->
    <style>
        #wrapper {
            display: flex;
            flex-direction: column;
        }
        .profile-header {
            width: 80%;
            height: 400px;
            margin: 10px auto 50px;
            display: flex;
            align-items: center;
            border-radius: 5%;
            font-size: 36px;
        }
        .profile-pic {
            width: 250px;
            height: 250px;
            border-radius: 50%;
            margin: auto 50px;
            border: 8px solid #6FC173;
        }
        .user-info {
            margin-left: 20px;
        }
        .user-info h3 {
            font-size: 1.2em;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .user-info p {
            font-size: 1.1em;
            margin-top: 0;
        }
        #userName {
            font-size: 1.8em;
        }
        #userDept {
            font-size: 1em;
            margin-bottom: 30px;
        }
        #profile-form{
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
        input[readonly] {
            background-color: #d3d3d3;
        }
        .user-rating {
            display: flex; /* Flexbox 레이아웃 사용 */
            align-items: center; /* 세로축(center)을 기준으로 자식 요소들을 가운데 정렬 */
            gap: 10px; /* 이미지와 텍스트 사이에 10px의 간격을 줌 */
        }
        .user-rating img {
            width: 40px;
            height: 40px;
        }

        #userRating {
            line-height: 40px; /* Set line-height equal to the height of the image for vertical alignment */
            margin: 0; /* Remove default margin */
            display: flex; /* Use flex to align text */
            align-items: center; /* Align text to the center vertically */
            height: 40px; /* Ensure the div height matches the image height */
            font-weight: bold;
            color: #0061f7;
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
                <div class="user-rating">
                    <img src="/resources/image/comp/rating.svg"/>
                    <p style="margin-bottom: 0; margin-right: 10px;">레이팅  </p>
                    <p id="userRating"></p>
                </div>
            </div>
        </div>
        <form id="profile-form">
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
    /* 로그인 되어있지 않은 사용자 -> 홈으로 리다이렉트 */
    document.addEventListener("DOMContentLoaded", function() {
        let accessToken = localStorage.getItem("accessTokenInfo");
        if (!accessToken) {
            alert("로그인이 필요한 페이지입니다.");
            window.location.href = "/"; // 로그인 페이지 URL로 변경하세요.
        }
    });
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
            $('#userRating').text(memberInfo.memberRating); // 부서와 직급 설정
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
                url: 'https://www.h-club.site/auth/mypage/info',
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

    document.getElementById('profile-form').addEventListener('submit', function(event) {
        event.preventDefault(); // 폼의 기본 제출 동작을 중단

        // 비밀번호 필드의 값 가져오기
        var password = document.getElementById('password').value;
        var passwordCheck = document.getElementById('password-check').value;

        // null  체크
        if (password === '' && passwordCheck === '') {
            window.location.href = '/mypage';
            return; // 함수 실행 중단
        }

        // 비밀번호 일치 여부 확인
        if (password !== passwordCheck) {
            alert("비밀번호 확인이 일치하지 않습니다");
            return; // 함수 실행 중단
        }

        // 비밀번호 변경 API 호출 (예시)
        updatePassword(password, function(success) {
            console.log('input password : ' + password);
            if (success) {
                // 비밀번호 변경 성공시 다른 페이지로 이동
                window.location.href = '/mypage';
            } else {
                // 실패 메시지 띄우기
                alert("비밀번호 변경에 실패했습니다");
            }
        });
    });

    function updatePassword(password, callback) {
        fetch(
            // 'https://www.h-club.site/auth/mypage',
            'http://localhost:8080/auth/mypage',
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({memberId:memberId, memberPw: password})
            })
            .then(response => {
                if(response.ok) {
                    return response.text(); // 응답을 텍스트로 처리
                } else {
                    throw new Error('Network response was not ok.'); // 오류 처리
                }
            })
            .then(data => {
                if (data == 'success') {
                    callback(true); // 성공 콜백 호출
                } else {
                    callback(false); // 실패 콜백 호출
                }
            })
            .catch(error => {
                callback(false); // 실패 콜백 호출
            });
    }
</script>
</html>
