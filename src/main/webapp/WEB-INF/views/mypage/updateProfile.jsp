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
            margin: 100px auto 50px;
            display: flex;
            align-items: center;
            padding-left: 30px;
            font-size: 36px;
            border : 2px solid #6FC173;
            border-radius: 5%;
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
            <div class="profile-header">
                <img src="/resources/image/sample.png" alt="프로필 이미지" class="profile-pic">
                <div class="user-info">
                    <h3>김은채</h3>
                    <p>IT 인프라 사업부 (선임)</p>
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
                    <label for="affiliation">소속(직급)</label>
                    <input type="text" id="affiliation" name="affiliation" placeholder="IT 인프라 사업부 (선임)"> <br/>
                </div>
                <!-- 사번 필드 -->
                <div class="form-label">
                    <label for="employee-number">사번</label>
                    <input type="text" id="employee-number" name="employee_number" placeholder="20241111"> <br/>
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

</script>
</html>