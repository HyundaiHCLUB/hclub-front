<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<%-- @author 이혜연--%>
<%-- @description: 동아리 개설 - 동아리명/소개 작성 페이지--%>
<%-- ===========================--%>
<%-- AUTHOR      NOTE--%>
<%-- -----------------------------%>
<%-- 이혜연       최초 생성--%>
<%-- ===========================--%>

<head>
    <link rel="stylesheet" href="/resources/css/club/club.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/comp/compCreateTeam.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
    <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>동아리 개설</title>
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" src="/resources/js/write.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var plusButton = document.querySelector('.plus-button');
            var fileInput = document.getElementById('file');
            var imageUploadContainer = document.querySelector('.image-upload-container');

            plusButton.addEventListener('click', function () {
                fileInput.click();
            });

            fileInput.addEventListener('change', function () {
                if (this.files && this.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        try {
                            let imgDataUrl = e.target.result;
                            plusButton.style.display = 'none';
                            console.log(e.target)
                            let img = document.createElement("img");
                            img.setAttribute("src", imgDataUrl);
                            img.style.width = "500px";
                            img.style.height = "500px";
                            img.style.border = "none";
                            img.style.objectFit = "cover";
                            img.style.borderRadius = "40%";

                            imageUploadContainer.appendChild(img);

                            localStorage.setItem('clubFile', imgDataUrl);
                            console.log("Image saved to localStorage.");
                        } catch (error) {
                            if (e == QUOTA_EXCEEDED_ERR) {
                                alert("Error: Local Storage limit exceeds.");
                            } else {
                                console.log("Error saving image to localStorage.", e);
                            }
                        }

                    };
                    reader.readAsDataURL(this.files[0]);
                }
            });


            fileInput.addEventListener('change', function () {
                var files = fileInput.files;
            });

        })

        function handleNextButtonClick() {
            var clubTitleValue = document.getElementById('clubTitle').value;
            var clubInfoValue = document.getElementById('clubInfo').value;
            var fileInput = document.getElementById('file');

            sessionStorage.setItem('clubTitle', clubTitleValue);
            sessionStorage.setItem('clubInfo', clubInfoValue);

            window.location.href = '/club/add/preview';
        }
    </script>
</head>

<body>
<main class="main-container">
    <div style="display: flex">
        <img style="height: 50px;width: 50px;color: #46675c;margin-top: 65px;" onclick="history.back()"
             src="/resources/image/left-arrow.png">
        <p class="plus-title">동아리 이름과 내용을 입력해주세요</p>
    </div>
    <svg viewBox="0 0 205 3" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect width="100%" height="1" fill="#46675C"/>
    </svg>

    <input type="hidden" name="boardId">
    <div class="input-group">
        <input id="clubTitle" style="font-size: 50px; padding:12px; width: 95%;height: 50px;" name="boardSubject"
               type="text" placeholder="동아리명을 입력해 주세요.">
    </div>


    <input type="file" id="file" style="display: none;" multiple>
    <div class="plus-button"></div>
    <div class="image-upload-container"
    ></div>

    <div class="input-group">
        <textarea id="clubInfo" style="width: 95%;height: 600px;padding:12px;font-size: 44px;"
                  placeholder="내용을 상세히 입력해주세요."></textarea>
    </div>

    <div class="next_button" onclick="handleNextButtonClick()">
        <svg width="700" height="100" viewBox="0 0 350 50" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect width="350" height="50" rx="20" fill="#46675C"/>
            <path d="M171.896 17.9347H173.772V30.9407H171.896V17.9347ZM173.352 22.7367H175.648V24.2627H173.352V22.7367ZM164.112 26.2787H165.204C167.388 26.2787 169.11 26.2087 171.014 25.8727L171.196 27.4127C169.236 27.7627 167.458 27.8187 165.204 27.8187H164.112V26.2787ZM164.112 19.1387H170.16V20.6367H165.96V27.0207H164.112V19.1387ZM182.353 18.1867C185.209 18.1867 187.043 19.1527 187.043 20.7207C187.043 22.2887 185.209 23.2407 182.353 23.2407C179.497 23.2407 177.663 22.2887 177.663 20.7207C177.663 19.1527 179.497 18.1867 182.353 18.1867ZM182.353 19.6287C180.575 19.6287 179.581 19.9787 179.581 20.7207C179.581 21.4487 180.575 21.8127 182.353 21.8127C184.117 21.8127 185.125 21.4487 185.125 20.7207C185.125 19.9787 184.117 19.6287 182.353 19.6287ZM177.845 26.3487H186.805V30.7727H177.845V26.3487ZM184.985 27.8187H179.679V29.3027H184.985V27.8187ZM176.487 23.9827H188.205V25.4527H176.487V23.9827Z"
                  fill="white"/>
        </svg>
    </div>

</main>
</body>
</html>