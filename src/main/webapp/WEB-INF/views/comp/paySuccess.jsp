<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>결제 완료</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <style>
        .card-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }
        .card {
            width: 70%; /* Adjust the width as needed, or set a max-width */
            height: 50%;
            margin: auto; /* For horizontal centering */
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
            background-color: white; /* Assuming card background is white */
        }

        .card-header {
            background-color: #00a2ff;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .card-header h2 {
            margin: 0;
            font-size: 2.5em;
        }

        .card-header span {
            display: block;
            margin-top: 10px;
            font-size: 0.9em;
        }

        .card-content {
            padding: 20px;
        }

        .info {
            margin-bottom: 20px;
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .info-title {
            font-weight: bold;
            color: #666;
        }

        .info-value {
            color: #333;
        }

        .info-note {
            font-size: 0.8em;
            color: #666;
            margin-bottom: 20px;
        }

        button {
            width: 100%;
            height: 80px;
            padding: 10px;
            border: none;
            background-color: #00a2ff;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1.5em;
        }

        .card-content span {
            font-size: 1.5em;
        }
    </style>
</head>
<body>
<main>
    <div class="card-container">
    <div class="card">
        <div class="card-header">
            <h2>결제완료</h2>
        </div>
        <div class="card-content">
            <div class="info">
                <div class="info-row">
                    <span class="info-title">거래처</span>
                    <span class="info-value">Gmarket</span>
                </div>
                <div class="info-row">
                    <span class="info-title">결제금액</span>
                    <span class="info-value">23,240 원</span>
                </div>
                <div class="info-row">
                    <span class="info-title">결제일시</span>
                    <span class="info-value">2017-12-26 10:52:16</span>
                </div>
                <div class="info-row">
                    <span class="info-title">결제카드</span>
                    <span class="info-value">4518-****-****-052*</span>
                </div>
            </div>
            <div class="info-note">
                <p>유의사항 노출 영역입니다. 본문에 실제 내용을 입력하세요.</p>
            </div>
            <button type="button">확인</button>
        </div>
    </div>
    </div>
</main>
</body>
<script>
    window.onload = function() {

        insertSettleInfo();
    };


    function insertSettleInfo(){
        var params = {};
        params.matchHistNo=  sessionStorage.getItem('matchHistNo'); //매치히스토리 번호
        params.settleAmount=sessionStorage.getItem('settleAmount'); //총결제 금액
        params.productsNo=sessionStorage.getItem('productsNo'); //상품번호
        params.settleMemberId=sessionStorage.getItem('settleMemberId'); //결제 하는사람
        params.recipentMemberNo=sessionStorage.getItem('recipentMemberNo'); //결제 받는 사람

        $.ajax({
            type: 'POST',
            url: 'https://www.h-club.site/comp/settle',
            // url: '/hyndai/comp/settle',
            data: JSON.stringify(params),
            dataType: 'json',
            contentType: 'application/json', // 추가: 요청의 Content-Type 설정
            success: function(response){

                console.log(response);
                //정보들 초기화
                clearSessionSettleInfo();
            },
            error: function(xhr, status, error){
                // 에러 처리
                alert("Error: " + error);
            }
        });
    }

    function clearSessionSettleInfo(){
        sessionStorage.setItem('matchHistNo', '');
        sessionStorage.setItem('settleAmount', '');
        sessionStorage.setItem('productsNo', '');
        sessionStorage.setItem('settleMemberId', '');
        sessionStorage.setItem('recipentMemberNo', '');
    }
</script>
</html>
