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
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
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
    <script>

    </script>
    <script>
        var dropFile;

        window.addEventListener('load', function() {
            dropFile = new DropFile("drop-file", "files");

        });

        function DropFile(dropAreaId, fileListId) {
            let dropArea = document.getElementById(dropAreaId);
            let fileList = document.getElementById(fileListId);

            function preventDefaults(e) {
                e.preventDefault();
                e.stopPropagation();
            }

            function highlight(e) {
                preventDefaults(e);
                dropArea.classList.add("highlight");
            }

            function unhighlight(e) {
                preventDefaults(e);
                dropArea.classList.remove("highlight");
            }

            function handleDrop(e) {
                unhighlight(e);
                let dt = e.dataTransfer;
                let files = dt.files;

                handleFiles(files);

                const fileList = document.getElementById(fileListId);
                if (fileList) {
                    fileList.scrollTo({ top: fileList.scrollHeight });
                }
            }

            function handleFiles(files) {
                files = [...files];
                // files.forEach(uploadFile);
                files.forEach(previewFile);
            }

            function previewFile(file) {
                console.log(file);
                renderFile(file);
            }

            function renderFile(file) {
                let reader = new FileReader();
                reader.onload = function (e) {
                    let img = dropArea.querySelector(".preview");
                    img.src = e.target.result;
                    img.style.display = "block";
                };
                reader.readAsDataURL(file);
            }

            dropArea.addEventListener("dragenter", highlight, false);
            dropArea.addEventListener("dragover", highlight, false);
            dropArea.addEventListener("dragleave", unhighlight, false);
            dropArea.addEventListener("drop", handleDrop, false);

            return {
                handleFiles
            };
        }
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            accessToken = localStorage.getItem("accessTokenInfo");
            var titleInput = document.getElementById('clubTitle');
            var title = titleInput.value;
            console.log(accessToken)
            console.log(title)

            var dropFile;

            window.addEventListener('load', function () {
                dropFile = new DropFile("drop-file", "files");
            });

            function DropFile(dropAreaId, fileListId) {
                return {
                    handleFiles
                };
            }

            titleInput.addEventListener('input', function () {
                title = titleInput.value;
                console.log(title);
            });

            document.querySelector('.file-label:last-of-type').addEventListener('click', function () {
                var clubNo = <%= request.getAttribute("clubNo") %>;

                var fileInput = document.getElementById('chooseFile');
                var file = fileInput.files[0];

                var formData = new FormData();
                var historyInfo = JSON.stringify({ title: title });

                formData.append('image', file);
                formData.append('request', new Blob([historyInfo], { type: 'application/json' }));

                $.ajax({
                    //url: 'http://localhost:8081/clubs/' + clubNo + '/history',
                    url: 'https://www.h-club.site/clubs/' + clubNo + '/history',
                    type: 'POST',
                    headers: {
                        'accessTokenInfo': accessToken,
                    },
                    data: formData,
                    dataType: 'text',
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        console.log(response);
                        history.back();
                    },
                    error: function (error) {
                        console.error("에러 발생:", error);
                    }
                });
            });
        });

    </script>
    <style>
        #root {
            width: 100%;
            margin: 0 auto;
            max-width: 800px;
        }

        .title {
            text-align: center;
        }

        .contents {
            display: flex;
            flex-direction: row;
            margin-top: 30px;
        }
        .contents .upload-box {
            width: 100%;
            margin-right: 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .contents .upload-box .drag-file {
            position: relative;
            width: 800px;
            height: 800px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border: 3px dashed #dbdbdb;
        }
        .contents .upload-box .drag-file.highlight {
            border: 3px dashed red;
        }
        .contents .upload-box .drag-file .image {
            width: 40px;
        }
        .contents .upload-box .drag-file .message {
            margin-bottom: 0;
        }
        .contents .upload-box .drag-file .preview {
            display: none;
            position: absolute;
            left: 0;
            height: 800px;
            width: 100%;
        }
        .contents .upload-box .file-label {
            margin-top: 30px;
            text-size: 24px;
            font-weight: bold;
            background-color: #46675C;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            width: 70%;
            height: 50px;
            border-radius: 16px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .contents .upload-box .file {
            display: none;
        }

        @media (max-width: 700px) {
            .contents {
                display: flex;
                flex-direction: column;
                margin-top: 30px;
            }
            .contents .upload-box {
                width: 100%;
                box-sizing: border-box;
                margin-right: 0;
            }
            .contents .upload-box .drag-file {
                height: 150px;
            }
            .contents .files {
                width: 100%;
                box-sizing: border-box;
                margin-right: 0;
                overflow: initial;
            }
        }
    </style>
</head>

<body>
<main class="main-container">
    <div style="display: flex">
        <img style="height: 50px;width: 50px;color: #46675c;margin-top: 65px;" onclick="history.back()" src="/resources/image/left-arrow.png">
        <p class="plus-title">추억 기록 📸✨</p>
    </div>

    <div class="input-group">
        <input id="clubTitle" style="font-size: 36px; width: 90%;height: 50px;" name="boardSubject" type="text" value="제목을 입력해 주세요.">
    </div>
    <div id="root">
        <hr>
        <div class="contents">
            <div class="upload-box">
                <div id="drop-file" class="drag-file">
                    <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image" >
                    <p class="message">이미지를 드래그하세요</p>
                    <img src="" alt="미리보기 이미지" class="preview">
                </div>
                <label class="file-label" for="chooseFile"><p style="font-weight: bold;font-size: 24px;color: white">이미지를 선택하세요</p></label>
                <input class="file" id="chooseFile" type="file" onchange="dropFile.handleFiles(this.files)" accept="image/png, image/jpeg, image/gif">
                <label class="file-label"><p style="font-weight: bold;font-size: 24px;color: white">업로드</p></label>
            </div>

        </div>
    </div>

</main>
</body>
</html>