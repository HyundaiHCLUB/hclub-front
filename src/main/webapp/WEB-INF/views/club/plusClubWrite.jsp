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
  <title>동아리 개설</title>
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
  <script type="text/javascript" src="/resources/js/write.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', function () {
      function handleFileInputChange() {
        var fileInput = document.getElementById('file');
        var reader = new FileReader();
        reader.onload = function (e) {
          var fileBlob = e.target.result;
          localStorage.setItem('clubFile', fileBlob);
          localStorage.setItem('clubFileName', fileInput.files[0].name);
        };
        reader.readAsDataURL(fileInput.files[0]);

        var previewImage = document.getElementById('previewImage');
        var defaultImage = document.getElementById('defaultImage');

        if (fileInput.files && fileInput.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
            previewImage.src = e.target.result;
            previewImage.style.display = 'block';
            defaultImage.style.display = 'none';
          };

          reader.readAsDataURL(fileInput.files[0]);
        } else {
          previewImage.style.display = 'none';
          defaultImage.style.display = 'block';
        }
      }

      document.getElementById('file').addEventListener('change', handleFileInputChange);
    });
  </script>

  <script>
    function handleNextButtonClick() {
      console.log('버튼 클릭');
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
    <img style="height: 50px;width: 50px;color: #46675c;margin-top: 65px;" onclick="history.back()" src="/resources/image/left-arrow.png">
    <p class="plus-title">동아리 이름과 내용을 입력해주세요</p>
  </div>
  <svg viewBox="0 0 205 3" fill="none" xmlns="http://www.w3.org/2000/svg">
    <rect width="100%" height="1" fill="#46675C"/>
  </svg>

    <input type="hidden" name="boardId">
    <div class="input-group">
      <input id="clubTitle" style="font-size: 36px; width: 90%;height: 50px;" name="boardSubject" type="text" value="동아리명을 입력해 주세요.">
    </div>
  <input style="margin: auto;display: block;" name="file" type="file" id="file">

  <img class="club-image" id="previewImage" style="max-width: 100%; display: none; margin-top: 10px;" />
  <img class="club-image" id="defaultImage" src="/resources/image/default-image.jpg" style="max-width: 100%; margin-top: 10px;" />

  <div class="input-group">
      <textarea id="clubInfo" style="width: 90%;height: 600px;font-size: 36px;" placeholder="내용을 상세히 입력해주세요." ></textarea>
    </div>

  <div class="next_button" onclick="handleNextButtonClick()">
  <svg width="700" height="250" viewBox="0 0 350 50" fill="none" xmlns="http://www.w3.org/2000/svg">
    <rect width="350" height="50" rx="20" fill="#46675C"/>
    <path d="M171.896 17.9347H173.772V30.9407H171.896V17.9347ZM173.352 22.7367H175.648V24.2627H173.352V22.7367ZM164.112 26.2787H165.204C167.388 26.2787 169.11 26.2087 171.014 25.8727L171.196 27.4127C169.236 27.7627 167.458 27.8187 165.204 27.8187H164.112V26.2787ZM164.112 19.1387H170.16V20.6367H165.96V27.0207H164.112V19.1387ZM182.353 18.1867C185.209 18.1867 187.043 19.1527 187.043 20.7207C187.043 22.2887 185.209 23.2407 182.353 23.2407C179.497 23.2407 177.663 22.2887 177.663 20.7207C177.663 19.1527 179.497 18.1867 182.353 18.1867ZM182.353 19.6287C180.575 19.6287 179.581 19.9787 179.581 20.7207C179.581 21.4487 180.575 21.8127 182.353 21.8127C184.117 21.8127 185.125 21.4487 185.125 20.7207C185.125 19.9787 184.117 19.6287 182.353 19.6287ZM177.845 26.3487H186.805V30.7727H177.845V26.3487ZM184.985 27.8187H179.679V29.3027H184.985V27.8187ZM176.487 23.9827H188.205V25.4527H176.487V23.9827Z" fill="white"/>
  </svg>
  </div>

</main>
</body>
</html>