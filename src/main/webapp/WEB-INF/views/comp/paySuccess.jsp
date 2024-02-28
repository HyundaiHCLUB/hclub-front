<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/main.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main>
<h2>결제 성공 페이지</h2>
</main>

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
</body>
</html>