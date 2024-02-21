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
     	font-size: 25px;
     	font-wiehgt: bold;
     	margin: 0px 0px 50px 30px;
     }
   	.checkbox-display{
   		border: 1px solid black;
   		border-radius:15px;
   		padding:10px 15px 10px 15px;
   		width:fit-content;
   		margin: 15px 0px 0px 10px;
   		display: inline-block;
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
		  	<div class="scndTitle">관심사를 선택해주세요!</div><br/>
		    <div class="thrdTitle">취향에 맞는 동아리를 선택해주세요!</div>
		  </div>
		  <div class="smDiv">
		  	  <span class="smTitle">액티비티</span><br/>
		  	 	<div class="smLine">
			  	 	<div class="checkbox-display">
				     클라이밍
				    </div>
				    <div class="checkbox-display">
				     워킹
				    </div>
				    <div class="checkbox-display">
				     스키/보드
				    </div>
		  	 	</div>
		  	 	<div class="smLine">
			  	 	<div class="checkbox-display">
				     다이어트
				    </div>
				    <div class="checkbox-display">
				     요가
				    </div>
				    <div class="checkbox-display">
					 헬스
				    </div>
				     <div class="checkbox-display">
					 볼링
				    </div>
		  	 	</div>
		  	 	<div class="smLine">
			  	 	<div class="checkbox-display">
				     풋살
				    </div>
				    <div class="checkbox-display">
				     농구
				    </div>
				    <div class="checkbox-display">
					 야구
				    </div>
				     <div class="checkbox-display">
					 축구
				    </div>
		  	 	</div>
		  	 	<div class="smLine">
			  	 	<div class="checkbox-display">
				     플로깅
				    </div>
				    <div class="checkbox-display">
				     수영
				    </div>
				    <div class="checkbox-display">
					 자전거
				    </div>
		  	 	</div>
		  </div>
		  <div class="smDiv">
		  	<span class="smTitle">문화/예술</span><br/>
		  	<div class="smLine">
			 	<div class="checkbox-display">
				     영화
				 </div>
				 <div class="checkbox-display">
				     전시
				 </div>
				 <div class="checkbox-display">
				     뮤지컬
				  </div>
		  	 </div>
		  	 <div class="smLine">
			  	<div class="checkbox-display">
				     공연
			    </div>
			    <div class="checkbox-display">
			    	 팝업
				 </div>
				 <div class="checkbox-display">
					 콘서트
				  </div>
		  	 </div>
		  </div>
		  <div class="smDiv">
		  	<span class="smTitle">요리</span><br/>
		  	<div class="smLine">
			 	<div class="checkbox-display">
				     와인
				 </div>
				 <div class="checkbox-display">
				     베이킹
				 </div>
				 <div class="checkbox-display">
				     카페
				 </div>
				  <div class="checkbox-display">
				     요리
				 </div>
		  	 </div>
		  </div>
		  <div class="smDiv">
		  	<span class="smTitle">자기계발</span><br/>
		  	<div class="smLine">
			 	<div class="checkbox-display">
				     프로그래밍
				 </div>
				 <div class="checkbox-display">
				     자격증
				 </div>
				 <div class="checkbox-display">
				     독서
				 </div>
				  <div class="checkbox-display">
				     스터디
				 </div>
				  <div class="checkbox-display">
				     스피치
				 </div>
		  	 </div>
		  </div>
		  <div class="smDiv">
		  	<span class="smTitle">투자</span><br/>
		  	<div class="smLine">
			 	<div class="checkbox-display">
				     주식
				 </div>
				 <div class="checkbox-display">
				     경제
				 </div>
				 <div class="checkbox-display">
				     부동산
				 </div>
		  	 </div>
		  </div>
		   <div class="smDiv">
		  	<span class="smTitle">외국어</span><br/>
		  	<div class="smLine">
			 	<div class="checkbox-display">
				     영어
				 </div>
				 <div class="checkbox-display">
				     중국어
				 </div>
				 <div class="checkbox-display">
				     일본어
				 </div>
		  	 </div>
		  </div>
		  <div class="smDiv">
		  	<span class="smTitle">여행</span><br/>
		  	<div class="smLine">
			 	<div class="checkbox-display">
				     백패킹
				 </div>
				 <div class="checkbox-display">
				     로드트립
				 </div>
				 <div class="checkbox-display">
				     크루즈
				 </div>
		  	 </div>
		  </div>
		   <div class="smDiv">
		  	<span class="smTitle">게임</span><br/>
		  	<div class="smLine">
			 	<div class="checkbox-display">
				     보드게임
				 </div>
				 <div class="checkbox-display">
				     온라인게임
				 </div>
				 <div class="checkbox-display">
				     체스
				 </div>
		  	 </div>
		  </div>
		  <div class="btnDiv">
		  	<input id="registerBtn" class="btn-class" type="button" value="회원가입"/>
		  </div>
		</form>
	</div>
</main>
</body>
</html>