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
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var categorySelections = document.querySelectorAll('.category-selection');

            categorySelections.forEach(function(selection) {
                selection.addEventListener('click', function() {
                    var previouslySelected = document.querySelector('.category-selection.selected');
                    if (previouslySelected) {
                        previouslySelected.classList.remove('selected');
                    }

                    selection.classList.add('selected');
                    var categoryName = selection.querySelector('.category_name').textContent.trim();
                    sessionStorage.setItem('selectedCategory', categoryName);

                    if (previouslySelected && previouslySelected !== selection) {
                        previouslySelected.classList.remove('selected');
                    }

                    console.log('선택된 카테고리: ' + categoryName);
                });
            });
        });
    </script>
    <style>
        .selected {
            background-color: #F1F5E8;
        }
    </style>
</head>

<body>
<main class="main-container">
    <div style="display: flex">
        <img style="height: 50px;width: 50px;color: #46675c;margin-top: 65px;" onclick="history.back()" src="/resources/image/left-arrow.png">
        <p class="plus-title">어떤 종류의 모임인가요?</p>
    </div>
    <svg viewBox="0 0 205 3" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect width="33.33%" height="1" fill="#46675C"/>
    </svg>

    <div class="category-selection">
        <div class="category-container">
            <svg width="140" height="140" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M29.8818 9.2258L21.0803 0.455149C20.793 0.165458 20.4024 0.00174518 19.9944 1.38718e-05C19.5864 -0.00171744 19.1944 0.158674 18.9046 0.445917L18.8954 0.455149L10.1247 9.2258H1.53871C1.13062 9.2258 0.739242 9.38791 0.450678 9.67647C0.162114 9.96504 0 10.3564 0 10.7645V38.4613C0 38.8694 0.162114 39.2608 0.450678 39.5493C0.739242 39.8379 1.13062 40 1.53871 40H38.4678C38.8758 40 39.2672 39.8379 39.5558 39.5493C39.8444 39.2608 40.0065 38.8694 40.0065 38.4613V10.7645C40.0065 10.3564 39.8444 9.96504 39.5558 9.67647C39.2672 9.38791 38.8758 9.2258 38.4678 9.2258H29.8818ZM20.0032 3.71721L25.5118 9.2258H14.4946L20.0032 3.71721ZM36.929 36.9226H3.07742V12.3032H36.929V36.9226ZM12.3097 21.5355C11.4935 21.5355 10.7107 21.2112 10.1336 20.6341C9.55649 20.057 9.23226 19.2742 9.23226 18.4581C9.23226 17.6419 9.55649 16.8591 10.1336 16.282C10.7107 15.7049 11.4935 15.3806 12.3097 15.3806C13.1259 15.3806 13.9086 15.7049 14.4857 16.282C15.0629 16.8591 15.3871 17.6419 15.3871 18.4581C15.3871 19.2742 15.0629 20.057 14.4857 20.6341C13.9086 21.2112 13.1259 21.5355 12.3097 21.5355ZM33.8516 33.8452H10.771L15.3871 24.6129L19.2339 32.3064L26.1581 18.4581L33.8516 33.8452Z" fill="#585C5D"/>
            </svg>
        </div>
        <div class="text-container">
            <p class="category_name">문화·예술</p>
            <p class="category_desc">전시·영화·뮤지컬·공연·박물관·연극 등</p>
        </div>
    </div>

    <div class="category-selection">
        <div class="category-container">
            <svg width="140" height="140" viewBox="0 0 32 41" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M19.6456 18.6787C19.8117 18.8336 19.9789 18.9803 20.1502 19.1167C21.4733 20.1782 22.8876 20.6346 24.2343 20.7064C26.5009 20.8275 28.5173 19.8162 29.3368 19.4039L29.5676 19.291C30.0596 19.059 30.4394 18.641 30.6233 18.129C30.8072 17.617 30.7801 17.0529 30.5481 16.5608C30.3161 16.0687 29.898 15.689 29.386 15.5051C28.874 15.3212 28.3099 15.3483 27.8178 15.5803L27.4753 15.7444C26.5686 16.1823 25.5604 16.6685 24.4527 16.61C23.9143 16.5803 23.3338 16.4111 22.7174 15.9167C22.0763 15.4018 21.3102 14.4654 20.5697 12.766C19.9697 11.3896 19.0753 10.3229 17.8056 9.71674C16.5892 9.13623 15.2948 9.11162 14.141 9.24905C11.0487 9.61623 8.69897 11.409 7.10103 13.0747C5.78514 14.4449 4.80361 15.9321 4.32156 16.6613C4.22412 16.81 4.1472 16.927 4.09181 17.0049C3.78784 17.4499 3.67122 17.9967 3.76716 18.527C3.86311 19.0574 4.1639 19.5286 4.60453 19.839C5.04515 20.1493 5.5902 20.2737 6.12185 20.1854C6.6535 20.0971 7.12903 19.8031 7.44564 19.3669C7.56051 19.2049 7.68667 19.0152 7.82718 18.8028C8.34 18.0316 9.04256 16.9752 10.061 15.9147C10.8631 15.0788 11.7615 14.3557 12.7502 13.8808L11.9984 15.9547C11.2395 18.0531 10.3954 20.4059 10.259 20.8777C10.1679 21.1967 10.1483 21.5318 10.2015 21.8592C10.2333 22.0664 10.2887 22.2418 10.3328 22.3649C10.42 22.609 10.5359 22.8408 10.6384 23.0274C10.8477 23.4131 11.1349 23.8572 11.4436 24.3074C12.0692 25.2213 12.9123 26.3443 13.7482 27.4315C14.4866 28.3905 15.2384 29.3454 15.8569 30.131L16.1041 30.4459C16.4364 30.8674 16.7143 31.2212 16.9184 31.4869C17.0107 31.6059 17.0723 31.69 17.1133 31.7433C17.1533 31.8797 17.2035 32.0776 17.2641 32.3371C17.3841 32.853 17.5215 33.5238 17.6671 34.2612C17.7615 34.7351 17.8589 35.2407 17.9543 35.7402C18.1492 36.7484 18.3389 37.733 18.4846 38.3915C18.5427 38.6545 18.6522 38.9035 18.8066 39.1243C18.961 39.345 19.1574 39.5332 19.3845 39.6781C19.6117 39.8229 19.8651 39.9216 20.1304 39.9685C20.3957 40.0154 20.6677 40.0096 20.9307 39.9514C21.1937 39.8933 21.4428 39.7838 21.6635 39.6294C21.8843 39.475 22.0724 39.2786 22.2173 39.0515C22.3622 38.8243 22.4609 38.5709 22.5078 38.3056C22.5547 38.0403 22.5489 37.7684 22.4907 37.5053C22.3574 36.9002 22.1861 36.0181 22.0004 35.052C21.9009 34.5371 21.7974 33.9987 21.6927 33.4664C21.5593 32.778 21.415 32.0917 21.2599 31.4079C21.1981 31.136 21.129 30.8659 21.0527 30.5977C21.0015 30.4253 20.8969 30.0664 20.7184 29.7536C20.5527 29.4914 20.3726 29.2387 20.1789 28.9966L20.1687 28.9843C19.9492 28.6982 19.6579 28.3279 19.3276 27.9084L19.0784 27.5915C18.3003 26.6059 17.5283 25.6155 16.7625 24.6203L19.6466 18.6787H19.6456ZM12.3913 31.1074L9.46307 27.0387L8.62205 29.4582L3.52054 28.2592C2.99092 28.1348 2.43356 28.2258 1.97107 28.5123C1.50858 28.7988 1.17884 29.2573 1.0544 29.7869C0.929948 30.3165 1.02099 30.8739 1.30748 31.3364C1.59398 31.7988 2.05247 32.1286 2.58208 32.253L9.48255 33.8746C9.97623 33.9904 10.4953 33.9193 10.9397 33.675C11.384 33.4307 11.7221 33.0304 11.8887 32.5515L12.3913 31.1084V31.1074Z" fill="#585C5D" stroke="#727272" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"/>
                <path fill-rule="evenodd" clip-rule="evenodd" d="M24.0774 8.20508C24.8934 8.20508 25.6761 7.88091 26.2531 7.30388C26.8301 6.72685 27.1543 5.94422 27.1543 5.12818C27.1543 4.31213 26.8301 3.52951 26.2531 2.95248C25.6761 2.37544 24.8934 2.05127 24.0774 2.05127C23.2613 2.05127 22.4787 2.37544 21.9017 2.95248C21.3247 3.52951 21.0005 4.31213 21.0005 5.12818C21.0005 5.94422 21.3247 6.72685 21.9017 7.30388C22.4787 7.88091 23.2613 8.20508 24.0774 8.20508V8.20508ZM24.0774 10.2564C25.4375 10.2564 26.7418 9.71607 27.7036 8.75435C28.6653 7.79263 29.2056 6.48825 29.2056 5.12818C29.2056 3.7681 28.6653 2.46373 27.7036 1.50201C26.7418 0.540289 25.4375 0 24.0774 0C22.7173 0 21.4129 0.540289 20.4512 1.50201C19.4895 2.46373 18.9492 3.7681 18.9492 5.12818C18.9492 6.48825 19.4895 7.79263 20.4512 8.75435C21.4129 9.71607 22.7173 10.2564 24.0774 10.2564V10.2564Z" fill="#585C5D"/>
            </svg>
        </div>
        <div class="text-container">
            <p class="category_name">액티비티</p>
            <p class="category_desc">러닝·등산·트래킹·산책·플로깅·헬스·자전거·보드 등</p>
        </div>
    </div>

    <div class="category-selection">
        <div class="category-container">
            <svg width="140" height="140" viewBox="0 0 36 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M9.42308 0V6.15385H12.5V0H9.42308ZM15.5769 1.53846V6.15385H18.6538V1.53846H15.5769ZM0 7.69231L0.192308 9.37538L2.98154 35.8646C3.22769 38.2031 5.24615 40 7.59692 40H22.0185C24.3692 40 26.3877 38.2031 26.6338 35.8646L27.3569 29.2308H30.9615C33.4923 29.2308 35.5769 27.1462 35.5769 24.6154V20C35.5769 17.4692 33.4923 15.3846 30.9615 15.3846H28.7985L29.4231 9.37538L29.6154 7.69231H0ZM3.46154 10.7692H26.1538L23.5569 35.5292C23.5208 35.9117 23.3429 36.2668 23.0582 36.5248C22.7735 36.7827 22.4026 36.9248 22.0185 36.9231H7.59692C6.79846 36.9231 6.14308 36.3277 6.05846 35.5292L3.46154 10.7692ZM28.4615 18.4615H30.9615C31.8323 18.4615 32.5 19.1292 32.5 20V24.6154C32.5 25.4862 31.8323 26.1538 30.9615 26.1538H27.6446L28.4615 18.4615Z" fill="#585C5D"/>
            </svg>
        </div>
        <div class="text-container">
            <p class="category_name">요리</p>
            <p class="category_desc">카페·디저트·요리·커피·맥주·와인·칵테일 등</p>
        </div>
    </div>

    <div class="category-selection">
        <div class="category-container">
            <svg width="140" height="140" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M14.586 20.0018C13.9901 19.9848 13.397 20.089 12.8426 20.3082C12.2882 20.5273 11.7842 20.8569 11.361 21.2768C10.5107 22.1297 10.0332 23.2849 10.0332 24.4893C10.0332 25.6936 10.5107 26.8488 11.361 27.7017C11.804 28.1713 12.3389 28.5446 12.9324 28.7984C13.526 29.0522 14.1655 29.181 14.811 29.1767C15.3862 29.1784 15.956 29.0666 16.4879 28.8479C17.0199 28.6291 17.5034 28.3076 17.911 27.9017C18.7613 27.0488 19.2388 25.8936 19.2388 24.6893C19.2388 23.4849 18.7613 22.3297 17.911 21.4768C17.0375 20.5702 15.8443 20.0409 14.586 20.0018ZM15.761 25.6767C15.4537 25.9249 15.0654 26.0505 14.671 26.0296C14.2766 26.0086 13.9038 25.8425 13.6245 25.5632C13.3452 25.2839 13.1791 24.9112 13.1582 24.5168C13.1372 24.1223 13.2629 23.7341 13.511 23.4268C13.7691 23.1866 14.1084 23.0527 14.461 23.0518C14.8821 23.0851 15.2791 23.2616 15.586 23.5518C15.7379 23.6792 15.863 23.8355 15.9541 24.0116C16.0452 24.1877 16.1005 24.3801 16.1168 24.5777C16.1331 24.7754 16.11 24.9742 16.0489 25.1629C15.9878 25.3515 15.89 25.5262 15.761 25.6767Z" fill="#CCCCCC"/>
                <path d="M35.4349 8.97491L40.0098 4.39996L35.6099 0L31.0349 4.57496V6.69994L26.535 11.2749C24.8461 9.98883 22.8056 9.24762 20.685 9.14991C19.3967 9.08742 18.1094 9.29288 16.9045 9.75331C15.6997 10.2137 14.6034 10.9191 13.6851 11.8249C12.6545 12.7798 11.8073 13.9152 11.1851 15.1749C11.0717 15.5039 10.8733 15.7971 10.6101 16.0248C10.2861 16.0608 9.95914 16.0608 9.63514 16.0248C8.51664 15.8516 7.37281 15.9522 6.3017 16.3179C5.23059 16.6837 4.26414 17.3037 3.4852 18.1248C2.32192 19.2821 1.41222 20.6688 0.813962 22.1967C0.215708 23.7246 -0.0580068 25.3603 0.0102299 26.9997C0.175434 30.4718 1.65901 33.75 4.15834 36.1657C6.65767 38.5814 9.98446 39.9526 13.4601 39.9996C15.0305 40.0122 16.5879 39.7139 18.0424 39.1218C19.497 38.5297 20.8199 37.6555 21.935 36.5496C22.7517 35.7682 23.367 34.8007 23.7284 33.7297C24.0897 32.6587 24.1864 31.5162 24.01 30.3997C23.9739 30.0757 23.9739 29.7487 24.01 29.4247C24.2421 29.1665 24.5339 28.9691 24.86 28.8497C26.1255 28.2371 27.2625 27.3886 28.21 26.3497C29.115 25.4361 29.8202 24.3443 30.2807 23.1435C30.7412 21.9427 30.947 20.6593 30.8849 19.3748C30.8036 17.2434 30.0609 15.1902 28.76 13.4999L33.3349 8.92491L35.4349 8.97491ZM27.81 19.4498C27.8583 20.3159 27.723 21.1823 27.4128 21.9923C27.1025 22.8024 26.6245 23.5376 26.01 24.1498C25.3137 24.9586 24.464 25.6213 23.51 26.0997C22.8566 26.3616 22.2679 26.7625 21.785 27.2747C21.3971 27.7312 21.1188 28.2705 20.9715 28.8511C20.8241 29.4318 20.8117 30.0385 20.935 30.6247C21.08 31.304 21.0455 32.0092 20.8351 32.6712C20.6247 33.3331 20.2456 33.9288 19.735 34.3997C17.8556 36.1238 15.37 37.0339 12.8216 36.9308C10.2732 36.8277 7.86924 35.72 6.13517 33.8497C4.25726 32.0002 3.14963 29.508 3.0352 26.8747C2.97491 25.658 3.16575 24.4419 3.59585 23.3021C4.02595 22.1624 4.6861 21.1234 5.53518 20.2498C6.00754 19.7413 6.60338 19.3636 7.26483 19.1533C7.92627 18.943 8.63085 18.9074 9.31014 19.0498C9.8963 19.1751 10.5034 19.1636 11.0844 19.0162C11.6654 18.8688 12.2046 18.5894 12.6601 18.1998C13.1697 17.7094 13.5775 17.1232 13.8601 16.4748C14.3172 15.5144 14.9734 14.6623 15.7851 13.9749C16.3982 13.3617 17.1336 12.8844 17.9434 12.5743C18.7531 12.2642 19.6192 12.1281 20.485 12.1749C21.8415 12.2398 23.1549 12.6719 24.285 13.4249L18.5101 19.3248L20.71 21.5248L26.56 15.6498C27.313 16.78 27.745 18.0934 27.81 19.4498Z" fill="#585C5D"/>
            </svg>
        </div>
        <div class="text-container">
            <p class="category_name">게임</p>
            <p class="category_desc">인터넷 게임/보드게임/방탈출 등</p>
        </div>
    </div>

    <div class="category-selection">
        <div class="category-container">
            <svg width="140" height="140" viewBox="0 0 37 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M30.2098 13.3333C28.882 13.3333 27.5841 12.9423 26.4801 12.2098C25.3761 11.4773 24.5156 10.4361 24.0075 9.21789C23.4994 7.99972 23.3665 6.65927 23.6255 5.36607C23.8845 4.07286 24.5239 2.88497 25.4628 1.95262C26.4017 1.02027 27.5978 0.385336 28.9001 0.128101C30.2023 -0.129134 31.5522 0.00288854 32.7789 0.507473C34.0055 1.01206 35.054 1.86654 35.7917 2.96287C36.5293 4.0592 36.9231 5.34813 36.9231 6.66667C36.9209 8.4341 36.2129 10.1285 34.9543 11.3783C33.6958 12.628 31.9896 13.3311 30.2098 13.3333ZM30.2098 3.33334C29.5459 3.33334 28.8969 3.52883 28.3449 3.8951C27.7929 4.26138 27.3627 4.78197 27.1087 5.39106C26.8546 6.00014 26.7881 6.67037 26.9176 7.31697C27.0472 7.96357 27.3669 8.55752 27.8363 9.02369C28.3057 9.48987 28.9038 9.80734 29.5549 9.93595C30.2061 10.0646 30.881 9.99856 31.4943 9.74627C32.1077 9.49398 32.6319 9.06673 33.0007 8.51857C33.3696 7.97041 33.5664 7.32594 33.5664 6.66667C33.5655 5.78289 33.2116 4.93555 32.5823 4.31062C31.953 3.68569 31.0998 3.33422 30.2098 3.33334V3.33334ZM33.5664 30H26.5964L25.4769 23.3333H30.2098V20H3.35664V23.3333H8.08951L6.97007 30H0V33.3333H6.41119L5.29175 40H8.69371L9.81315 33.3333H23.7516L24.871 40H28.2747L27.1552 33.3333H33.5664V30ZM10.372 30L11.4898 23.3333H22.075L23.1927 30H10.372Z" fill="#585C5D"/>
            </svg>
        </div>
        <div class="text-container">
            <p class="category_name">여행</p>
            <p class="category_desc">국내여행·해외여행·캠핑·드라이브·테마파크 등</p>
        </div>
    </div>

    <div class="category-selection">
        <div class="category-container">
            <svg width="140" height="140" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M8.57143 2.85714V8.57143H2.85714V2.85714H8.57143ZM0 0V11.4286H11.4286V0H0ZM22.8571 7.14286V12.8571H17.1429V7.14286H22.8571ZM14.2857 4.28571V15.7143H25.7143V4.28571H14.2857ZM8.57143 20V25.7143H2.85714V20H8.57143ZM0 17.1429V28.5714H11.4286V17.1429H0Z" fill="#585C5D"/>
                <path d="M28.5706 11.4287V20.0001H19.9992V28.5716H11.4277V40.0001H39.9992V11.4287H28.5706ZM22.8563 22.8573H28.5706V28.5716H22.8563V22.8573ZM19.9992 37.143H14.2849V31.4287H19.9992V37.143ZM28.5706 37.143H22.8563V31.4287H28.5706V37.143ZM37.142 37.143H31.4277V31.4287H37.142V37.143ZM37.142 28.5716H31.4277V22.8573H37.142V28.5716ZM31.4277 20.0001V14.2859H37.142V20.0001H31.4277Z" fill="#585C5D"/>
            </svg>
        </div>
        <div class="text-container">
            <p class="category_name">자기계발</p>
            <p class="category_desc">독서·스터디·커리어·글쓰기·드로잉·영상편집·DIY 등</p>
        </div>
    </div>

    <div class="category-selection">
        <div class="category-container">
            <svg width="140" height="140" viewBox="0 0 41 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M29.2683 21.4634C26.2114 18.6992 23.4959 16.0572 21.122 13.5376C18.748 11.0166 17.561 8.65041 17.561 6.43902C17.561 4.61789 18.1789 3.08943 19.4146 1.85366C20.6504 0.617886 22.1789 0 24 0C25.0407 0 26.0163 0.219187 26.9268 0.657561C27.8374 1.09724 28.6179 1.69106 29.2683 2.43902C29.9187 1.69106 30.6992 1.09724 31.6098 0.657561C32.5203 0.219187 33.4959 0 34.5366 0C36.3577 0 37.8862 0.617886 39.1219 1.85366C40.3577 3.08943 40.9756 4.61789 40.9756 6.43902C40.9756 8.65041 39.7886 11.0166 37.4146 13.5376C35.0406 16.0572 32.3252 18.6992 29.2683 21.4634ZM29.2683 16.1951C31.187 14.374 32.9678 12.5607 34.6107 10.7551C36.2524 8.95089 37.0732 7.5122 37.0732 6.43902C37.0732 5.69106 36.8377 5.08098 36.3668 4.60878C35.8946 4.13789 35.2846 3.90244 34.5366 3.90244C34.0813 3.90244 33.6507 3.99155 33.2449 4.16976C32.8377 4.34927 32.4878 4.61789 32.1951 4.97561L29.2683 8.48781L26.3415 4.97561C26.0488 4.61789 25.6995 4.34927 25.2937 4.16976C24.8865 3.99155 24.4553 3.90244 24 3.90244C23.252 3.90244 22.6426 4.13789 22.1717 4.60878C21.6995 5.08098 21.4634 5.69106 21.4634 6.43902C21.4634 7.5122 22.2842 8.95089 23.9259 10.7551C25.5688 12.5607 27.3496 14.374 29.2683 16.1951ZM25.3659 40L11.7073 36.1951V39.0244H0V17.561H15.5122L31.2195 23.4146V27.3171H40.9756V35.122L25.3659 40ZM3.90244 35.122H7.80488V21.4634H3.90244V35.122ZM25.2683 35.9024L36.878 32.2927V31.2195H23.0732L16.9756 29.1707L18.1463 25.4634L23.8537 27.3171H27.3171V26.0488L14.8293 21.4634H11.7073V32.1951L25.2683 35.9024Z" fill="#585C5D"/>
            </svg>
        </div>
        <div class="text-container">
            <p class="category_name">외국어</p>
            <p class="category_desc">외국어  스터디, 영어회화 모임 등</p>
        </div>
    </div>

    <div class="category-selection">
        <div class="category-container">
            <svg width="140" height="140" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M39.9325 14.1102L30.1494 0.132231C30.1203 0.0912354 30.0835 0.0581204 30.0419 0.0352592C30.0002 0.0123979 29.9546 0.00035704 29.9084 0H10.0916C9.99999 0 9.90843 0.0495864 9.8506 0.132231L0.0674558 14.1102C0.0221603 14.1757 -0.00166915 14.2573 9.09677e-05 14.3408C0.00185109 14.4243 0.0290899 14.5045 0.0770942 14.5675L19.7687 39.8843C19.8265 39.9614 19.9133 40 20 40C20.0867 40 20.1687 39.9559 20.2313 39.8843L39.9229 14.5675C39.9709 14.5045 39.9981 14.4243 39.9999 14.3408C40.0017 14.2573 39.9778 14.1757 39.9325 14.1102V14.1102ZM26.4193 3.16253L28.0771 10.5399L21.6916 3.16253H26.4193ZM26.8145 12.9972H13.1855L20 5.12397L26.8145 12.9972V12.9972ZM13.5807 3.16253H18.3084L11.9181 10.5399L13.5807 3.16253ZM11.0072 3.54821L8.88192 12.9972H4.39517L11.0072 3.54821V3.54821ZM4.7036 15.7521H9.253L15.3157 29.3994L4.7036 15.7521V15.7521ZM20 33.8512L11.9566 15.7521H28.0386L20 33.8512ZM24.6795 29.3994L30.747 15.7521H35.2964L24.6795 29.3994ZM31.1181 12.9972L28.9928 3.54821L35.6048 12.9972H31.1181V12.9972Z" fill="#585C5D"/>
            </svg>
        </div>
        <div class="text-container">
            <p class="category_name">재테크</p>
            <p class="category_desc">재테크 공부, 세미나 수강 등</p>
        </div>
    </div>

    <a href="/club/add/loc">
        <svg class="next_button" width="700" height="250" viewBox="0 0 350 50" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect width="350" height="50" rx="20" fill="#46675C"/>
            <path d="M171.896 17.9347H173.772V30.9407H171.896V17.9347ZM173.352 22.7367H175.648V24.2627H173.352V22.7367ZM164.112 26.2787H165.204C167.388 26.2787 169.11 26.2087 171.014 25.8727L171.196 27.4127C169.236 27.7627 167.458 27.8187 165.204 27.8187H164.112V26.2787ZM164.112 19.1387H170.16V20.6367H165.96V27.0207H164.112V19.1387ZM182.353 18.1867C185.209 18.1867 187.043 19.1527 187.043 20.7207C187.043 22.2887 185.209 23.2407 182.353 23.2407C179.497 23.2407 177.663 22.2887 177.663 20.7207C177.663 19.1527 179.497 18.1867 182.353 18.1867ZM182.353 19.6287C180.575 19.6287 179.581 19.9787 179.581 20.7207C179.581 21.4487 180.575 21.8127 182.353 21.8127C184.117 21.8127 185.125 21.4487 185.125 20.7207C185.125 19.9787 184.117 19.6287 182.353 19.6287ZM177.845 26.3487H186.805V30.7727H177.845V26.3487ZM184.985 27.8187H179.679V29.3027H184.985V27.8187ZM176.487 23.9827H188.205V25.4527H176.487V23.9827Z" fill="white"/>
        </svg>
    </a>
</main>
</body>
</html>