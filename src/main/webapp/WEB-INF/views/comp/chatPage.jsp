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
    	width: 150px; 
    	height: 150px; 
    	border-radius: 50%; 
    	border: 2px solid #333; 
     }
     #profileDiv{
     	margin: 70px;
     }
     .profile{
     	display:inline-block;
     	font-size: 30px;
     	margin: 0px 50px 0px 0px;
     }
     .profile2{
     	display:inline-block;
     	font-size: 30px;
     }
     #chatArea{
     	margin: 20px 20px 0px 0px;
     	font-size: 30px;     
     }
     .otherContent{
     	background-color: #D5D5D5;
     	margin:20px;
     }
     .basChat{
     	height:150px;
     	width:500px;
     	border-radius:30px;
     	padding:20px;
     }
     .myContent{
      	background-color: powderblue;
      	margin: 20px 300px 20px 400px;
     }
     .basDate{
     	color: #747474;
     }
     .ohterDate{
     	margin: 0px 0px 20px 50px;
     }
     .myDate{
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
      #chatTxt{
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
      	font-size:45px;
    	margin-bottom:10px;
      }
      #satus{
      	padding : 0px 40px 0px 0px;
      }
     
      /* 프로필 컨테이너 */
	  #profileDiv {
		  display: flex;
		  justify-content: center;
		  align-items: center;
	  }
}
      
</style>
</head>
<body>
<main>
<div style="display: flex;margin: auto;display: block;">
    <img style="height: 50px;width: 50px;color: #46675c;margin-top: 65px;margin-left: 58px" onclick="history.back()" src="/resources/image/left-arrow.png">
    <div class="club"></div>
</div>   
<div id="profileDiv">
	<div class="profile">
		<img id ="myProfileImg" />
	</div>
	<div class="profile">
		<div id="otherInfo">
			<div id="nickName"></div>
			<div>
				<span id="dept"></span> &nbsp;<span id="position">
			</div>
		</div>
	</div>
</div>
<div id="chatArea"  style="height: 1389px;overflow: overlay;">
	<div id="message"></div>
</div>
<div id="inputArea">
  <input type="text" id="chatTxt" name="chatTxt" placeholder="메시지를 입력해주세요.">
  <div id="msgSendBtn" onclick="sendChat()">전송</div>

</div>
<!-- 공통 모달 페이지 -->
 <%@ include file="../common/modal.jsp" %>
</main>
 <!-- websocket javascript -->
<script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=643e03d7f19df83b3f4191ad" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>    
<script type="text/javascript">

	    var servername = '<%=request.getServerName()%>';
	    <%-- var wsUriToWeb = "wss://<%=request.getServerName()%>:<%=request.getServerPort()%>/ws/chat"; //주소 확인!! --%>
	     var wsUriToWeb = "wss://www.h-club.site/comp/ws/chat"; 
	
	     /* 	var wsUriToWeb = "wss://http://13.209.23.148:8083/comp/ws/chat"; */
	  /*   //http://13.209.23.148:8083/comp/ws/chat */
	    //if(servername == "localhost")
<%-- 	    wsUriToWeb = "ws://<%=request.getServerName()%>:<%=request.getServerPort()%>/ws/chat"; //주소 확인!! --%>
	    if(servername == "localhost")	 
	    	wsUriToWeb = "ws://<%=request.getServerName()%>:<%=request.getServerPort()%>/compTest/comp/ws/chat"; //주소 확인!!

	    let websocketToWeb = null;
	
	    let imageUrl ='';
	    var urdata =  localStorage.getItem("currentUserNo");
	    
	  //  localStorage.setItem("otherUserNo", "5"); // 추후 주석처리
	    let otherUserNo = localStorage.getItem("otherUserNo");
	    let otherUserName = localStorage.getItem("otherUserName");
	    let otherUserId = localStorage.getItem("otherUserId")
	    
		chatValidationCheck();
	    // accessToken정보를 넣어 해당 userID 조회
	    getUserInfo(accessTokenInfo);
	    console.log("urdata:"+urdata);
	    	
	    var otherUseridx;
	    var messagePop = 0;
	
	    //화면에 접속하면 소켓오픈
	    if(urdata!= null && urdata!="" && urdata!="null" )
	      initToWeb();
	
	    function initToWeb() {
	    	websocketToWeb = new WebSocket(wsUriToWeb);
	    	websocketToWeb.onopen = function(evt) {
	    		onOpenToWeb(evt);
	    	};
	
	    	websocketToWeb.onmessage = function(evt) {
	    		onMessageToWeb(evt);
	    	};
	
	    	websocketToWeb.onerror = function(evt) {
	    		onErrorToWeb(evt);
	    	};
	
	    	websocketToWeb.onclose = function(evt) {
	    		console.log("reconnect");
	    	};
	    }    
	    
	    function onOpenToWeb(evt) {
	    	console.log("webserver open");
	    }

	    function onErrorToWeb(evt) {
	    	console.log("onErrorToWEb");
	    }

	    function doSendToWeb(message) {
	    	websocketToWeb.send(message);
	    }
	    
	    function onMessageToWeb(evt) { // 받은 메세지를 보여준다
	    	try {
	    		let obj = JSON.parse(evt.data);
	    		console.log("obj : ", obj);

	    		if (obj.protocol == "doLogin") {
	    			//웹소켓 접속이 정상적으로 작동
	    			if (urdata != null && urdata != 'null' && urdata != '') {
	    				let obj = new Object;
	    				obj.protocol = "login";
	    				//본인의 번호 session에 저장
	    				obj.userIdx = urdata;
	    				//서버로 패킷을 전송
	    				doSendToWeb(JSON.stringify(obj));
	    			}
	    		}
	    		else if (obj.protocol == "showRoom") {
	    			otherUseridx = obj.otherUseridx;
	    			$("#other").html(otherUseridx+"님과의 대화");
	    			$("#room").show();
	    			messagePop = 1;
	    			//추후에 대화내역 prepend하기
	    		}
	    		else if (obj.protocol == "sendChat") {
	    			
	    			let fromUser = obj.fromUser;
	    			let toUser = obj.toUser;
	    			let chatMsg = obj.chatMsg;
	    			let time = obj.time;
	    			//보낸사람
	    			console.log("onMessageToWeb sendChat fromUser:"+fromUser+" urdata:"+urdata);
	    			if(urdata==fromUser){
	    				//메세지만 추가	    		
	    				$("#message").append("<div class='myContent basChat'>"
	    						+chatMsg+"</div><div class='myDate basDate'>"+time+"</div>");
	    			}
	    			//받는사람
	    			else if(urdata==toUser){
	 
	    				//알람
	    				if(messagePop == 0)
	    					$("#alarm").show();
	    				else if(messagePop == 1)
	    					$("#message").append("<div class='otherContent basChat'>"
	    							+chatMsg+"</div><div class='ohterDate basDate'>"+time+"</div>");
	    			}
	    			
	    			$("#other").html(toUser+"님과의 대화");
	    			$("#room").show();
	    			//추후에 대화내역 prepend하기
	    		}
	    	} catch (err) {
	    		console.log("[protocol]" + wpro + " " + err.message);
	    	}
	    }
	    function chatValidationCheck(){
	        if(urdata ==  null || otherUserNo == null){
		    	setModalMsg("채팅을 진행할 수 없습니다.");
		    	getModalMesage(); 
		    	return false;
		    }
	        return true;
	    }
	    function getRandomNumber(min, max) {
    	  return Math.floor(Math.random() * (max - min + 1)) + min;
    	}
	    //서버에다가 채팅방 create선언 패킷 전송
	    function createRoom(otherUseridx) {
	   
	        let obj = new Object; 
	        obj.protocol = "createRoom";
	        //상대 회원번호 l
	        obj.otherUseridx = otherUseridx;
	        otherUseridx = otherUseridx; //추가
	        doSendToWeb(JSON.stringify(obj));
	        console.log("createRoom");
	    }
	    function sendChat() {
	    	console.log("sendChat");
	        let obj = new Object;
	        obj.protocol = "sendChat";
	        //상대 회원번호 
	        obj.otherUseridx = otherUseridx;
	        obj.chatMsg = $("#chatTxt").val();
	        doSendToWeb(JSON.stringify(obj));
	        
	        //메시지 보낸 후에 초기화
	        $("#chatTxt").val('');
	    }
	    function setData(obj){
	    	  //본인의 번호 session에 저장
			obj.userIdx = urdata;
			//서버로 패킷을 전송
			doSendToWeb(JSON.stringify(obj));
	    }
	    function getUserInfo(accessToken) { //accessToken
	    	var params= {};
	        params.memberId = otherUserId;
	        
	        $.ajax({
	            type: 'POST',
	            url: 'https://www.h-club.site/auth/getMemberId',
	            data: JSON.stringify(params),
	            //url: 'http://localhost/hyndai/auth/getMemberId',
	            contentType: 'application/json',
	            headers: {
	                'Authorization': 'Bearer ' + accessTokenInfo // accessToken 사용
	            },
	            success: function(response) {
	               console.log('사용자 정보:', response);
	                // urdata = response.userNo;
	                $("#nickName").text(response.data.employeeName);
	                $("#dept").text(response.data.employeeDept);
	                $("#position").text(response.data.employeePosition);
	                imageUrl = response.data.memberImage;
	              
	                //프론트에서 default 이미지 설정
	                if(imageUrl == null ){
	                	imageUrl='/resources/image/default_image.png';
	                }
	                $("#myProfileImg").attr('src', imageUrl);
	                createRoom(otherUserNo); //현재 방과 내방을 기준으로 createRoom
	            },
	            error: function(xhr, status, error) {
	                console.error('사용자 정보 가져오기 실패:', error);
	            }
	        });
	    }
 	</script>
</body>
</html>