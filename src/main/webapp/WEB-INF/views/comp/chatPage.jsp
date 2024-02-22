<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 페이지</title>
<link rel="stylesheet" href="/resources/css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	#myProfileImg{
    	width: 180px;
        height: 180px;
        border-radius: 50%;
        object-fit: cover; /* 이미지 비율을 유지하면서 요소에 맞게 조정 */
        margin-right:10px;
     }
     #profileDiv{
     	margin: 70px;
     }
     .profile{
     	display:inline-block;
     	font-size: 30px;
     	margin: 0px 50px 0px 0px;
     }
     #chatArea{
     	margin: 20px 20px 0px 0px;
     	font-size: 30px;     
     }
     .myContent{
     	background-color: #D5D5D5;
     	margin:20px;
     }
      .basChat{
     	height:150px;
     	width:500px;
     	border-radius:30px;
     	padding:20px;
     }
     .otherContent{
      	background-color: powderblue;
      	margin: 20px 300px 20px 400px;
     }
     .basDate{
     	color: #747474;
     }
     .myDate{
     	margin: 0px 0px 20px 50px;
     }
     .ohterDate{
     	margin: 20px 0px 20px 780px;
     	padding:0px;
     }
      input[type="text"]{
	     font-size: 30px; 
     	 padding: 30px 30px; 
         border: 1px solid #ccc; 
       	 border-radius: 20px;
        
         box-sizing: border-box;
         margin: 30px 20px 30px 30px; 
         height:90px;
      }
      #message{
        width: 700px;
       
      }
      #msgSendBtn{
        font-size: 30px; 
     	 padding: 20px 30px 30px 20px; 
         border: 1px solid #ccc; 
       	 border-radius: 20px;
         width: 180px; 
         box-sizing: border-box;
         height:90px;
         text-align: center;
         display:inline-block;
         font-weight:bold;
         color:teal;
         margin:auto;
         background-color:white;
      }
      #inputArea{
      	position:fixed;
      	display:flex;
      	bottom: 150px;      
      }
      #nickName{
      	font-weight:bold;
      	font-size:35px;
      	margin-bottom:20px;
      }
      #satus{
      	padding : 0px 40px 0px 0px;
      }
</style>
</head>
<body>
<main>
<div id="profileDiv">
	<div class="profile">
		<img id ="myProfileImg" src="https://img.freepik.com/free-photo/basketball-game-concept_23-2150910692.jpg?size=626&ext=jpg&ga=GA1.1.1141335507.1707523200&semt=sph"/>
	</div>
	<div class="profile">
		<div id="nickName">포르투갈손흥민</div>
		<div id="satus">*Online</div>
	</div>
	<div class="profile">
		<span>버튼버튼</span>
	</div>
</div>
<div id="chatArea"  style="height: 1389px;overflow: overlay;">

	<div class="myContent basChat">
	 어느 장소가 좋으신지요.
	</div>
	<div class="myDate basDate">
	 2:55 PM
	</div>


	<div class="otherContent basChat"> 
 	제 생각에는 서초구 인근이 좋을거 같습니다!
	</div>
	<div class="ohterDate basDate">
		 3:08 PM
	</div>	
	
	<div class="myContent basChat">
	  좋아요!
	</div>
	<div class="myDate basDate">
	 3:12 PM
	</div>
	<div class="otherContent basChat">
	 네네 ~~
	</div>
	<div class="ohterDate basDate">
		 3:20 PM
	</div>	
	<div class="myContent basChat">
	 그러면 그때 뵙겠습니다.
	</div>
	<div class="myDate basDate">
	 3:34 PM
	</div>
	<div class="otherContent basChat">
	 네네 ~~
	</div>
	<div class="ohterDate basDate">
		 3:20 PM
	</div>	
	<div class="myContent basChat">
	 그러면 그때 뵙겠습니다.
	</div>
	<div class="myDate basDate">
	 3:34 PM
	</div>
</div>
<div id="inputArea">
  <input type="text" id="message" name="message" placeholder="메시지를 입력해주세요.">
  <div id="msgSendBtn" onclick="test()">전송</div>

</div>


</main>
</body>
</html>