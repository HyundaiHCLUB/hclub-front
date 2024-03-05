<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<script>

//모달창 확인 클릭시 이동 여부를 지정한다 => 기본 Default는 Y이고, 아닐시에만 N
let moveYn ="N";

//모달창 호출시 띄울 메세지를 출력한다. =>호출할 위치에서 메세지 셋팅.
//setModalMsg("테스트 신청 메세지");
//모달창을 click Trigger을 건다. => 호출할 위치에서 셋팅함.
//getModalMesage(); 
//모달창 확인 클릭시 이동할 위치를 지정한다.
//moveLoc="/modal"; 

function setConfirmModalMsg(msg){
	$("#modalMsg").text(msg);
}

function getConfirmModalMesage(){
	$("[data-toggle='modal']").trigger("click");
}

$(window).on("load", function() {
    //공통 모달의 css를 onload시 변경
	 $('#modalMsg').css({
	        'font-size': '26px',
	        'font-weight': 'bold',
	        'text-align': 'center'
	 });
	 $('.modal-content').css({
	        'width': '600px',
	        'padding': '10px'
	 });
});

</script>
<style>
	.confirmBtn{
		font-weight:bold; 
		cursor:pointer; 
		color:#46675c;
		margin: 10px;
		width: 150px;
		
	}
</style>
<body>
<main>
   <a data-toggle="modal" data-target="#myModal">
        <!-- <svg class="next_button" width="700" height="250"  viewBox="0 0 350 50" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect width="350" height="50" rx="20" fill="#EF7353"/>
            <path d="M159.633 18.9627H161.509V28.4127H159.633V18.9627ZM152.871 30.2047H161.831V31.6887H152.871V30.2047ZM152.871 27.5027H154.733V30.9747H152.871V27.5027ZM153.767 19.6627H155.307V20.9227C155.307 23.4567 154.145 25.7947 151.625 26.6767L150.687 25.1927C152.857 24.4507 153.767 22.6447 153.767 20.9227V19.6627ZM154.145 19.6627H155.671V20.9227C155.671 22.6167 156.553 24.2827 158.681 24.9687L157.729 26.4527C155.279 25.6267 154.145 23.4287 154.145 20.9227V19.6627ZM166.52 21.2167H168.018V21.6927C168.018 23.9467 166.87 25.9767 164.392 26.6907L163.524 25.2347C165.61 24.6467 166.52 23.1627 166.52 21.6927V21.2167ZM166.87 21.2167H168.382V21.6927C168.382 23.0227 169.306 24.3807 171.392 24.9267L170.552 26.3687C168.06 25.7107 166.87 23.8207 166.87 21.6927V21.2167ZM163.972 20.2927H170.93V21.7487H163.972V20.2927ZM166.52 18.9067H168.382V20.8667H166.52V18.9067ZM170.566 22.4067H173.044V23.9047H170.566V22.4067ZM172.596 18.9487H174.458V26.7747H172.596V18.9487ZM170.062 26.9987C172.806 26.9987 174.5 27.8947 174.5 29.4487C174.5 31.0027 172.806 31.9127 170.062 31.9127C167.318 31.9127 165.624 31.0027 165.624 29.4487C165.624 27.8947 167.318 26.9987 170.062 26.9987ZM170.062 28.4127C168.368 28.4127 167.486 28.7487 167.486 29.4487C167.486 30.1487 168.368 30.4987 170.062 30.4987C171.77 30.4987 172.652 30.1487 172.652 29.4487C172.652 28.7487 171.77 28.4127 170.062 28.4127ZM184.803 18.9487H186.651V31.9127H184.803V18.9487ZM186.231 24.0027H188.527V25.5567H186.231V24.0027ZM176.431 20.8667H183.977V22.3507H176.431V20.8667ZM180.225 23.0787C182.115 23.0787 183.515 24.3667 183.515 26.1727C183.515 27.9787 182.115 29.2667 180.225 29.2667C178.335 29.2667 176.935 27.9787 176.935 26.1727C176.935 24.3667 178.335 23.0787 180.225 23.0787ZM180.225 24.5907C179.343 24.5907 178.713 25.1787 178.713 26.1727C178.713 27.1667 179.343 27.7547 180.225 27.7547C181.107 27.7547 181.737 27.1667 181.737 26.1727C181.737 25.1787 181.107 24.5907 180.225 24.5907ZM179.287 19.1587H181.149V21.4267H179.287V19.1587ZM198.298 18.9487H200.174V31.9127H198.298V18.9487ZM194.476 20.2927H196.324C196.324 24.2547 194.98 27.5027 190.374 29.7287L189.408 28.2447C193.132 26.4527 194.476 24.1007 194.476 20.6287V20.2927ZM190.094 20.2927H195.358V21.7627H190.094V20.2927Z" fill="white"/>
        </svg> -->
       <!--  테스트 -->
    </a>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
                <div class="modal-header">
                    <svg width="56" height="56" viewBox="0 0 56 56" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect x="4" y="4" width="48" height="48" rx="24" fill="#FEE4E2"/>
                        <rect x="4" y="4" width="48" height="48" rx="24" stroke="#FEF3F2" stroke-width="8"/>
                        <path d="M25.1438 30.6858L24.2196 31.0677L25.1438 30.6858ZM24.9184 30.2337L24.1282 30.8465L24.9184 30.2337ZM31.0816 30.2337L31.8718 30.8465L31.0816 30.2337ZM33 25C33 26.6366 32.2147 28.0895 30.9962 29.0033L32.1961 30.6034C33.8966 29.3282 35 27.2928 35 25H33ZM28 20C30.7614 20 33 22.2386 33 25H35C35 21.134 31.866 18 28 18V20ZM23 25C23 22.2386 25.2386 20 28 20V18C24.134 18 21 21.134 21 25H23ZM25.0038 29.0033C23.7853 28.0895 23 26.6366 23 25H21C21 27.2928 22.1034 29.3282 23.8039 30.6034L25.0038 29.0033ZM26.9973 34.743C26.9654 33.2148 26.6489 31.7097 26.068 30.3039L24.2196 31.0677C24.706 32.2449 24.971 33.5051 24.9978 34.7848L26.9973 34.743ZM29.3416 34.2111C28.4971 34.6334 27.5029 34.6334 26.6584 34.2111L25.7639 36C27.1716 36.7038 28.8284 36.7038 30.2361 36L29.3416 34.2111ZM29.932 30.3039C29.3511 31.7097 29.0346 33.2148 29.0027 34.743L31.0022 34.7848C31.029 33.5051 31.294 32.2449 31.7804 31.0677L29.932 30.3039ZM30.2361 36C30.708 35.764 30.9917 35.2888 31.0022 34.7848L29.0027 34.743C29.0072 34.5284 29.1285 34.3177 29.3416 34.2111L30.2361 36ZM24.9978 34.7848C25.0083 35.2888 25.292 35.764 25.7639 36L26.6584 34.2111C26.8715 34.3177 26.9928 34.5284 26.9973 34.743L24.9978 34.7848ZM23.8039 30.6034C23.9548 30.7165 24.043 30.7829 24.1052 30.8338C24.1678 30.885 24.156 30.8824 24.1282 30.8465L25.7086 29.6209C25.5215 29.3795 25.2307 29.1734 25.0038 29.0033L23.8039 30.6034ZM26.068 30.3039C25.9896 30.1144 25.8913 29.8565 25.7086 29.6209L24.1282 30.8465C24.1147 30.8291 24.1121 30.8197 24.1252 30.8469C24.1331 30.8632 24.1439 30.8872 24.1602 30.9253C24.1767 30.9639 24.1951 31.0086 24.2196 31.0677L26.068 30.3039ZM30.9962 29.0033C30.7693 29.1734 30.4785 29.3795 30.2914 29.6209L31.8718 30.8465C31.844 30.8824 31.8322 30.885 31.8948 30.8338C31.957 30.7829 32.0452 30.7165 32.1961 30.6034L30.9962 29.0033ZM31.7804 31.0677C31.8049 31.0086 31.8233 30.9639 31.8398 30.9253C31.8561 30.8872 31.8669 30.8632 31.8748 30.8469C31.8879 30.8197 31.8853 30.8291 31.8718 30.8465L30.2914 29.6209C30.1087 29.8565 30.0104 30.1144 29.932 30.3039L31.7804 31.0677Z" fill="#B31312"/>
                        <path d="M30.992 31V31C29.181 32.2106 26.8189 32.2106 25.0078 31V31" stroke="#B31312" stroke-width="2"/>
                    </svg>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id ="modalMsg" style="font-size: 20px;font-weight: bold; text-align: center;">메세지</p>
                </div>
                    <a>
                        <div style="text-align: center;margin-bottom:20px;">
                       
						<input type="button" onclick="confirmFlag()" value="확인" class="confirmBtn"  data-dismiss="modal" aria-label="Close" data-dismiss="modal"  value="취소" viewBox="0 0 347 48" fill="none" xmlns="http://www.w3.org/2000/svg" >
						<input type="button" class="confirmBtn " data-dismiss="modal" aria-label="Close" data-dismiss="modal"  value="취소" viewBox="0 0 347 48" fill="none" xmlns="http://www.w3.org/2000/svg" >
                        </div>
                    </a>
            </div>
        </div>
    </div>
 </main>

</body>
</html>