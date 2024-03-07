<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/club.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>동아리 개설</title>
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <style>
        .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:24px;}
        .map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
        .map_wrap {position:relative;width:100%;height:700px;}
        #menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:20px;border-radius: 10px;}
        .bg_white {background:#fff;}
        #menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
        #menu_wrap .option{text-align: center;}
        #menu_wrap .option p {margin:10px 0;}
        #menu_wrap .option button {margin-left:5px;}
        #placesList li {list-style: none;}
        #placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px; font-size: 40px}
        #placesList .item span {display: block;margin-top:4px;}
        #placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
        #placesList .item .info{padding:10px 0 10px 55px;}
        #placesList .info .gray {color:#8a8a8a;}
        #placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
        #placesList .info .tel {color:#009900;}
        #placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:20px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
        #placesList .item .marker_1 {background-position: 0 -10px;}
        #placesList .item .marker_2 {background-position: 0 -56px;}
        #placesList .item .marker_3 {background-position: 0 -102px}
        #placesList .item .marker_4 {background-position: 0 -148px;}
        #placesList .item .marker_5 {background-position: 0 -194px;}
        #placesList .item .marker_6 {background-position: 0 -240px;}
        #placesList .item .marker_7 {background-position: 0 -286px;}
        #placesList .item .marker_8 {background-position: 0 -332px;}
        #placesList .item .marker_9 {background-position: 0 -378px;}
        #placesList .item .marker_10 {background-position: 0 -423px;}
        #placesList .item .marker_11 {background-position: 0 -470px;}
        #placesList .item .marker_12 {background-position: 0 -516px;}
        #placesList .item .marker_13 {background-position: 0 -562px;}
        #placesList .item .marker_14 {background-position: 0 -608px;}
        #placesList .item .marker_15 {background-position: 0 -654px;}
        #pagination {margin:10px auto;text-align: center;}
        #pagination a {display:inline-block;margin-right:10px;}
        #pagination .on {font-weight: 500; cursor: default;color:#777;}
    </style>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a9cfd814dc94ab10ad564b4959ffe28&libraries=services"></script>
</head>

<body>
<main class="main-container">
    <div style="display: flex">
        <img style="height: 50px;width: 50px;color: #46675c;margin-top: 65px;" onclick="history.back()" src="/resources/image/left-arrow.png">
        <p class="plus-title">어디서 만나시나요?</p>
    </div>
    <svg viewBox="0 0 205 3" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect width="66.33%" height="1" fill="#46675C"/>
    </svg>

    <ul>
        <li style="list-style: none; text-align: center; margin-top: 40px">
            <input type = "text" id ="keyword" placeholder = "장소를 검색해주세요." style="font-size: 56px; text-align: center;width: 800px;margin-top: 40px;">
        </li>
        <li style="list-style: none; text-align: center; margin-top: 40px">
            <input type = "text" id ="address" style="font-size: 40px; text-align: center;border:0px;width: 700px;">
        </li>
    </ul>
    <ul id = "placesList"></ul>

    <a href="/club/add/detail">
        <svg class="next_button" width="700" height="250" viewBox="0 0 350 50" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect width="350" height="50" rx="20" fill="#46675C"/>
            <path d="M171.896 17.9347H173.772V30.9407H171.896V17.9347ZM173.352 22.7367H175.648V24.2627H173.352V22.7367ZM164.112 26.2787H165.204C167.388 26.2787 169.11 26.2087 171.014 25.8727L171.196 27.4127C169.236 27.7627 167.458 27.8187 165.204 27.8187H164.112V26.2787ZM164.112 19.1387H170.16V20.6367H165.96V27.0207H164.112V19.1387ZM182.353 18.1867C185.209 18.1867 187.043 19.1527 187.043 20.7207C187.043 22.2887 185.209 23.2407 182.353 23.2407C179.497 23.2407 177.663 22.2887 177.663 20.7207C177.663 19.1527 179.497 18.1867 182.353 18.1867ZM182.353 19.6287C180.575 19.6287 179.581 19.9787 179.581 20.7207C179.581 21.4487 180.575 21.8127 182.353 21.8127C184.117 21.8127 185.125 21.4487 185.125 20.7207C185.125 19.9787 184.117 19.6287 182.353 19.6287ZM177.845 26.3487H186.805V30.7727H177.845V26.3487ZM184.985 27.8187H179.679V29.3027H184.985V27.8187ZM176.487 23.9827H188.205V25.4527H176.487V23.9827Z" fill="white"/>
        </svg>
    </a>

    <script>
        $('#keyword').change(function(){
            searchPlaces();
        });

        var ps = new kakao.maps.services.Places();

        var listEl = document.getElementById('placesList');

        function searchPlaces() {

            var keyword = document.getElementById('keyword').value;

            if (!keyword.replace(/^\s+|\s+$/g, '')) {
                removeAllChildNods(listEl);
                return false;
            }

            ps.keywordSearch( keyword, placesSearchCB);
        }

        function placesSearchCB(data, status, pagination) {

            if (status === kakao.maps.services.Status.OK) {

                displayPlaces(data);


            } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
                removeAllChildNods(listEl);
                return;

            } else if (status === kakao.maps.services.Status.ERROR) {

                return;

            }
        }

        function displayPlaces(places) {

            var fragment = document.createDocumentFragment();

            removeAllChildNods(listEl);

            for (var i = 0; i < places.length; i++) {
                var itemEl = getListItem(i, places[i]);

                (function (place) {
                    itemEl.onclick = function () {
                        var key = document.getElementById('keyword');
                        var address = document.getElementById('address');

                        key.value = place.place_name;
                        address.value = place.road_address_name || place.address_name;

                        sessionStorage.setItem('clubLoc', key.value);
                        sessionStorage.setItem('clubAddress', address.value);

                        removeAllChildNods(listEl);
                    };
                })(places[i]);

                fragment.appendChild(itemEl);
            }

            listEl.appendChild(fragment);
        }

        function getListItem(index, places) {

            var el = document.createElement('li'),
                itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                    '<div class="info">' +
                    '   <span class = "info-title"><b>' + places.place_name + '</b></span>';

            if (places.road_address_name) {
                itemStr += '    <br><span class = "info-address"><small>' + places.road_address_name + '</small></span>'
            } else {
                itemStr += '    <br><span class = "info-address"><small>' +  places.address_name  + '</small></span>';
            }

            el.innerHTML = itemStr;
            el.className = 'item';

            return el;
        }

        function removeAllChildNods(el) {
            while (el.hasChildNodes()) {
                el.removeChild (el.lastChild);
            }
        }
    </script>
</main>
</body>
</html>