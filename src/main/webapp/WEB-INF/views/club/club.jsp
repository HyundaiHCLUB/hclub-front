<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>동아리</title>
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
        $(document).ready(function () {
            $("#total").click(function () {
                $("#hiddenList").slideToggle();
            });
        });
    </script>

    <style>
        .main-container {
            min-height: 100px; /* 적절한 최소 높이 설정 */
        }

        .category {
            display: flex;
            justify-content: space-around;
            align-items: center;
            width: 100%;
        }

        .category-item {
            margin: 5px;
            text-align: center;
        }

        #hiddenList {
            margin: 5px;
            text-align: center;
        }
    </style>
\</head>

<body>
    <main class="main-container">
        <div class="category-item">
            <img id="total" src="/resources/image/category_total.png">
            <ul id="hiddenList" class="totalList" style="display: none;">
                <div class="category">
                    <div class="category-item">
                        <img src="/resources/image/category_foreign.png">
                    </div>
                    <div class="category-item">
                        <img src="/resources/image/category_game.png">
                    </div>
                    <div class="category-item">
                        <img src="/resources/image/category_culture.png">
                    </div>
                    <div class="category-item">
                        <img src="/resources/image/category_money.png">
                    </div>
                </div>
            </ul>
        </div>
        <div class="category">
            <div class="category-item">
                <img src="/resources/image/category_cooking.png">
            </div>
            <div class="category-item">
                <img src="/resources/image/category_activity.png">
            </div>
            <div class="category-item">
                <img src="/resources/image/category_travel.png">
            </div>
            <div class="category-item">
                <img src="/resources/image/category_self.png">
            </div>
        </div>
    </main>
</body>

</html>