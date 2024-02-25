<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#headr{
		margin: 100px 0px 50px 0px;
	}
	#title{
		text-align: center;
		font-size: 50px;
	}
    #registerFrm{
    	margin:100px 0px 50px 20px;
    }
    .btn-class{
    	font-size: 30px; 
     	padding: 30px 30px; 
        border: 1px solid #ccc; 
       	border-radius: 35px; 
        width: 90%; 
        box-sizing: border-box; 
        height:100px;
        margin : 30px 0px 30px 0px;
        background-color: #46675C;
        font-weight:bold;
        color:white;
     }
     .btnDiv{
     	text-align:center;
     	margin: 100px 0px 50px 0px
     }
     .scndTitle{
     	margin:0px 0px 0px 30px;
     	font-size :35px;
     	font-weight :bold;
     }
     .thrdTitle{
     	font-weight: bold;
     	font-size: 25px;
     	margin: 30px 0px 20px 20px;
     	color: dimgray;
     }
     #titleDiv{
     	margin: 10px 0px 50px 20px;
     }
     .smTitle{
     	font-weight: bold;
     	margin: 0px 0px 0px 10px;
     }
     .smDiv{
     	font-size: 33px;
     	font-wiehgt: bold;
     	margin: 0px 0px 50px 30px;
     }
   	.checkbox-display{
   		border: 2px solid  darkslategray;
   		color: darkslategrey;
   		border-radius:15px;
   		padding: 15px 35px 10px 27px;
   		width:fit-content;
   		margin: 15px 0px 0px 15px;
   		display: inline-block;
   		font-size: 30px;
   	}
</style>
</head>
<body>
<main>
<div id="header">

<h1 id="title">회원가입</h1>
</div>
	<div id="registerDiv">
		<form id="registerFrm">
		  <div id="titleDiv">
		  	<div class="scndTitle" style="font-size: 41px;">관심사를 선택해주세요!</div><br/>
		    <div class="thrdTitle" style="font-size: 29px;">취향에 맞는 동아리를 선택해주세요!</div>
		  </div>
		  <div class="smDiv">
		  	  <span class="smTitle">액티비티</span><br/>
		  	 	<div class="smLine">
			  	 	<div class="checkbox-display">
			  	 	<input class="label-checked" type="hidden"  value="클라이밍" name="interest"/>
				     클라이밍
				    </div>
				    <div class="checkbox-display">
				    <input class="label-checked" type="hidden" value="워킹" name="interest/">
				     워킹
				    </div>
				    <div class="checkbox-display">
				    <input class="label-checked" type="hidden" value="스키/보드" name="interest"/>
				     스키/보드
				    </div>
		  	 	</div>
		  	 	<div class="smLine">
			  	 	<div class="checkbox-display">
			  	 	<input class="label-checked" type="hidden" value="다이어트" name="interest/">
				     다이어트
				    </div>
				    <div class="checkbox-display">
				    <input class="label-checked" type="hidden" value="요가" name="interest/">
				     요가
				    </div>
				    <div class="checkbox-display">
				    <input class="label-checked" type="hidden" value="헬스" name="interest/">
					 헬스
				    </div>
				     <div class="checkbox-display">
				     <input class="label-checked" type="hidden" value="볼링" name="interest/">
					 볼링
				    </div>
		  	 	</div>
		  	 	<div class="smLine">
			  	 	<div class="checkbox-display">
			  	 	<input class="label-checked" type="hidden" value="풋살" name="interest/">
				     풋살
				    </div>
				    <div class="checkbox-display">
				    <input class="label-checked" type="hidden" value="농구" name="interest/">
				     농구
				    </div>
				    <div class="checkbox-display">
				    <input class="label-checked" type="hidden" value="야구" name="interest/">
					 야구
				    </div>
				     <div class="checkbox-display">
				     <input class="label-checked" type="hidden" value="축구" name="interest/">
					 축구
				    </div>
		  	 	</div>
		  	 	<div class="smLine">
			  	 	<div class="checkbox-display">
			  	 	<input class="label-checked" type="hidden" value="플로깅" name="interest/">
				     플로깅
				    </div>
				    <div class="checkbox-display">
				    <input class="label-checked" type="hidden" value="수영" name="interest/">
				     수영
				    </div>
				    <div class="checkbox-display">
				    <input class="label-checked" type="hidden" value="자전거" name="interest/">
					 자전거
				    </div>
		  	 	</div>
		  </div>
		  <div class="smDiv">
		  	<span class="smTitle">문화/예술</span><br/>
		  	<div class="smLine">
			 	<div class="checkbox-display">
			 	<input class="label-checked" type="hidden" value="영화" name="interest/">
				     영화
				 </div>
				 <div class="checkbox-display">
				 <input class="label-checked" type="hidden" value="전시" name="interest/">
				     전시
				 </div>
				 <div class="checkbox-display">
				 <input class="label-checked" type="hidden" value="뮤지컬" name="interest/">
				     뮤지컬
				  </div>
		  	 </div>
		  	 <div class="smLine">
			  	<div class="checkbox-display">
			  	<input class="label-checked" type="hidden" value="공연" name="interest/">
				     공연
			    </div>
			    <div class="checkbox-display">
			    <input class="label-checked" type="hidden" value="팝업" name="interest/">
			    	 팝업
				 </div>
				 <div class="checkbox-display">
				  <input class="label-checked" type="hidden" value="콘서트" name="interest/">
					 콘서트
				  </div>
		  	 </div>
		  </div>
		  <div class="smDiv">
		  	<span class="smTitle">요리</span><br/>
		  	<div class="smLine">
			 	<div class="checkbox-display">
			 	 <input class="label-checked" type="hidden" value="와인" name="interest/">
				     와인
				 </div>
				 <div class="checkbox-display">
				  <input class="label-checked" type="hidden" value="베이킹" name="interest/">
				     베이킹
				 </div>
				 <div class="checkbox-display">
				  <input class="label-checked" type="hidden" value="카페" name="interest/">
				     카페
				 </div>
				  <div class="checkbox-display">
				   <input class="label-checked" type="hidden" value="요리" name="interest/">
				     요리
				 </div>
		  	 </div>
		  </div>
		  <div class="smDiv">
		  	<span class="smTitle">자기계발</span><br/>
		  	<div class="smLine">
			 	<div class="checkbox-display">
			 	 <input class="label-checked" type="hidden" value="프로그래밍" name="interest/">
				     프로그래밍
				 </div>
				 <div class="checkbox-display">
				  <input class="label-checked" type="hidden" value="자격증" name="interest/">
				     자격증
				 </div>
				 
		  	 </div>
		  	 <div class="smLine">
		  	 	<div class="checkbox-display">
				  <input class="label-checked" type="hidden" value="독서" name="interest/">
				     독서
				 </div>
				  <div class="checkbox-display">
				   <input class="label-checked" type="hidden" value="스터디" name="interest/">
				     스터디
				 </div>
				  <div class="checkbox-display">
				   <input class="label-checked" type="hidden" value="스피치" name="interest/">
				     스피치
				 </div>
		  	 </div>
		  </div>
		  <div class="smDiv">
		  	<span class="smTitle">투자</span><br/>
		  	<div class="smLine">
			 	<div class="checkbox-display">
			 	 <input class="label-checked" type="hidden" value="주식" name="interest/">
				     주식
				 </div>
				 <div class="checkbox-display">
				  <input class="label-checked" type="hidden" value="경제" name="interest/">
				     경제
				 </div>
				 <div class="checkbox-display">
				  <input class="label-checked" type="hidden" value="부동산" name="interest/">
				     부동산
				 </div>
		  	 </div>
		  </div>
		   <div class="smDiv">
		  	<span class="smTitle">외국어</span><br/>
		  	<div class="smLine">
			 	<div class="checkbox-display">
			 	 <input class="label-checked" type="hidden" value="영어" name="interest/">
				     영어
				 </div>
				 <div class="checkbox-display">
				  <input class="label-checked" type="hidden" value="중국어" name="interest/">
				     중국어
				 </div>
				 <div class="checkbox-display">
				  <input class="label-checked" type="hidden" value="일본어" name="interest/">
				     일본어
				 </div>
		  	 </div>
		  </div>
		  <div class="smDiv">
		  	<span class="smTitle">여행</span><br/>
		  	<div class="smLine">
			 	<div class="checkbox-display">
			 	 <input class="label-checked" type="hidden" value="백패킹" name="interest/">
				     백패킹
				 </div>
				 <div class="checkbox-display">
				  <input class="label-checked" type="hidden" value="로드트립" name="interest/">
				     로드트립
				 </div>
				 <div class="checkbox-display">
				  <input class="label-checked" type="hidden" value="크루즈" name="interest/">
				     크루즈
				 </div>
		  	 </div>
		  </div>
		   <div class="smDiv">
		  	<span class="smTitle">게임</span><br/>
		  	<div class="smLine">
			 	<div class="checkbox-display">
			 	 <input class="label-checked" type="hidden" value="보드게임" name="interest/">
				     보드게임
				 </div>
				 <div class="checkbox-display">
				  <input class="label-checked" type="hidden" value="온라인게임" name="interest/">
				     온라인게임
				 </div>
				 <div class="checkbox-display">
				  <input class="label-checked" type="hidden" value="체스" name="interest/">
				     체스
				 </div>
		  	 </div>
		  </div>
		  <div class="btnDiv">
		  	<input id="registerBtn" class="btn-class" type="button" value="회원가입" onclick="registerData()"/>
		  </div>
		</form>
	</div>
</main>
<script>
//obj 배열 선언
var interestObj = [];

// checkbox-display 클래스를 가진 요소를 클릭할 때 실행될 함수
$(".checkbox-display").click(function() {
    // 클릭된 요소 내의 하위 input 타입 요소를 선택합니다.
    var inputElement = $(this).find('input[type="hidden"]');
    
    // input 타입 요소의 값을 가져옵니다.
    var value = inputElement.val();
    
    // obj에 해당 값이 존재하는지 확인합니다.
    var existingValueIndex = interestObj.indexOf(value);
    
    // obj에 해당 값이 존재하는 경우
    if (existingValueIndex !== -1) {
        // 해당 값이 obj에 있으므로 제거합니다.
        interestObj.splice(existingValueIndex, 1);
        $(this).css("background-color", "white");
        $(this).css("color", "darkslategrey");
    } else {
        // 해당 값이 obj에 없으므로 추가합니다.
        interestObj.push(value);
        $(this).css("background-color", "darkslategrey");
        $(this).css("color", "white");
    }
});

function registerData(){
	//세션 스토리지에서 데이터 가져오기
	var storedData = sessionStorage.getItem('userData');

	// JSON 형태의 문자열을 다시 객체로 변환
	var userData = JSON.parse(storedData); //userData.memberId ex
	userData.memberInterest= makeInterestString();
	userData.adminYn = 'N';
	
    $.ajax({
        type: 'POST',
        url: 'https://www.h-club.site/auth/register',
        //url: '/hyndai/auth/register',
        /*headers: {
            'Authorization': 'Bearer ' + accessTokenInfo // accessToken 사용
        },*/
        contentType: 'application/json',
        data: JSON.stringify(userData),
        success: function(response) { 
             console.log(response);
          
             //회원가입 기본정보 넣기 완료시 interest정보 넣기
             registerIntrest();
        },
        error: function(xhr, status, error) {
            console.error('회원가입 기본정보 넣기 실패:', error);
           
        }
    });
}

function makeInterestString(){
	var resultString = "";
	for (var i = 0; i < interestObj.length; i++) {
	    resultString += interestObj[i];
	    if (i < interestObj.length - 1) {
	        resultString += ",";
	    }
	}
	
	console.log(resultString);
	return resultString;
}
function registerIntrest(){
	//세션 스토리지에서 데이터 가져오기
	var storedData = sessionStorage.getItem('userData');

	// JSON 형태의 문자열을 다시 객체로 변환
	var userData = JSON.parse(storedData); //userData.memberId ex
	userData.memberInterest= makeInterestString();
	userData.adminYn = 'N';
	
    $.ajax({
        type: 'POST',
        url: 'https://www.h-club.site/auth/interest',
        //url: '/hyndai/auth/register',
        /*headers: {
            'Authorization': 'Bearer ' + accessTokenInfo // accessToken 사용
        },*/
        contentType: 'application/json',
        data: JSON.stringify(userData),
        success: function(response) { 
             console.log(response);
             alert("회원가입이 완료되었습니다.");
             //회원가입 완료시 로그인 페이지로 이동
         	 location.href='/login/loginView' ;
        },
        error: function(xhr, status, error) {
            console.error('회원가입 interset정보 넣기 실패:', error);
           
        }
    });
}


</script>
</body>
</html>